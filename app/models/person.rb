class Person < ActiveRecord::Base

has_one :insight, as: :insightable
has_many :user_people
has_many :users, through: :user_people

end
