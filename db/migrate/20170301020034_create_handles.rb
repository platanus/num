class CreateHandles < ActiveRecord::Migration[4.2]
  def change
    create_table :handles do |t|
      t.string :handle
      t.boolean :verified, default: false

      t.timestamps null: false
    end
  end
end
