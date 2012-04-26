class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :session_id
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :instructor
      t.string :country

      t.timestamps
    end
  end
end
