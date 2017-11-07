class AccountController < ApplicationController
  authorize_resource :class => false
  
  def index
    @assets = Hash.new
    current_user.assets.map do |x|  
      @assets[x.symbol] = x.amount
    end
    
  end
end
