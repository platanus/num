class AddBankAccountToHandle < ActiveRecord::Migration[4.2]
  def change
    add_reference :handles, :bank_account, index: true, foreign_key: true
  end
end
