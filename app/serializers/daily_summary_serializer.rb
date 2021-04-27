class DailySummarySerializer < ActiveModel::Serializer
  attributes :id, :total, :date

  belongs_to :user
end
