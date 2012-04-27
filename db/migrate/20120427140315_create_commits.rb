class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :shorthash
      t.string :branch
      t.string :email
      t.text :message
      t.datetime :date

      t.timestamps
    end
  end
end
