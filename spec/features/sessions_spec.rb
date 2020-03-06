require 'rails_helper'

RSpec.feature 'Session', type: :feature do
	before :each do
		@user = User.create(username:'hugo', full_name: 'Hugo Passos')
	end

	context 'Login with existent user' do
		scenario 'should get to home' do
			visit login_path
			fill_in 'Username', with: @user.username
			click_button 'Log in'
			expect(page.current_path).to eq home_path
		end
	end

	context 'Login with unexistent user' do
		scenario 'should remain in the login page' do
      visit login_path
			fill_in 'Username', with: 'unexistent'
			click_button 'Log in'
			expect(page.current_path).to eq login_path
		end
	end

	context 'Visit login_path when logged in' do
		scenario 'should redirect to home' do
			visit login_path
			fill_in 'Username', with: @user.username
			click_button 'Log in'
			visit login_path
			expect(page.current_path).to eq home_path
		end
	end
end
