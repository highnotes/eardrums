class BatchSchedule < ActiveRecord::Base
  STATUSES = %w[Active Completed Cancelled]
  
  validates :status, presence: true, inclusion: { in: BatchSchedule::STATUSES, 
                                      message: "%{value} is not a valid status" }
  validates_presence_of :scheduled_on
  validates_presence_of :batch_id
  
  belongs_to :batch
  has_many :student_schedules
  
  validate :scheduled_in_past
  validate :batch_is_active
  
  scope :in_future, -> { where("scheduled_on > ?", Date.today) }
  scope :active, -> { where(status: "Active") }
  
  def active?
    (self.status == "Active")
  end
  
  def cancel!
    self.status = "Cancelled"
    self.save!
  end
  
  class << self
    def build_from_batch(batch, from = Date.today)
      create.tap do |schedule|
        schedule.batch_id = batch.id
        schedule.status = "Active"
        schedule.scheduled_on = Chronic.parse("next #{batch.day} #{batch.start_time}", now: from)
      end
    end
    
    def create_from_batch_for_a_month(batch, from_date)
      schedules_array = []
      
      # Get first schedule and check if its in this month
      new_schedule = build_from_batch(batch, from_date)
      last_scheduled_on = new_schedule.scheduled_on
      last_day_of_month = (new_schedule.scheduled_on.month != from_date.month) ? new_schedule.scheduled_on.end_of_month : from_date.end_of_month
      
      # Loop until end of month
      while last_scheduled_on < last_day_of_month
        new_schedule.save!
        schedules_array << new_schedule
        new_schedule = build_from_batch(batch, last_scheduled_on)
        last_scheduled_on = new_schedule.scheduled_on
      end
      
      return schedules_array
    end
  end
  
  private
    def scheduled_in_past
      errors.add(:scheduled_on, "should always be in the future") if self.scheduled_on.present? and self.scheduled_on < Date.today
    end
    
    def batch_is_active
      errors.add(:batch, "should be active") if self.batch.present? and !self.batch.active?
    end
end
