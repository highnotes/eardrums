class Payment < ActiveRecord::Base
  Payment::MODES = %w[Cash Card Cheque]
  Payment::STATUSES = %w[Active Reversed]
  
  validates_presence_of :total
  validates_presence_of :status
  validates_presence_of :created_by
  validates_presence_of :modified_by
  
  validates :registration_fee, :course_fee, :total, 
              numericality: true
  
  validates :status, 
              presence: true, inclusion: { in: Payment::STATUSES, message: "%{value} is not a valid status" }       
  validates :mode, 
              presence: true, inclusion: { in: Payment::MODES, message: "%{value} is not a valid mode" }

  belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
  belongs_to :modifier, class_name: 'User', foreign_key: 'modified_by'
  belongs_to :transactable, polymorphic: true
end
