class CreateCirclePostShares < ActiveRecord::Migration
  def change
    create_table :circle_post_shares do |t|
      t.references :circle, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
