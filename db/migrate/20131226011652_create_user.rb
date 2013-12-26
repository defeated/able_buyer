class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :avatar

      t.string :provider
      t.string :uid

      t.index [ :provider, :uid ], unique: true
    end
  end
end
