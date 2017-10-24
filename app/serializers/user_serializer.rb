class UserSerializer < ActiveModel::Serializer
  attributes :name, :age, :gender, :username, :password_digest

  has_one :insight
  has_many :user_people
  has_many :people, through: :user_people

  # enum gender: [:male, :female, :other]

end
