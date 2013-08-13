class Installment < ActiveRecord::Base
  validates_presence_of :course
  validates_presence_of :index
  validates_presence_of :no_of_installments
  validates_presence_of :interval
  validates_presence_of :amount
  validates_presence_of :created_by
  validates_presence_of :modified_by
  
  validates_numericality_of :index, only_integer: true
  validates_numericality_of :interval, only_integer: true
  validates_numericality_of :no_of_installments, only_integer: true
  validates_uniqueness_of :index, scope: :course
  validates_numericality_of :amount
  
  belongs_to :course
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
  belongs_to :modifier, class_name: 'User', foreign_key: 'modified_by'
end
