class AddGraphicsStep < ActiveRecord::Migration
  def change
    add_column :graphics, :step, :integer, :default => 0
  end
end
