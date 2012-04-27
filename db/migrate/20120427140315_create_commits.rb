class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :shorthash
      t.string :branch
      t.string :email
      t.text :message
      t.datetime :date
      t.integer :review_id

      t.timestamps
    end
    add_index :commits, :review_id
    
  end
end
