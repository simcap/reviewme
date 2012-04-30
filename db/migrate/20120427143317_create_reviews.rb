class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :publisher_email
      t.string :publisher_name
      t.string :subject
      t.string :branch
      t.datetime :date
      t.string :status
      t.integer :reviewer_id

      t.timestamps
    end    
  end
end
