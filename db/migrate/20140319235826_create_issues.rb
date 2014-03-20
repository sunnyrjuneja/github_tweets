class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :title
      t.text :html_url

      t.timestamps
    end
  end
end
