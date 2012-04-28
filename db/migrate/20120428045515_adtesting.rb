class Adtesting < ActiveRecord::Migration
  def change
    add_column :searches, :ad_test, :integer
  end
end
