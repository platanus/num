class CreateHandles < ActiveRecord::Migration
  def change
    create_table :handles do |t|
      t.string :handle
      t.boolean :verified, default: false

      t.timestamps null: false
    end
  end
end
