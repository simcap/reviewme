class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :publisher_email
      t.string :publisher_name
      t.datetime :date
      t.string :status
      t.string :done_by

      t.timestamps
    end
  end
end
