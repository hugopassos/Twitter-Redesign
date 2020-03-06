require 'rails_helper'

RSpec.feature 'StaticPage', type: :feature do
	before :each do
		@user = User.create(username:'hugo', full_name: 'Hugo Passos')
		@another_user = User.create(username: 'user', full_name: 'User')
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
			# Users should see other users that they don't follow as suggestions to follow
			expect(page).to have_content(@another_user.full_name)
			click_link @another_user.full_name
			expect(page.current_path).to eq user_path(@another_user.id)
			expect(page).to have_selector(:link_or_button, 'Follow')
			click_button 'Follow'
			click_link 'Home'
			expect(page.current_path).to eq home_path
			expect(page).not_to have_selector(:link_or_button, 'Follow')
		end
	end
end
