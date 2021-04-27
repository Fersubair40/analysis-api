class CreateDailySummaries < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_summaries, id: :uuid do |t|
      t.decimal :total
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
