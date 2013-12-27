class AddOffersCountToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :offers_count, :integer, null: false, default: 0
  end
end
