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

require 'spec_helper'

describe Demographic do
  # pending "add some examples to (or delete) #{__FILE__}"
end
