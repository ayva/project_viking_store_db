class User < ActiveRecord::Base
  has_many :addresses
  has_many :orders
  has_many :products, through: :orders, source: :products

  belongs_to :billing_address, :foreign_key => :billing_id, :class_name => "Address"
  belongs_to :shipping_address, :foreign_key => :shipping_id, :class_name => "Address"
  

  def self.new_users(input_day)
    self.where("created_at > ?", input_day.days.ago).count
  end

end

