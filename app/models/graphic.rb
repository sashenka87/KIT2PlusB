# == Schema Information
# Schema version: 20120427062443
#
# Table name: graphics
#
#  id               :integer         not null, primary key
#  participant_id   :integer
#  graphics_ki      :integer
#  graphics_ki_text :text
#  graphics_kt      :integer
#  graphics_it      :integer
#  graphic_it_text  :text
#  k_def            :text
#  i_def            :text
#  t_def            :text
#  kit              :text
#  context          :text
#  domain           :text
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class Graphic < ActiveRecord::Base
  attr_accessible :context, :domain, :graphic_it_text, :graphics_it, :graphics_ki, :graphics_ki_text 
  attr_accessible :graphics_kt, :graphics_kt, :i_def, :k_def, :kit, :participant_id, :t_def
end
