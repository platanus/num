class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.string :holder_name
      t.string :holder_id
      t.string :bank_name
      t.string :account_type
      t.string :account_number

      t.timestamps null: false
    end
  end
end
