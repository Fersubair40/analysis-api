class CreateDailyBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_balances, id: :uuid do |t|
      t.decimal :balance
      t.belongs_to :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
