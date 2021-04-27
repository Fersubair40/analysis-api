class UserSerializer < ActiveModel::Serializer
  attributes :id, :email

  has_many :accounts
  has_many :daily_summaries
  has_many :daily_balances, through: :accounts
end
