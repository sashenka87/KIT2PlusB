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

require 'spec_helper'

describe SourceEvaluation do
  # pending "add some examples to (or delete) #{__FILE__}"
end
