class AddBankAccountToHandle < ActiveRecord::Migration
  def change
    add_reference :handles, :bank_account, index: true, foreign_key: true
  end
end
