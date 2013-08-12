class Master < ActiveRecord::Base
  validates_presence_of :group
  validates_presence_of :index
  validates_presence_of :name
  validates_presence_of :description
  
  validates_numericality_of :index, only_integer: true
  validates_uniqueness_of :index, scope: :group
  
  def self.get_group_collection(group)
    Master.where(group: group).order('"masters"."group" ASC, index ASC').to_a
  end
end
