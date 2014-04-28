class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.references :user, index: true
      t.string :title

      t.timestamps
    end
  end
end
