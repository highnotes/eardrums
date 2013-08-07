class StudentSchedule < ActiveRecord::Base
  validates_presence_of :student_id
  validates_presence_of :batch_schedule
  
  belongs_to :student, -> { where role: 'student' }, class_name: 'User'
  belongs_to :batch_schedule
  
  validate :batch_schedule_is_active
  validate :attended_on_is_current_or_past
  
  private
    def batch_schedule_is_active
      errors.add(:batch_schedule, "should be active") if self.batch_schedule.present? and !self.batch_schedule.active?
    end
    
    def attended_on_is_current_or_past
      errors.add(:attended_on, "should be today or in the past") if self.attended_on.present? and self.attended_on > Date.today
    end
end
