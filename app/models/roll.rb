class Roll < ActiveRecord::Base
  validates_presence_of :student_id
  validates_presence_of :branch_id
  validates_presence_of :course_id
  validates_presence_of :duration
  validates_presence_of :attended
  validates_presence_of :to_end_on
  
  validates_numericality_of :student_id, only_integer: true
  validates_numericality_of :branch_id, only_integer: true
  validates_numericality_of :course_id, only_integer: true
  validates_numericality_of :duration, only_integer: true
  validates_numericality_of :attended, only_integer: true
  
  belongs_to :course
  belongs_to :branch
  belongs_to :student, -> { where role: 'student' }, class_name: 'User'
end
