class Batch < ActiveRecord::Base
  STATUSES = %w[Active Upcoming Inactive Retired]
  
  validates :status, presence: true, inclusion: { in: Batch::STATUSES, 
                                      message: "%{value} is not a valid status" }
  validates_presence_of :discipline
  validates_presence_of :teacher
  validates_presence_of :day
  validates_presence_of :start_time
  validates_presence_of :duration
  validates_presence_of :created_by
  validates_presence_of :modified_by
  
  validates_numericality_of :duration, only_integer: true
  
  belongs_to :discipline
  belongs_to :teacher, -> { where role: 'teacher' }, class_name: 'User'
  has_and_belongs_to_many :students, -> { where role: 'student' }, class_name: 'User'
  has_many :batch_schedules
  has_many :enrollments
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
  belongs_to :modifier, class_name: 'User', foreign_key: 'modified_by'
  
  default_scope { order(:day, :start_time) }
  scope :active, -> { where(status: "Active") }
  
  after_update :invalidate_schedules
  after_save :generate_schedule
  after_touch :generate_schedule
  
  def timings
    self.day + Chronic.parse("next #{self.day} #{self.start_time}").strftime("%l:%M %p") + " -" + (Chronic.parse("next #{self.day} #{self.start_time}")+(self.duration*60)).strftime("%l:%M %p")
  end
  
  def display
    "#{timings} (#{students.count} students)"
  end
  
  def active?
    (self.status == "Active")
  end
  
  def generate_schedules_from(date)
    generate_schedule(date)
  end
  
  private
    def generate_schedule(date = Date.today)
      if batch_schedules.active.last.nil? or batch_schedules.active.last.scheduled_on <= date
        BatchSchedule.create_from_batch_for_a_month(self, date)
      end
    end
    
    def invalidate_schedules
      if day_changed? or start_time_changed?
        batch_schedules.active.each do |schedule|
          schedule.cancel!
        end
      end
    end
end
