class AddStepToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :step, :integer, :default => 0
  end
end
