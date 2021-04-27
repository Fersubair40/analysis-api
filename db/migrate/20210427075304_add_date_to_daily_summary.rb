class AddDateToDailySummary < ActiveRecord::Migration[6.1]
  def change
    add_column :daily_summaries, :date, :date
  end
end
