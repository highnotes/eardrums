class Lesson < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :course
  
  belongs_to :course
  has_many :materials
end
