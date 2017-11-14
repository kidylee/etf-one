require 'test_helper'

class ListingAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listing_asset = listing_assets(:one)
  end

  test "should get index" do
    get listing_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_listing_asset_url
    assert_response :success
  end

  test "should create listing_asset" do
    assert_difference('ListingAsset.count') do
      post listing_assets_url, params: { listing_asset: { name: @listing_asset.name } }
    end

    assert_redirected_to listing_asset_url(ListingAsset.last)
  end

  test "should show listing_asset" do
    get listing_asset_url(@listing_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_listing_asset_url(@listing_asset)
    assert_response :success
  end

  test "should update listing_asset" do
    patch listing_asset_url(@listing_asset), params: { listing_asset: { name: @listing_asset.name } }
    assert_redirected_to listing_asset_url(@listing_asset)
  end

  test "should destroy listing_asset" do
    assert_difference('ListingAsset.count', -1) do
      delete listing_asset_url(@listing_asset)
    end

    assert_redirected_to listing_assets_url
  end
end
