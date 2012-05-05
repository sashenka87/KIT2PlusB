# == Schema Information
# Schema version: 20120427031241
#
# Table name: participants
#
#  id               :integer         not null, primary key
#  session_id       :string(255)
#  ip_address       :string(255)
#  first_name       :string(255)
#  last_name        :string(255)
#  instructor       :string(255)
#  country          :string(255)
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  current_question :integer         default(0)
#

class Participant < ActiveRecord::Base
  attr_accessible :country, :first_name, :instructor, :last_name
  
  validates_presence_of :session_id
  validates_presence_of :ip_address
  
  validates_presence_of :country
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :instructor
  
  has_one :demographic, :class_name => "Demographic", :foreign_key => "participant_id", :dependent => :destroy
  has_one :graphic, :class_name => "Graphic", :foreign_key => "participant_id", :dependent => :destroy
  has_one :search, :class_name => "Search", :foreign_key => "participant_id", :dependent => :destroy
  has_one :questionaire, :class_name => "Questionaire", :foreign_key => "participant_id", :dependent => :destroy
  
  def ad_test
    return nil if search.nil?
    return search.ad_test
  end
  
  def progress
    demographic_steps = 1
    graphic_steps = 8
    search_steps = 6
    questionaire_steps = 14
    
    total_steps = demographic_steps + graphic_steps + search_steps + questionaire_steps
    steps_finished = 0
    steps_finished += demographic_steps unless demographic.nil?
    steps_finished += graphic.step unless graphic.nil?
    steps_finished += search.step unless search.nil?
    steps_finished += questionaire.step unless questionaire.nil?
    
    return ((steps_finished.to_f / total_steps) * 100).to_i
  end
end
