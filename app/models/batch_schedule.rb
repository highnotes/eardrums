class BatchSchedule < ActiveRecord::Base
  validates_presence_of :status
  validates_presence_of :scheduled_on
  validates_presence_of :batch_id
  
  belongs_to :batch
  
  validate :scheduled_in_past
  validate :batch_is_active
  
  private
    def scheduled_in_past
      errors.add(:scheduled_on, " should always be in the future") if self.scheduled_on.present? and self.scheduled_on < Date.today
    end
    
    def batch_is_active
      errors.add(:batch, " should be active") if self.batch.present? and !self.batch.active?
    end
end
