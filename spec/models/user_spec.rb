require 'rails_helper'

RSpec.describe User, type: :model do
  # let(:incomplete_user) { User.new(username: '', password: 'password') }

  # it 'validates presence of username' do
  #   expect(incomplete_user).to_not be_valid
  # end

  # subject(:toby) { User.create!(username: 'toby', password: 'password') }

  it { should validate_presence_of(:username) }
  # it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:songs) }

  describe 'uniqueness' do
    before(:each) do
      # build(:user) -- create instance with :user factory; doesn't save to db
      create(:user) # create instance & save to db
    end

    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe '#is_password?' do
    let(:user) { create(:user) }

    context 'with correct password' do
      it 'should return true' do
        expect(user.is_password?('password')).to be true
      end
    end

    context 'with incorrect password' do
      it 'should return false' do
        expect(user.is_password?('password123')).to be false
      end
    end
  end

  # testing ensure_session_token - pseudo-code
    # create user with nil session_token
    # save
    # user should have session_token in db 
end