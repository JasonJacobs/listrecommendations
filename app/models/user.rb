class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recommendations
  has_many :lists

  validates :name, presence: true
  validates :email, presence: true

  acts_as_voter
end
