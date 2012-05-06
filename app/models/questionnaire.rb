# == Schema Information
# Schema version: 20120501160642
#
# Table name: questionnaires
#
#  id             :integer         not null, primary key
#  q0             :integer
#  q1             :integer
#  q2             :integer
#  q3             :integer
#  q4             :integer
#  q5             :integer
#  q6             :integer
#  q7             :integer
#  q8             :integer
#  q9             :integer
#  q10            :integer
#  q11            :integer
#  q12            :integer
#  q13            :integer
#  q14            :integer
#  q15            :integer
#  q16            :integer
#  q17            :integer
#  q18            :integer
#  q19            :integer
#  q20            :integer
#  q21            :integer
#  q22            :integer
#  q23            :integer
#  q24            :integer
#  q25            :integer
#  q26            :integer
#  q27            :integer
#  q28            :integer
#  q29            :integer
#  q30            :integer
#  q31            :integer
#  q32            :integer
#  q33            :integer
#  q34            :integer
#  q35            :integer
#  q36            :integer
#  q37            :integer
#  q38            :integer
#  q39            :integer
#  q40            :integer
#  q41            :integer
#  q42            :integer
#  q43            :integer
#  q44            :integer
#  q45            :integer
#  q46            :integer
#  q47            :integer
#  q48            :integer
#  q49            :integer
#  q50            :integer
#  q51            :integer
#  q52            :integer
#  q53            :integer
#  q54            :integer
#  q55            :integer
#  q56            :integer
#  q57            :integer
#  q58            :integer
#  q59            :integer
#  q60            :integer
#  q61            :integer
#  q62            :integer
#  q63            :integer
#  q64            :integer
#  q65            :integer
#  q66            :integer
#  q67            :integer
#  q68            :integer
#  q69            :integer
#  q70            :integer
#  q71            :integer
#  q72            :integer
#  q73            :integer
#  q74            :integer
#  q75            :integer
#  q76            :integer
#  q77            :integer
#  q78            :integer
#  q79            :integer
#  q80            :integer
#  q81            :integer
#  q82            :integer
#  q83            :integer
#  q84            :integer
#  q85            :integer
#  context1       :text
#  context2       :text
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  participant_id :integer
#  step           :integer         default(0)
#

class Questionnaire < ActiveRecord::Base
  attr_accessible :context1, :context2, :q0
  attr_accessible :q1, :q10, :q11, :q12, :q13, :q14, :q15, :q16, :q17, :q18, :q19
  attr_accessible :q2, :q20, :q21, :q22, :q23, :q24, :q25, :q26, :q27, :q28, :q29
  attr_accessible :q3, :q30, :q31, :q32, :q33, :q34, :q35, :q36, :q37, :q38, :q39
  attr_accessible :q4, :q40, :q41, :q42, :q43, :q44, :q45, :q46, :q47, :q48, :q49
  attr_accessible :q5, :q50, :q51, :q52, :q53, :q54, :q55, :q56, :q57, :q58, :q59
  attr_accessible :q6, :q60, :q61, :q62, :q63, :q64, :q65, :q66, :q67, :q68, :q69
  attr_accessible :q7, :q70, :q71, :q72, :q73, :q74, :q75, :q76, :q77, :q78, :q79
  attr_accessible :q8, :q80, :q81, :q82, :q83, :q84, :q85, :q9
  
  belongs_to :participant, :class_name => "Participant", :foreign_key => "participant_id"
  
  validates_presence_of :q0        ,:if => Proc.new{ |f| f.step > 0 }
  validates_presence_of :q1        ,:if => Proc.new{ |f| f.step > 0 }
  validates_presence_of :q2        ,:if => Proc.new{ |f| f.step > 0 }
  validates_presence_of :q3        ,:if => Proc.new{ |f| f.step > 0 }
  validates_presence_of :q4        ,:if => Proc.new{ |f| f.step > 0 }
  validates_presence_of :q5        ,:if => Proc.new{ |f| f.step > 0 }
  validates_presence_of :q6        ,:if => Proc.new{ |f| f.step > 0 }
  validates_presence_of :q7        ,:if => Proc.new{ |f| f.step > 1 }
  validates_presence_of :q8        ,:if => Proc.new{ |f| f.step > 1 }
  validates_presence_of :q9        ,:if => Proc.new{ |f| f.step > 1 }
  validates_presence_of :q10       ,:if => Proc.new{ |f| f.step > 1 }
  validates_presence_of :q11       ,:if => Proc.new{ |f| f.step > 1 }
  validates_presence_of :q12       ,:if => Proc.new{ |f| f.step > 1 }
  validates_presence_of :q13       ,:if => Proc.new{ |f| f.step > 1 }
  validates_presence_of :q14       ,:if => Proc.new{ |f| f.step > 2 }
  validates_presence_of :q15       ,:if => Proc.new{ |f| f.step > 2 }
  validates_presence_of :q16       ,:if => Proc.new{ |f| f.step > 2 }
  validates_presence_of :q17       ,:if => Proc.new{ |f| f.step > 2 }
  validates_presence_of :q18       ,:if => Proc.new{ |f| f.step > 2 }
  validates_presence_of :q19       ,:if => Proc.new{ |f| f.step > 2 }
  validates_presence_of :q20       ,:if => Proc.new{ |f| f.step > 2 }
  validates_presence_of :q21       ,:if => Proc.new{ |f| f.step > 3 }
  validates_presence_of :q22       ,:if => Proc.new{ |f| f.step > 3 }
  validates_presence_of :q23       ,:if => Proc.new{ |f| f.step > 3 }
  validates_presence_of :q24       ,:if => Proc.new{ |f| f.step > 3 }
  validates_presence_of :q25       ,:if => Proc.new{ |f| f.step > 3 }
  validates_presence_of :q26       ,:if => Proc.new{ |f| f.step > 3 }
  validates_presence_of :q27       ,:if => Proc.new{ |f| f.step > 3 }
  validates_presence_of :q28       ,:if => Proc.new{ |f| f.step > 4 }
  validates_presence_of :q29       ,:if => Proc.new{ |f| f.step > 4 }
  validates_presence_of :q30       ,:if => Proc.new{ |f| f.step > 4 }
  validates_presence_of :q31       ,:if => Proc.new{ |f| f.step > 4 }
  validates_presence_of :q32       ,:if => Proc.new{ |f| f.step > 4 }
  validates_presence_of :q33       ,:if => Proc.new{ |f| f.step > 4 }
  validates_presence_of :q34       ,:if => Proc.new{ |f| f.step > 4 }
  validates_presence_of :q35       ,:if => Proc.new{ |f| f.step > 5 }
  validates_presence_of :q36       ,:if => Proc.new{ |f| f.step > 5 }
  validates_presence_of :q37       ,:if => Proc.new{ |f| f.step > 5 }
  validates_presence_of :q38       ,:if => Proc.new{ |f| f.step > 5 }
  validates_presence_of :q39       ,:if => Proc.new{ |f| f.step > 5 }
  validates_presence_of :q40       ,:if => Proc.new{ |f| f.step > 5 }
  validates_presence_of :q41       ,:if => Proc.new{ |f| f.step > 5 }
  validates_presence_of :q42       ,:if => Proc.new{ |f| f.step > 5 }
  validates_presence_of :context1  ,:if => Proc.new{ |f| f.step > 6 }  
  validates_presence_of :q43       ,:if => Proc.new{ |f| f.step > 7 }
  validates_presence_of :q44       ,:if => Proc.new{ |f| f.step > 7 }
  validates_presence_of :q45       ,:if => Proc.new{ |f| f.step > 7 }
  validates_presence_of :q46       ,:if => Proc.new{ |f| f.step > 7 }
  validates_presence_of :q47       ,:if => Proc.new{ |f| f.step > 7 }
  validates_presence_of :q48       ,:if => Proc.new{ |f| f.step > 7 }
  validates_presence_of :q49       ,:if => Proc.new{ |f| f.step > 7 }
  validates_presence_of :q50       ,:if => Proc.new{ |f| f.step > 8 }
  validates_presence_of :q51       ,:if => Proc.new{ |f| f.step > 8 }
  validates_presence_of :q52       ,:if => Proc.new{ |f| f.step > 8 }
  validates_presence_of :q53       ,:if => Proc.new{ |f| f.step > 8 }
  validates_presence_of :q54       ,:if => Proc.new{ |f| f.step > 8 }
  validates_presence_of :q55       ,:if => Proc.new{ |f| f.step > 8 }
  validates_presence_of :q56       ,:if => Proc.new{ |f| f.step > 8 }
  validates_presence_of :q57       ,:if => Proc.new{ |f| f.step > 9 }
  validates_presence_of :q58       ,:if => Proc.new{ |f| f.step > 9 }
  validates_presence_of :q59       ,:if => Proc.new{ |f| f.step > 9 }
  validates_presence_of :q60       ,:if => Proc.new{ |f| f.step > 9 }
  validates_presence_of :q61       ,:if => Proc.new{ |f| f.step > 9 }
  validates_presence_of :q62       ,:if => Proc.new{ |f| f.step > 9 }
  validates_presence_of :q63       ,:if => Proc.new{ |f| f.step > 9 }
  validates_presence_of :q64       ,:if => Proc.new{ |f| f.step > 10 }
  validates_presence_of :q65       ,:if => Proc.new{ |f| f.step > 10 }
  validates_presence_of :q66       ,:if => Proc.new{ |f| f.step > 10 }
  validates_presence_of :q67       ,:if => Proc.new{ |f| f.step > 10 }
  validates_presence_of :q68       ,:if => Proc.new{ |f| f.step > 10 }
  validates_presence_of :q69       ,:if => Proc.new{ |f| f.step > 10 }
  validates_presence_of :q70       ,:if => Proc.new{ |f| f.step > 10 }
  validates_presence_of :q71       ,:if => Proc.new{ |f| f.step > 11 }
  validates_presence_of :q72       ,:if => Proc.new{ |f| f.step > 11 }
  validates_presence_of :q73       ,:if => Proc.new{ |f| f.step > 11 }
  validates_presence_of :q74       ,:if => Proc.new{ |f| f.step > 11 }
  validates_presence_of :q75       ,:if => Proc.new{ |f| f.step > 12 }
  validates_presence_of :q76       ,:if => Proc.new{ |f| f.step > 12 }
  validates_presence_of :q77       ,:if => Proc.new{ |f| f.step > 12 }
  validates_presence_of :q78       ,:if => Proc.new{ |f| f.step > 12 }
  validates_presence_of :q79       ,:if => Proc.new{ |f| f.step > 12 }
  validates_presence_of :q80       ,:if => Proc.new{ |f| f.step > 12 }
  validates_presence_of :q81       ,:if => Proc.new{ |f| f.step > 12 }
  validates_presence_of :q82       ,:if => Proc.new{ |f| f.step > 12 }
  validates_presence_of :q83       ,:if => Proc.new{ |f| f.step > 12 }
  validates_presence_of :q84       ,:if => Proc.new{ |f| f.step > 12 }
  validates_presence_of :q85       ,:if => Proc.new{ |f| f.step > 12 }
  validates_presence_of :context2  ,:if => Proc.new{ |f| f.step > 13 }
end
