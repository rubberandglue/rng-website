class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_presence_of     :username, :password
  validates_length_of       :password, minimum: 6
  validates_confirmation_of :password

  #scope :non_admin
end
