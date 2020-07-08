class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lended_book, dependent: :destroy
  has_many :requests, dependent: :destroy
  validates_presence_of :phone, :address
  validates_uniqueness_of :phone
end
