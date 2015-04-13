class MobileApp < ActiveRecord::Base
  belongs_to :app_store
  has_many :recommendations

  validates :app_store, presence: true

  validates :name, presence: true
  validates :description, presence: true

end
