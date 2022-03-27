class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :nickname, presence: true
  validates :email, presence: true
  validates :telephone_number, presence: true, numericality: { only_integer: true }
  validates :postal_code, presence: true, numericality: { only_integer: true }
  validates :address, presence: true
  validates :email, presence: true

  has_many :comments, dependent: :destroy
  has_many :cart_items
  has_many :orders
end
