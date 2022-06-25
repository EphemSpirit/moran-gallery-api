class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
   admin: 0,
   customer: 1
  }

  has_many :reviews
  has_many :blogs
  has_one :cart

  # after_create :create_user_cart

  def create_user_cart
    cart = self.cart.create(user_id: self.id)
  end

end
