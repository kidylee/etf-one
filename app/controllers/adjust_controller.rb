class AdjustController < ApplicationController
  authorize_resource :class => false

  def index
      @users = User.paginate(page: params[:page])
      render "index"
  end
  
  def edit
    @user = User.find_by_email(params[:email])
    
    if @user == nil
      redirect_to adjust_path
      return
    end  
    
    populate_assets
    render "edit"
  end
  
  def show
    @user = User.find_by_email(params[:email])
    respond_to do |format|
      format.html { render "adjust" }
      format.js
    end
  end  
  
  def create
    
    user = User.find_by_email(history_params[:user_email])

    @ah = user.asset_histories.build(history_params)
    
    unless @ah.valid?
      flash[:alert] = @ah.errors.full_messages
        respond_to do |format|
          format.html { redirect_to adjust_show_path email: history_params[:user_email], asset:  history_params[:asset_type] }
          format.js
        end
      return
    end
    @ah.action_type = :manual_adjust
    @ah.created_by = current_user.email
    
    asset = user.assets.find_by_symbol(@ah.asset_type)
    asset = user.assets.create(symbol: @ah.asset_type, amount: 0) unless asset
    
    
    
    asset.transaction do 
      begin
        asset.amount = asset.amount + @ah.amount
        asset.save!
        @ah.save!
        
        flash[:notice] = "Adjust success!"
        
        respond_to do |format|
          format.html { redirect_to user_history_path user_id: user.id }
          format.js
        end
        
      rescue ActiveRecord::RecordInvalid 
        flash[:alert] = @ah.errors.full_messages
        respond_to do |format|
          format.html { redirect_to adjust_show_path email: history_params[:user_email], asset:  history_params[:asset_type] }
          format.js
        end
        
      rescue Exception
        flash[:alert] = caller
        respond_to do |format|
          format.html { redirect_to adjust_show_path email: history_params[:user_email], asset:  history_params[:asset_type] }
          format.js
        end
      end
    end
    
  end  
  
  private
  
  def history_params 
    params.require(:asset_history).permit(:user_email, :asset_type, :amount)
  end
  
  def populate_assets
    @assets = Hash.new
    current_user.assets.map do |x|  
      @assets[x.symbol] = x.amount
    end
  end
  
end
