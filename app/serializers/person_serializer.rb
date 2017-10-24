class PersonSerializer < ActiveModel::Serializer
  attributes :name, :insight_id

  has_one :insight
  has_many :user_people
  has_many :users, through: :user_people
end
