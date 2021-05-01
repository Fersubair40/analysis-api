class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :reset_password_token

  has_many :accounts
  has_many :daily_balances, through: :accounts
  has_many :daily_summaries
end
