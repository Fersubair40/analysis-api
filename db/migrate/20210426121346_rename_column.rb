class RenameColumn < ActiveRecord::Migration[6.1]
  def up
    rename_column :accounts, :type, :account_type
  end
end
