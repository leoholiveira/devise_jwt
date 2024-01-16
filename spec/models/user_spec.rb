# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:birthdate) }
  end

  describe 'devise modules' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:encrypted_password).of_type(:string) }
    it { should have_db_column(:username).of_type(:string) }
    it { should have_db_column(:birthdate).of_type(:date) }
  end

  describe 'methods' do
    let(:user) { create(:user, confirmed_at: Time.current) }

    it 'is active when confirmed' do
      expect(user.active?).to be_truthy
    end
  end
end
