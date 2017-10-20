class CreateUserPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :user_people do |t|
      t.integer :user_id
      t.integer :person_id
    end
  end
end
