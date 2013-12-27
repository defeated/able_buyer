class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :address, null: false, limit: 500

      t.timestamps

      t.index :address, unique: true
    end
  end
end
