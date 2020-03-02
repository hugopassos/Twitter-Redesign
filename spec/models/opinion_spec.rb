require 'rails_helper'

RSpec.describe Opinion, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it 'should belong to a user' do
    opinion = Opinion.reflect_on_association(:user)
    expect(opinion.macro).to eq(:belongs_to)
  end
end
