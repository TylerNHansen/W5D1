class CreateCirclesUsers < ActiveRecord::Migration
  def change
    create_table :circle_user_memberships , id: false do |t|
      t.references :circle, index: true
      t.references :user, index: true
    end
  end
end
