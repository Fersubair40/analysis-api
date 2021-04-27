class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :account_type
  belongs_to :user
  has_many :daily_balances
end
