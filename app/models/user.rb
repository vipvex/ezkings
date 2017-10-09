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
  
  def admin?
    true #self.id == 4
  end
  
  private
  
  def create_cart
    Cart.create(user_id: self.id, shipping_option_id: ShippingOption.first.id, state: 'CA')
  end
end
