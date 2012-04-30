# == Schema Information
# Schema version: 20120430031847
#
# Table name: source_evaluations
#
#  id            :integer         not null, primary key
#  search_id     :integer
#  familiarity   :integer
#  utility       :integer
#  accessibility :integer
#  trust         :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class SourceEvaluation < ActiveRecord::Base
  attr_accessible :accessibility, :familiarity, :trust, :utility
  
  belongs_to :search, :class_name => "Search", :foreign_key => "search_id"
  
  validates_presence_of :search_id
  validates_presence_of :familiarity
  validates_presence_of :utility
  validates_presence_of :accessibility
  validates_presence_of :trust
end
