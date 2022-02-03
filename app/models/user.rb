class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :book_registries, dependent: :destroy
  has_many :books, :through=> :book_registries, dependent: :destroy
  enum user_type: { Reader: 0, Admin: 1 } 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
