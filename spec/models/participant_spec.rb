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

require 'spec_helper'

describe Participant do
  # pending "add some examples to (or delete) #{__FILE__}"
end
