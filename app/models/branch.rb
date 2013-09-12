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
  validates_presence_of :created_by
  validates_presence_of :modified_by
  
  belongs_to :franchise
  has_and_belongs_to_many :courses
  has_many :staffs, -> { where type: 'Staff' }, class_name: 'User'
  has_many :enrollments
  has_many :rolls
  has_many :payments
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
  belongs_to :modifier, class_name: 'User', foreign_key: 'modified_by'
end
