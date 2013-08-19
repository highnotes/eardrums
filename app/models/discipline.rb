class Discipline < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  
  has_many :courses
  has_many :enrollments
  has_many :batches
end