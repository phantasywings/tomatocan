require 'test_helper'
#require 'capybara'
class UsersTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
	test "Should view profileinfo" do
		visit ('http://localhost:3000/')
		click_on('Discover Discussion Hosts')
		assert_text ('Discussion Hosts')
	end
	test "Should sign up" do
		visit ('http://localhost:3000/')
		click_on('Sign Up', match: :first)
		fill_in(id:'user_name', with: 'name')
		fill_in(id:'user_email', with: 'e@gmail.com')
		fill_in(id:'user_permalink', with:'username')
		fill_in(id:'user_password', with: 'password', :match => :prefer_exact)
		fill_in(id:'user_password_confirmation', with:'password')
		click_on(class: 'form-control btn-primary')
		assert_text ('Sign out')
	end
	#todo: write a test that fails to sign up
	test "Should see control panel" do
		visit ('http://localhost:3000/')
		click_on('Sign Up', match: :first)
		fill_in(id:'user_name', with: 'name')
		fill_in(id:'user_email', with: 'e@gmail.com')
		fill_in(id:'user_permalink', with:'username')
		fill_in(id:'user_password', with: 'password', :match => :prefer_exact)
		fill_in(id:'user_password_confirmation', with:'password')
		click_on(class: 'form-control btn-primary')
		click_on(class: 'dropdown-toggle')
		click_on('Control Panel')
		assert_text('Rewards')
	end 
		
end
