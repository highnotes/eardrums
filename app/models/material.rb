class Material < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :lesson
  validates_presence_of :type
  
  belongs_to :lesson
end
