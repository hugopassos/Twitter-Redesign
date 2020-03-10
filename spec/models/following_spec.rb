require 'rails_helper'

RSpec.describe Following, type: :model do
  it 'should belong to a user' do
    following = Following.reflect_on_association(:user)
    expect(following.macro).to eq(:belongs_to)
  end

  it 'should belong to a following' do
    following = Following.reflect_on_association(:following)
    expect(following.macro).to eq(:belongs_to)
  end
end
