class AddDateToDailyBalance < ActiveRecord::Migration[6.1]
  def change
    add_column :daily_balances, :date, :date
  end
end
