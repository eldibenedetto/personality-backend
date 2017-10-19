class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.text :writing_sample
      t.integer :age
      t.integer :gender
      t.text :insights
    end
  end
end
