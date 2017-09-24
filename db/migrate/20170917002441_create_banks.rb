class CreateBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :banks do |t|
      t.string :symbol
      t.string :name
      t.string :country
    end
  end
end
