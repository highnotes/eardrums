class Franchise < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :franchisees
  validates_presence_of :emails
  validates_presence_of :phones
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :country

  validates_presence_of :created_by
  validates_presence_of :modified_by
  
  has_many :branches
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
  belongs_to :modifier, class_name: 'User', foreign_key: 'modified_by'
end
