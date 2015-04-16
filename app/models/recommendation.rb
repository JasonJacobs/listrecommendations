class Recommendation < ActiveRecord::Base
  include Taggable

  belongs_to :mobile_app
  belongs_to :list

  validates :mobile_app, presence: true

end
