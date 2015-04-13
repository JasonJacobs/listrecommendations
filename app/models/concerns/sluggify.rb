module Sluggify
  include ActiveSupport::Inflector
  extend self

  def call(val)
    val.parameterize
  end

end
