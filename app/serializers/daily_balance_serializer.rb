class DailyBalanceSerializer < ActiveModel::Serializer
  attributes :id, :balance, :date
  belongs_to :account
end
