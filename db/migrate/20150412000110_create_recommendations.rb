class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.references :user, index: true
      t.references :mobile_app, index: true
      t.string :comment
      t.integer :rating

      t.timestamps null: false
    end
    add_foreign_key :recommendations, :users
    add_foreign_key :recommendations, :mobile_apps
  end
end
