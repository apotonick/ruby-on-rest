class CreateFruits < ActiveRecord::Migration
  def change
    create_table :fruits do |t|
      t.string :title

      t.timestamps
    end
  end
end
