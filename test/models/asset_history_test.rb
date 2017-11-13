require 'test_helper'

class AssetHistoryTest < ActiveSupport::TestCase
  
  test "valid action type" do
    one = users(:one)

    @his = AssetHistory.new(action_type: :manual_adjust, created_by: one.email, user_id: one.id, asset_type: "BTC", amount: "9.111111111111231231231231231231111")

    assert @his.valid?
  end
  
   test "invalid action type" do
    one = users(:one)
    assert_raises ArgumentError do
        his = AssetHistory.new(action_type: :any)
    end
   
  end
  
   test "valid action type with created by" do
    one = users(:one)

    @his = AssetHistory.new(action_type: :deposit, user_id: one.id, asset_type: "BTC", amount: "0986097608768769876989797996968676586587576576578658765")

    assert @his.valid?
  end
end
