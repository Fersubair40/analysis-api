class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password_digest, presence: true

  has_many :accounts, dependent: :destroy
  has_many :daily_summaries, dependent: :destroy
  has_many :daily_balances, through: :accounts, dependent: :destroy
end
