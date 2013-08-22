class Enrollment < ActiveRecord::Base
  Enrollment::MODES = %w[Cash Card Cheque]
  Enrollment::TXN_STATUSES = %w[Active Reversed]
  Enrollment::STATUSES = %w[Active Completed]
  
  belongs_to :branch
  belongs_to :course
  belongs_to :discipline
  belongs_to :batch
  belongs_to :student, -> { where role: 'student' }, class_name: 'User'
  
  validates :branch_id, :course_id, :discipline_id, :batch_id, :name, :address, :phone, :enrolled_on,  
              :duration, :registration_fee, :course_fee, :total, :created_by, :modified_by, :source_id, 
              presence: true
  validates :email, 
              presence: true, format: { with: Devise.email_regexp, message: "format is invalid" }
  validates :phone, 
              presence: true, :length => { :in => 12..16 }, format: { with: /[0-9\+\-]/, message: "format is invalid" }
  validates :branch_id, :course_id, :batch_id, :duration, :created_by, :modified_by, :reversal_reason_id,       
              :source_id, 
              numericality: { only_integer: true }
  validates :registration_fee, :course_fee, :total, 
              numericality: true
  validates :membership_no, uniqueness: { scope: :course_id, message: "can enroll only once for each course" }
  validates :application_no, uniqueness: true
  validates :status, 
              presence: true, inclusion: { in: Enrollment::STATUSES, message: "%{value} is not a valid status" }       
  validates :txn_status, 
              presence: true, inclusion: { in: Enrollment::TXN_STATUSES, message: "%{value} is not a valid transaction status" }
  validates :mode, 
              presence: true, inclusion: { in: Enrollment::MODES, message: "%{value} is not a valid mode" }
  
  # NOTES: STUDENT_ID/STUDENT
  # Student ID is mandatory, but could not add a presence:true validation
  # Because at the time of creation, a student record does not exist yet.
  
  validate :student_should_be_valid
  
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
  belongs_to :modifier, class_name: 'User', foreign_key: 'modified_by'
  
  after_initialize :set_defaults
  
  class << self
    def build(params)
      Enrollment.new(params).tap do |e|
        e.set_defaults
        e.student = User.build_from_enrollment(e)
      end
    end
  end
  
  def set_defaults
    if self.new_record?
      self.status = "Active"
      self.txn_status = "Active"
      self.reversal_reason_id = 0
      self.enrolled_on = Date.today
    end
  end
  
  private
    def student_should_be_valid
      errors.add(:student, "details should be valid") unless self.student.valid?
    end
end
