class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.text :writing_sample
      t.text :insight
      t.integer :user_id
    end
  end
end
