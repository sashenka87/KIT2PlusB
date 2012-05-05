class AddParticipantId < ActiveRecord::Migration
  def change
    add_column :questionnaires, :participant_id, :integer
    add_column :questionnaires, :step, :integer, :default => 0
  end
end
