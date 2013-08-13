class Branch < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :subdomain
  validates_presence_of :status
  validates_presence_of :email
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :country
  validates_presence_of :phones
  
  belongs_to :franchise
  has_and_belongs_to_many :courses
  has_many :staffs, -> { where role: 'staff' }, class_name: 'User'
  has_many :enrollments
  has_many :rolls
end
