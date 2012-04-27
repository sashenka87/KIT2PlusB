class CreateGraphics < ActiveRecord::Migration
  def change
    create_table :graphics do |t|
      t.integer :participant_id
      t.integer :graphics_ki
      t.text :graphics_ki_text
      t.integer :graphics_kt
      t.text :graphics_kt
      t.integer :graphics_it
      t.text :graphic_it_text
      t.text :k_def
      t.text :i_def
      t.text :t_def
      t.text :kit
      t.text :context
      t.text :domain

      t.timestamps
    end
  end
end
