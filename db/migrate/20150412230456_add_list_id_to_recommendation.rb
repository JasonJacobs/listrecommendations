class AddListIdToRecommendation < ActiveRecord::Migration
  def change
    add_reference :recommendations, :list, index: true
    add_foreign_key :recommendations, :lists
  end
end
