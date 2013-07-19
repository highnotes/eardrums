class Lesson < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :course
  
  validates_presence_of :index
  validates_numericality_of :index, only_integer: true
  validates_uniqueness_of :index, scope: :course
  
  belongs_to :course
  has_many :materials
end
