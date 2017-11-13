class AssetHistory < ApplicationRecord
  belongs_to :user
  
  attr_accessor :user_email
  
  enum action_type: { manual_adjust: "Manual Adjust", deposit: "Deposit" }
  validates :asset_type, presence: true
  validates :amount, presence: true, exclusion: { in: [0], message: "Value can't be 0." }
  validates :amount, format: {with: /\A\-?\d{1,18}(?:\.\d{0,18})?\z/ },
    numericality: { greater_than: -99999999999999999, less_than: 99999999999999999 },
    length: { maximum: 37 }
    
  validates :created_by, presence: true, if: Proc.new { |a| a.action_type == :manual_adjust }


  private
  

end
