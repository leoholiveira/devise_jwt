# frozen_string_literal: true

# spec/models/jwt_denylist_spec.rb

require 'rails_helper'

RSpec.describe JwtDenylist, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:jti) }
    it { should validate_presence_of(:exp) }
  end

  describe 'table name' do
    it { expect(described_class.table_name).to eq('jwt_denylist') }
  end
end
