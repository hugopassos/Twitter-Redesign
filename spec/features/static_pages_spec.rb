require 'rails_helper'

RSpec.feature 'StaticPage', type: :feature do
	before :each do
		@user = User.create(username:'hugo', full_name: 'Hugo Passos')
	end

	context 'Root_path will change depending on the user being logged in or not' do
		scenario 'should redirect to login_path when not logged in, and should redirect to home_path when logged in' do
			# For non logged in users, root_path should always be login_path
			visit root_path
			expect(page.current_path).to eq login_path
			visit home_path
			expect(page.current_path).to eq login_path
			fill_in 'Username', with: @user.username
			click_button 'Log in'
			# For logged in users, root_path should always be home_path
			expect(page.current_path).to eq home_path
			visit login_path
			expect(page.current_path).to eq home_path
		end
	end
end
