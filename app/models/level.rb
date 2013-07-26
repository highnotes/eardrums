class Level < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  
  validates_presence_of :index
  validates_numericality_of :index, only_integer: true
  validates_uniqueness_of :index
  
  has_many :courses
  
  def self.beginner_levels
    Level.where(index: [1,2,3,4]).collect {|l| l.id }
  end
  
  def self.intermediate_levels
    Level.where(index: [5,6,7]).collect {|l| l.id }
  end
  
  def self.advanced_levels
    Level.where(index: [8,9,10]).collect {|l| l.id }
  end
  
  def self.special_levels
    Level.where(index: -1).collect {|l| l.id }
  end
end
