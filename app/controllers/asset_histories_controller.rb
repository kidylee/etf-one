class AssetHistoriesController < ApplicationController
  authorize_resource
  
  before_action :set_asset_history, only: [:show, :edit]

  def index
    if params[:user_id] != nil
      @user = User.find_by_id(params[:user_id])  
    else
      @user = current_user
    end
    @asset_histories =  @user.asset_histories
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_history_params
      params.fetch(:asset_history, {})
    end
end
