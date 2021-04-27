class Account < ApplicationRecord

  self.implicit_order_column = "created_at"

  belongs_to :user
  validates :name, :user_id, presence: true
  validates :account_type, presence: true

  has_many :daily_balances, dependent: :destroy
end
