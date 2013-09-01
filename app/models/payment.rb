class Payment < ActiveRecord::Base
  Payment::MODES = %w[Cash Card Cheque]
  Payment::STATUSES = %w[Active Reversed]
  
  validates_presence_of :total
  validates_presence_of :status
  validates_presence_of :branch_id
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
  belongs_to :branch
  
  scope :today, -> { where "DATE(created_at) = ?", Date.today }
  scope :on, -> (created_on) { where "DATE(created_at) = ?", created_on }
  
  scope :cash, -> { where mode: 'Cash' }
  scope :card, -> { where mode: 'Card' }
  scope :cheque, -> { where mode: 'Cheque' }
  
  ransacker :created_at_casted do |parent|
    Arel::Nodes::SqlLiteral.new("date(payments.created_at)")
  end
end
