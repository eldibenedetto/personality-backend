class InsightSerializer < ActiveModel::Serializer
  attributes :writing_sample, :insightJSON, :openness, :agreeableness, :conscientiousness, :introversion_extraversion, :emotional_range

  belongs_to :person
  belongs_to :user
  
end
