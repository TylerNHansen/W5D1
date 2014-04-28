class CreateCirclesUsers < ActiveRecord::Migration
  def change
    create_table :circles_users , id: false do |t|
      t.references :circle, index: true
      t.references :user, index: true
    end
  end
end
