class AddParticipantId < ActiveRecord::Migration
  def change
    add_column :questionaires, :participant_id, :integer
    add_column :questionaires, :step, :integer, :default => 0
  end
end
