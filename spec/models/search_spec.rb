# == Schema Information
# Schema version: 20120428034633
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
#

require 'spec_helper'

describe Search do
  # pending "add some examples to (or delete) #{__FILE__}"
end
