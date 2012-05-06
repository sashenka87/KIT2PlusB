class AddTimeToSourceEvaluation < ActiveRecord::Migration
  def change
    add_column :source_evaluations, :time_spent, :integer
  end
end
