class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.datetime :date
      t.string :status
      t.string :done_by

      t.timestamps
    end
  end
end
