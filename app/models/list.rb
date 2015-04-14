class List < ActiveRecord::Base
  belongs_to :user
  has_many :recommendations

  accepts_nested_attributes_for :recommendations, :reject_if => lambda { |a| a[:full_name].blank? } 

end
