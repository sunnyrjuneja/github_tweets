class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.integer :uid
      t.string :nickname
      t.string :email
      t.string :name
      t.string :token
      t.string :remember_token

      t.timestamps
    end
  end
end
