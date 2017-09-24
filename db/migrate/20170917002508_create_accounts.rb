class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :dni
      t.string :number
      t.references :account_type, foreign_key: true
      t.references :bank, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
