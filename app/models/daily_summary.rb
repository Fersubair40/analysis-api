class DailySummary < ApplicationRecord
  before_validation :set_total!

  belongs_to :user


def set_total!
  self.total =  DailyBalance.where(date: Date.today).sum(:balance)
end
  validates :date, presence: true
  validates :total, numericality: {greater_than_or_equal_to: 0}
  validates :total, presence: true
end
