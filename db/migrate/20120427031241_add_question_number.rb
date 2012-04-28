class AddQuestionNumber < ActiveRecord::Migration
  def change
    add_column :participants, :current_question, :integer, :default => 0
  end
end
