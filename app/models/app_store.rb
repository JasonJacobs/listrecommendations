class AppStore < ActiveRecord::Base
  has_many :mobile_apps

  validates :name, presence: true
end
