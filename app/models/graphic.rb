# == Schema Information
# Schema version: 20120427193221
#
# Table name: graphics
#
#  id               :integer         not null, primary key
#  participant_id   :integer
#  graphics_ki      :integer
#  graphics_ki_text :text
#  graphics_kt      :integer
#  graphics_kt_text :text
#  graphics_it      :integer
#  graphics_it_text :text
#  k_def            :text
#  i_def            :text
#  t_def            :text
#  kit              :text
#  context          :text
#  domain           :text
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  step             :integer         default(0)
#

class Graphic < ActiveRecord::Base
  attr_accessible :context, :domain, :graphics_it_text, :graphics_it, :graphics_ki, :graphics_ki_text 
  attr_accessible :graphics_kt, :graphics_kt_text, :i_def, :k_def, :kit, :participant_id, :t_def
  
  belongs_to :participant, :class_name => "Participant", :foreign_key => "participant_id"
  
  # validates_presence_of :participant_id
  validates_presence_of :graphics_ki
  validates_presence_of :graphics_ki_text, :if => Proc.new{ |f| f.step > 1 }
  validates_presence_of :graphics_kt, :if => Proc.new{ |f| f.step > 2 }
  validates_presence_of :graphics_kt_text, :if => Proc.new{ |f| f.step > 3 }
  validates_presence_of :graphics_it, :if => Proc.new{ |f| f.step > 4 }
  validates_presence_of :graphics_it_text, :if => Proc.new{ |f| f.step > 5 }
  validates_presence_of :k_def, :if => Proc.new{ |f| f.step > 6 }
  validates_presence_of :i_def, :if => Proc.new{ |f| f.step > 6 }
  validates_presence_of :t_def, :if => Proc.new{ |f| f.step > 6 }
  validates_presence_of :kit, :if => Proc.new{ |f| f.step > 6 }
  validates_presence_of :context, :if => Proc.new{ |f| f.step > 7 }
  validates_presence_of :domain, :if => Proc.new{ |f| f.step > 7 }
end
