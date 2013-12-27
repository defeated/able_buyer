class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.belongs_to :house, null: false, default: 0
      t.belongs_to :user, null: false, default: 0

      t.integer :amount, null: false, default: 0
      t.datetime :offered_at, null: false
      t.datetime :replied_at, null: false
      t.string :reason, null: false, limit: 1024

      t.string :mls
      t.string :agent

      t.timestamps

      t.index [ :house_id, :user_id ], unique: true
    end
  end
end
