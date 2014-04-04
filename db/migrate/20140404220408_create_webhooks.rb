class CreateWebhooks < ActiveRecord::Migration
  def change
    create_table :webhooks do |t|
      t.references :user, index: true
      t.references :repository, index: true
      t.integer :gh_id

      t.timestamps
    end
  end
end
