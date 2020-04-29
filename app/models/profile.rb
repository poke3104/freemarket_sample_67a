class Profile < ApplicationRecord
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :year_birth_at, :month_birth_at, :day_birth_at, presence: true

  belongs_to :user
end
