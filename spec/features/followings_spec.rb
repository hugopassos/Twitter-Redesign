require 'rails_helper'

RSpec.feature 'Following', type: :feature do
	before :each do
		@user = User.create(username:'hugo', full_name: 'Hugo Passos')
    @another_user = User.create(username: 'user', full_name: 'User')
	end

	context 'Should see only unfollowed users as suggestions to follow' do
		scenario 'should get to home' do
      visit home_path
			expect(page.current_path).to eq login_path
			fill_in 'Username', with: @user.username
			click_button 'Log in'
			expect(page).to have_content(@another_user.full_name)
			click_link @another_user.full_name
      # The unfollowed user should be suggested
			expect(page.current_path).to eq user_path(@another_user.id)
			expect(page).to have_selector(:link_or_button, 'Follow')
			click_button 'Follow'
      expect(page).to have_selector(:link_or_button, 'Unfollow')
			click_link 'Home'
			expect(page.current_path).to eq home_path
      # Now the followed user shouldn't be suggested anymore
			expect(page).not_to have_content(@another_user.full_name)
		end
	end
end
