require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(username: 'hugo', full_name: 'Hugo Passos') }

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
end
