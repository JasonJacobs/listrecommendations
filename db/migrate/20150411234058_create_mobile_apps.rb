class CreateMobileApps < ActiveRecord::Migration
  def change
    create_table :mobile_apps do |t|
      t.references :app_store, index: true
      t.string :name
      t.string :description
      t.string :url
      t.string :thumbnail_url

      t.timestamps null: false
    end
    add_foreign_key :mobile_apps, :app_stores
  end
end
