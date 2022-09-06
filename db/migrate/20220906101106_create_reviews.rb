class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table 'reviews' do |t|
      t.integer 'reviewer_id', null: false
      t.integer 'reviewee_id', null: false

      t.timestamps null: false
    end

    add_index :reviews, :reviewer_id
    add_index :reviews, :reviewee_id
    add_index :reviews, [:reviewer_id, :reviewee_id], unique: true
  end
end
