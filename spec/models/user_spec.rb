require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(username: 'hugo', full_name: 'Hugo Passos') }
  let(:followed_user) { User.create(username: 'test', full_name: 'Test') }
  let(:not_followed_user) { User.create(username: 'test2', full_name: 'Test2') }
  let(:follow) { user.followings.create(following_id: followed_user.id) }
  let(:opinion) { user.opinions.create(text: 'opinion') }

  describe '#username' do
    it 'should be present' do
      user.username = ''
  		user.valid?
  		expect(user.errors[:username]).to include('can\'t be blank')
    end

    it 'should have at least 2 characters' do
      user.username = 'a'
      user.valid?
      expect(user.errors[:username]).to include('is too short (minimum is 2 characters)')
    end

    it 'shouldn\'t have more than 10 characters' do
      user.username = 'a' * 11
      user.valid?
      expect(user.errors[:username]).to include('is too long (maximum is 10 characters)')
    end
  end

  describe '#full_name' do
    it 'should be present' do
      user.full_name = ''
      user.valid?
  		expect(user.errors[:full_name]).to include('can\'t be blank')
    end

    it 'should have at least 2 characters' do
      user.full_name = 'a'
      user.valid?
  		expect(user.errors[:full_name]).to include('is too short (minimum is 2 characters)')
    end

    it 'shouldn\'t have more than 50 characters' do
      user.full_name = 'a' * 51
      user.valid?
  		expect(user.errors[:full_name]).to include('is too long (maximum is 50 characters)')
    end
  end

  describe '#photo' do
    it 'should be automatically created' do
      expect(user.photo).not_to be_nil
    end
  end

  describe '#cover_image' do
    it 'should be automatically created' do
      expect(user.cover_image).not_to be_nil
    end
  end

  describe '#not_followed_users' do
    it 'should return users not followed by the current user' do
      users = user.not_followed_users
      # The method not_followed_users will return an Active Record relation containing users not followed + the current users itself
      expect(users).to contain_exactly(not_followed_user, user)
      expect(users).not_to contain_exactly(followed_user)
    end
  end

  it 'should destroy dependent opinions when a user is destroyed' do
    expect(user.opinions).to contain_exactly(opinion)
    user.destroy
    expect(user.opinions).to be_empty
  end
end
