require 'rails_helper'

RSpec.feature 'Opinion', type: :feature do
	before :each do
		@user = User.create(username:'hugo', full_name: 'Hugo Passos')
	end

	context 'Should allow users to make a post' do
		scenario 'should get to home' do
			visit login_path
			fill_in 'Username', with: @user.username
			click_button 'Log in'
			expect(page).to have_content('TWEET SOMETHING')
		end
	end
end
