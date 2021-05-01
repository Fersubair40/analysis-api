class DailyBalance < ApplicationRecord

  self.implicit_order_column = "created_at"

  validates :account_id, presence: true
  validates :date, presence: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }, presence: true

  # scope :today_bal, -> { where('date == ?', Date.today) }

  belongs_to :account
end
