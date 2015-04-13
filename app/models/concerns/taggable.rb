module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings
  end

  def tag_with(*tags)
    tags.each {|t| taggings.create tag: t }
  end

  def tag_names=(names)
    names.split(",").each do |name|
      next if tags.map(&:name).include?(name)
      taggings.build tag: Tag.find_or_create_by(name: name)
    end
  end

  def tag_names
    tags.pluck(:name)
  end
end

