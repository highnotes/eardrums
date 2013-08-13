class PaymentSchedule < ActiveRecord::Base
  STATUSES = %w[Unpaid Paid]
  
  validates_presence_of :enrollment_id
  validates_presence_of :due_on
  validates :status, presence: true, inclusion: { in: PaymentSchedule::STATUSES, 
                                      message: "%{value} is not a valid status" }
  validates_presence_of :created_by
  validates_presence_of :modified_by
  
  belongs_to :enrollment
  belongs_to :payment
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
  belongs_to :modifier, class_name: 'User', foreign_key: 'modified_by'
end
