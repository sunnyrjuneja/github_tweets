class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.integer :gh_id
      t.string :name
      t.boolean :fork
      t.references :user, index: true
      t.references :account, index: true

      t.timestamps
    end
  end
end
