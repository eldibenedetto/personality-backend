class User < ActiveRecord::Base

has_many :people

has_secure_password

end
