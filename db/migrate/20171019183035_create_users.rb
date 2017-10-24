class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.string :username
      t.string :password_digest
    end
  end
end
