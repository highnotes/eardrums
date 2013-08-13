class Course < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :status
  validates_presence_of :duration
  validates_presence_of :price
  validates_presence_of :code
  
  validates_presence_of :level
  validates_presence_of :discipline
  validates_presence_of :teacher
  
  validates_presence_of :index
  validates_numericality_of :index, only_integer: true
  validates_numericality_of :price
  validates_uniqueness_of :index, scope: :discipline
  
  belongs_to :level
  belongs_to :discipline
  has_many :lessons
  has_many :enrollments
  has_many :installments
  belongs_to :teacher, -> { where role: 'teacher' }, class_name: 'User'
  has_and_belongs_to_many :branches
  
  STATUSES = %w[Active Upcoming Inactive Retired]

  default_scope { order(:index) }
  scope :active, -> { where(status: "Active") }
  scope :order_by_level, -> { joins(:level).order('levels.index') }
  
  scope :beginner_courses, ->(discipline) { where(level_id: Level.beginner_levels, discipline_id: discipline.id) }
  scope :intermediate_courses, ->(discipline) { where(level_id: Level.intermediate_levels, discipline_id: discipline.id) }
  scope :advanced_courses, ->(discipline) { where(level_id: Level.advanced_levels, discipline_id: discipline.id) }
  scope :special_courses, ->(discipline) { where(level_id: Level.special_levels, discipline_id: discipline.id) }
  
  acts_as_taggable
  
  def duration
    duration_temp = read_attribute :duration
    duration_temp.nil? ? nil : "#{duration_temp} weeks"
  end
  
  def active?
    status == "Active"
  end
  
  def upcoming?
    status == "Upcoming"
  end
end
