class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :action
      t.text :title
      t.integer :number
      t.text :html_url
      t.string :login
      t.references :repository, index: true

      t.timestamps
    end
  end
end
