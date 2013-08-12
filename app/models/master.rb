class Master < ActiveRecord::Base
  validates_presence_of :group
  validates_presence_of :index
  validates_presence_of :name
  validates_presence_of :description
  
  validates_numericality_of :index, only_integer: true
  validates_uniqueness_of :index, scope: :group
  
  before_save :format_group, :format_name
  
  def self.get_group_collection(group)
    Master.where(group: group).order('"masters"."group" ASC, index ASC').to_a
  end
  
  private
    def format_group
      self.group = group.gsub(/ /, '_').upcase if self.group.present?
    end
  
    def format_name
      self.name = name.gsub(/ /, '_').upcase if self.name.present?
    end
end
