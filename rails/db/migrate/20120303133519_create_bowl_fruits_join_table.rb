class CreateBowlFruitsJoinTable < ActiveRecord::Migration
  def up
    create_table :bowls_fruits, :id => false do |t|
      t.integer :bowl_id
      t.integer :fruit_id
    end

  end

  def down
  end
end
