class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname, presence: true

  has_many :commodities, dependent: :delete_all
  has_many :evaluations, dependent: :delete_all
  has_many :likes,       dependent: :delete_all
  has_many :commodities, through: :likes
  has_many :comments,    dependent: :delete_all
  has_many :commodities, through: :comments
  has_many :exhibition_commodities, dependent: :delete_all
  has_many :commodities, through: :exhibition_commodities
  has_many :purchase_commodities, dependent: :delete_all
  has_many :commodities, through: :purchase_commodities
  has_one :address, dependent: :delete
  has_one :profile, dependent: :delete
end
