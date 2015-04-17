class List < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :recommendations

  accepts_nested_attributes_for :recommendations, reject_if: proc { |attributes| attributes['mobile_app_id'].blank? }

end
