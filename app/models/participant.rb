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
  attr_accessible :country, :first_name, :instructor, :ip_address, :last_name, :session_id
  
end
