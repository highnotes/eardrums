class Franchise < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :franchisees
  validates_presence_of :emails
  validates_presence_of :phones
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :country
  
  has_many :branches
end
