class Dog < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.date :dob
      t.integer :favorite_number
      t.timestamps
    end
  end
end
