class MobileApp < ActiveRecord::Base
  belongs_to :app_store
  has_many :recommendations

  validates :name, presence: true
  # validates :description, presence: true

end
