class CreateInsights < ActiveRecord::Migration[5.1]
  def change
    create_table :insights do |t|
      t.text :writing_sample
      t.text :insightJSON
      t.integer :openness
      t.integer :agreeableness
      t.integer :conscientiousness
      t.integer :introversion_extraversion
      t.integer :emotional_range
    end
  end
end
