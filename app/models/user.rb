class User < ActiveRecord::Base

has_one :insight, as: :insightable
has_many :user_people
has_many :people, through: :user_people

has_secure_password

enum gender: [:male, :female, :other]

end
