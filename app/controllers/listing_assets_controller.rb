class ListingAssetsController < ApplicationController
  before_action :set_listing_asset, only: [:show]

  # GET /listing_assets
  # GET /listing_assets.json
  def index
    @listing_assets = ListingAsset.all
  end

  # GET /listing_assets/1
  # GET /listing_assets/1.json
  def show
  end

  # GET /listing_assets/new
  def new
    @listing_asset = ListingAsset.new
  end

  # GET /listing_assets/1/edit
  def edit
  end

  # POST /listing_assets
  # POST /listing_assets.json
  def create
    @listing_asset = ListingAsset.new(listing_asset_params)

    respond_to do |format|
      if @listing_asset.save
        format.html { redirect_to @listing_asset, notice: 'Listing asset was successfully created.' }
        format.json { render :show, status: :created, location: @listing_asset }
      else
        format.html { render :new }
        format.json { render json: @listing_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listing_assets/1
  # PATCH/PUT /listing_assets/1.json
  def update
    respond_to do |format|
      if @listing_asset.update(listing_asset_params)
        format.html { redirect_to @listing_asset, notice: 'Listing asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing_asset }
      else
        format.html { render :edit }
        format.json { render json: @listing_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listing_assets/1
  # DELETE /listing_assets/1.json
  def destroy
    @listing_asset.destroy
    respond_to do |format|
      format.html { redirect_to listing_assets_url, notice: 'Listing asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing_asset
      @listing_asset = ListingAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_asset_params
      params.require(:listing_asset).permit(:name)
    end
end
