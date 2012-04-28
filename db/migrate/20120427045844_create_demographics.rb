class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.integer :participant_id
      t.integer :gender
      t.integer :age
      t.string :ethnicity
      t.string :major
      t.integer :year_university
      t.float :gpa
      t.string :country_of_residence
      t.string :country_of_birth
      t.string :country_of_schooling
      t.boolean :native_english
      t.string :native_language

      t.timestamps
    end
  end
end
