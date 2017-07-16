class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :carts
  
  after_create :create_cart
  
  def cart
    carts.where(purchased: false).first
  end
  
  
  private
  
  def create_cart
    Card.create(user_id: self.id, shipping_option_id: ShippingOption.first.id)
  end
end
