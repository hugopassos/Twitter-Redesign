require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let(:opinion) { Opinion.create(text: 'test') }

  describe '#username' do
    it 'should be present' do
      opinion.text = ''
  		opinion.valid?
  		expect(opinion.errors[:text]).to include('can\'t be blank')
    end

    it 'shouldn\'t have more than 280 characters' do
      opinion.text = 'a' * 281
      opinion.valid?
      expect(opinion.errors[:text]).to include('is too long (maximum is 280 characters)')
    end
  end

  it 'should belong to a user' do
    opinion = Opinion.reflect_on_association(:user)
    expect(opinion.macro).to eq(:belongs_to)
  end
end
