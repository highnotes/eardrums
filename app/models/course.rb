class Course < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :status
  validates_presence_of :duration
  validates_presence_of :price
  
  validates_presence_of :level
  validates_presence_of :discipline
  
  belongs_to :level
  belongs_to :discipline
  has_many :lessons
end
