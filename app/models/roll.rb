class Roll < ActiveRecord::Base
  validates_presence_of :branch_id
  validates_presence_of :course_id
  validates_presence_of :duration
  validates_presence_of :attended
  validates_presence_of :to_end_on
  
  validates_numericality_of :branch_id, only_integer: true
  validates_numericality_of :course_id, only_integer: true
  validates_numericality_of :duration, only_integer: true
  validates_numericality_of :attended, only_integer: true
  
  belongs_to :course
  belongs_to :branch
  belongs_to :student, -> { where type: 'Student' }, class_name: 'User'
  
  class << self
    def build_from_enrollment(enrollment)
      params = enrollment.attributes.with_indifferent_access
      keys = columns.collect(&:name)
      attrs = params.select{|k, v| keys.include?(k.to_s)}.merge({course_id: params[:course_id], branch_id: params[:branch_id]})
              
      student_id = enrollment.student.id
      duration = Course.find(params[:course_id]).duration
  
      new(attrs).tap do |roll|
        roll.student_id = student_id
        roll.duration = duration
        roll.attended = 0
        roll.to_end_on = Date.today
      end
    end
  end
end
