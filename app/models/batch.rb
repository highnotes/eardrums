class Batch < ActiveRecord::Base
  STATUSES = %w[Active Upcoming Inactive Retired]
  
  validates :status, presence: true, inclusion: { in: Batch::STATUSES, 
                                      message: "%{value} is not a valid status" }
  validates_presence_of :discipline
  validates_presence_of :teacher
  validates_presence_of :day
  validates_presence_of :start_time
  validates_presence_of :duration
  
  validates_numericality_of :day, only_integer: true
  validates_numericality_of :duration, only_integer: true
  
  belongs_to :discipline
  belongs_to :teacher, -> { where role: 'teacher' }, class_name: 'User'
  has_and_belongs_to_many :students, -> { where role: 'student' }, class_name: 'User'
  has_many :batch_schedules
  has_many :enrollments
  
  def timings
    "#{Date::ABBR_DAYNAMES[self.day]} #{self.start_time.strftime "%l:%M %p"} -#{(self.start_time + (self.duration*60*60)).strftime "%l:%M %p"}"
  end
  
  def active?
    (self.status == "Active")
  end
end
