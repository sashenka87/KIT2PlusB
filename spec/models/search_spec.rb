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

require 'spec_helper'

describe Search do
  def step0_attributes
    { :d_know_astro => 50, :d_know_psyc => 54, :t_know_astro => 73, :t_know_psyc => 92 }
  end
  
  def step1_attributes
    { :d_interest_astro => 23, :d_interest_psyc => 43, :t_interest_astro => 12, :t_interest_psyc => 85 }
  end
  
  def step2_attributes
    { :answer_discrete => "text" }
  end
  
  def step3_attributes
    { :confidence_discrete => 12, :confidencewhy_discrete => "blah" }
  end
  
  def step4_attributes
    { :answer_open => "blah" }
  end
  
  def step5_attributes
    { :confidence_open => 65, :confidencewhy_open => "bar" }
  end
  
  describe "nested_attributes" do
    before(:each) do
      @participant = FactoryGirl.create(:participant)
    end
    it "should create a source evaluation" do
      s_attrs = { :familiarity => 12, :utility => 34, :accessibility => 67, :trust => 87 }
      attrs = step0_attributes.merge(step1_attributes).merge(step2_attributes).merge({ :source_evaluations_attributes => [s_attrs] })
      s = @participant.build_search(attrs)
      s.save
      s.source_evaluations.count.should == 1
      Search.count.should == 1
      SourceEvaluation.count.should == 1
    end
    
    it "should not create a source evaluation" do
      s_attrs = { :familiarity => "", :utility => "", :accessibility => "", :trust => "" }
      attrs = step0_attributes.merge(step1_attributes).merge(step2_attributes).merge({ :source_evaluations_attributes => [s_attrs] })
      s = @participant.build_search(attrs)
      s.save
      s.source_evaluations.count.should == 0
      Search.count.should == 1
      SourceEvaluation.count.should == 0
    end
    
    it "should not create a search" do
      s_attrs = { :familiarity => "", :utility => "1", :accessibility => "", :trust => "" }
      attrs = step0_attributes.merge(step1_attributes).merge(step2_attributes).merge({ :source_evaluations_attributes => [s_attrs] })
      s = @participant.build_search(attrs)
      s.save
      Search.count.should == 0
      SourceEvaluation.count.should == 0
    end
  end
end
