class AddSourceId < ActiveRecord::Migration
  def change
    add_column :source_evaluations, :source_id, :integer
  end
end
