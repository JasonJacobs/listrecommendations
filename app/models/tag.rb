class Tag < ActiveRecord::Base
  include Sluggify

  has_many :taggings

  validates :name, presence: true

  def name=(val)
    write_attribute :name, val
    write_attribute :slug, Sluggify.call(val)
  end

end
