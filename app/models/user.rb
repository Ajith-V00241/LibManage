class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lend_request, dependent: :destroy
  has_many :lended_book, dependent: :destroy
  has_many :return_request, dependent: :destroy
end
