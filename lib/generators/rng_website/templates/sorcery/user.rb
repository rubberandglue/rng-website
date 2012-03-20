class User < ActiveRecord::Base
  authenticates_with_sorcery!
  extend FriendlyId

  validates_presence_of     :username, :password
  validates_length_of       :password, minimum: 6
  validates_confirmation_of :password

  friendly_id :username, use: :slugged

  scope :non_admins, where(admin: false)

  def no_admin?
    !admin
  end
end
