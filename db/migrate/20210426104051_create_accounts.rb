class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :name
      t.string :account_type
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
