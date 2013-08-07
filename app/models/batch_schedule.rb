class BatchSchedule < ActiveRecord::Base
  STATUSES = %w[Active Cancelled]
  
  validates :status, presence: true, inclusion: { in: BatchSchedule::STATUSES, 
                                      message: "%{value} is not a valid status" }
  validates_presence_of :scheduled_on
  validates_presence_of :batch_id
  
  belongs_to :batch
  has_many :student_schedules
  
  validate :scheduled_in_past
  validate :batch_is_active
  
  def active?
    (self.status == "Active")
  end
  
  private
    def scheduled_in_past
      errors.add(:scheduled_on, " should always be in the future") if self.scheduled_on.present? and self.scheduled_on < Date.today
    end
    
    def batch_is_active
      errors.add(:batch, " should be active") if self.batch.present? and !self.batch.active?
    end
end
