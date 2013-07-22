class Level < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  
  validates_presence_of :index
  validates_numericality_of :index, only_integer: true
  validates_uniqueness_of :index
  
  has_many :courses
end
