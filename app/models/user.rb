class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :cart
  
  after_create :create_cart
  
  
  private
  
  def create_cart
    Card.create(user_id: self.id)
  end
end
