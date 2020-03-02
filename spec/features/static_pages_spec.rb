require 'rails_helper'

RSpec.feature 'StaticPage', type: :feature do
	before :each do
		@user = User.create(username:'user', full_name: 'user@mail.com')
	end

	context 'Visit root_path' do
		scenario 'should redirect to login_path when not logged in' do
			visit root_path
			expect(page.current_path).to eq login_path
		end
	end
end
