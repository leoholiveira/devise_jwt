class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  validates :jti, :exp, presence: true

  self.table_name = 'jwt_denylist'
end
