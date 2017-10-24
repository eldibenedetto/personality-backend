class UserPersonSerializer < ActiveModel::Serializer
  attributes :user_id, :person_id

  belongs_to :user
  belongs_to :person
end
