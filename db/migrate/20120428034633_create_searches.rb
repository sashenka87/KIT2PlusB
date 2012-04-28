class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :participant_id
      t.integer :d_know_astro
      t.integer :d_know_psyc
      t.integer :t_know_astro
      t.integer :t_know_psyc
      t.integer :d_interest_astro
      t.integer :d_interest_psyc
      t.integer :t_interest_astro
      t.integer :t_interest_psyc
      t.integer :confidence_discrete
      t.integer :confidence_open
      t.text :answer_discrete
      t.text :answer_open
      t.text :confidencewhy_discrete
      t.text :confidencewhy_open

      t.timestamps
    end
  end
end
