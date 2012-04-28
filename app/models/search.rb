# == Schema Information
# Schema version: 20120428045515
#
# Table name: searches
#
#  id                     :integer         not null, primary key
#  participant_id         :integer
#  d_know_astro           :integer
#  d_know_psyc            :integer
#  t_know_astro           :integer
#  t_know_psyc            :integer
#  d_interest_astro       :integer
#  d_interest_psyc        :integer
#  t_interest_astro       :integer
#  t_interest_psyc        :integer
#  confidence_discrete    :integer
#  confidence_open        :integer
#  answer_discrete        :text
#  answer_open            :text
#  confidencewhy_discrete :text
#  confidencewhy_open     :text
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  step                   :integer         default(0)
#  ad_test                :integer
#

require "rubygems"

class Search < ActiveRecord::Base
  attr_accessible :answer_discrete, :answer_open, :confidence_discrete, :confidence_open, :confidencewhy_discrete
  attr_accessible :confidencewhy_open, :d_interest_astro, :d_interest_psyc, :d_know_astro, :d_know_psyc
  attr_accessible :t_interest_astro, :t_interest_psyc, :t_know_astro, :t_know_psyc
      
  belongs_to :participant, :class_name => "Participant", :foreign_key => "participant_id"
  
  before_validation(:on => :create) do
    self.ad_test = rand(4)
  end
end
