class Recommendation < ActiveRecord::Base
  include Taggable

  belongs_to :mobile_app
  belongs_to :list
  belongs_to :user

  #validates :mobile_app, presence: true

end
