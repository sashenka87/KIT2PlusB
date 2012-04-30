class CreateSourceEvaluations < ActiveRecord::Migration
  def change
    create_table :source_evaluations do |t|
      t.integer :search_id
      t.integer :familiarity
      t.integer :utility
      t.integer :accessibility
      t.integer :trust

      t.timestamps
    end
  end
end
