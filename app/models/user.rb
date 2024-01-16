class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  validates :email, :username, :password, :birthdate, presence: true
  validates :email, uniqueness: true

  def active?
    confirmed_at.present?
  end
end
