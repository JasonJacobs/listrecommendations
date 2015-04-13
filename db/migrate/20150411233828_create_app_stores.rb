class CreateAppStores < ActiveRecord::Migration
  def change
    create_table :app_stores do |t|
      t.string :name
      t.string :description
      t.string :url

      t.timestamps null: false
    end
  end
end
