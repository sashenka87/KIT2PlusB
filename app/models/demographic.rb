# == Schema Information
# Schema version: 20120427045844
#
# Table name: demographics
#
#  id                   :integer         not null, primary key
#  participant_id       :integer
#  gender               :integer
#  age                  :integer
#  ethnicity            :string(255)
#  major                :string(255)
#  year_university      :integer
#  gpa                  :float
#  country_of_residence :string(255)
#  country_of_birth     :string(255)
#  country_of_schooling :string(255)
#  native_english       :boolean
#  native_language      :string(255)
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#

class Demographic < ActiveRecord::Base
  attr_accessible :age, :country_of_birth, :country_of_residence, :country_of_schooling, :ethnicity, :gender
  attr_accessible :gpa, :major, :native_english, :native_language, :year_university
  
  # validates_presence_of :participant_id
  validates_presence_of :gender
  validates_presence_of :age
  validates_presence_of :major
  validates_presence_of :year_university
  validates_presence_of :gpa
  validates_presence_of :country_of_residence
  validates_presence_of :country_of_birth
  validates_presence_of :country_of_schooling
  validates_inclusion_of :native_english, :in => [true, false]
  
  belongs_to :participant, :class_name => "Participant", :foreign_key => "participant_id"
end
