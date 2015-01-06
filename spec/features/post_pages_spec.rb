require 'rails_helper'
include Warden::Test::Helpers
Warden.test.mode!

RSpec.describe "PostPages", :type => :request do
	let(:user) {FactoryGirl.create(:user) }
	subject { page }

	describe 'new' do
		describe 'as not logged in user' do 
			before { visit root_path }
			it { should_not have_link('New Post') }
		end

		descirbe 'as logged in user' do 
			before do 
				login_as(user)
				visit root_path
			end

		it {should have_link ("New Post") }

		describe 'creating new post' do 
			describe 'with invalid information' do 
				before do
					click_link 'New Post'
					click_button 'Save'
				end

				it { should have_content('Error') }
			end

			describe 'with valid information' do
				before do
					click_link 'New Post'
					fill_in 'Content', with: 'This is my first post'
					click_button 'Save'
				end

				it { should have_content('You have created a post') }
			end 
		end
	end
end

	describe 'edit' do
		let(:post) { FactoryGirl.create(:post, user_id: user.id, content: 'Hello') }
		describe 'as not logged in user' do 
			before { visit edit_post_path(post) }
			it { should_not have_content("Edit Post") }
			it 'should redirect to login page' do 
			   current_path.should == new_user_session_path
		end
	end

		describe 'as logged in' do
			describe 'and wrong user' do
				let(:wrong_user) { FactoryGirl.create(:user) }
				before do 
					login_as(wrong_user)
					visit edit_post_path(post)
			end

			it { should_not have_content('Edit Post') }
		end
	  end

	  	describe 'as correct user' do
	  		before do
	  			login_as(user)
	  			visit edit_post_path(post)
	  		end
	  		it { should have_content('Edit') }

	  		describe 'filling out the form' do 
	  			describe 'with correct information' do
	  				before do 
	  					fill_in 'Content', with: 'Welcome'
	  					click_button 'Save'
	  				end 
	  				it 'should change the content' do 
	  					post.reload.content.should == 'Welcome'
	  	end

	  		describe 'with incorrect information' do
	  			before do 
	  				fill_in 'Content', with: ''
	  				click_button 'Save'
	  			end

	  			it 'shoud not change the content' do 
	  				post.reload.content.should == 'Hello'
	  		end
	  	end
	  end
	end 

	
	describe 'index' do
		let!(:post) { FactoryGirl.create(:post, user_id: user.id) }

		describe 'as not logged in user' do
			before { vist root_path }
			it { should have_content(post.content) }
		end

		describe 'as logged in' do
			describe 'and wrong user' do
				let(:not_owner) { FactoryGirl.create(:user) }
				before do 
					login_as(not_owner)
					visit root_path
					end


				it { should_not have_link('edit') } 
				end

			describe 'as correct user' do 
				before do 
					login_as(user)
					visit root_path
			end 

			it { should have_link('edit') }
			it 'should delete user' do
				expect{ click_link 'delete' }.to change(Post, :count).by(-1)
				end 
			end 
		

		end

	end

end 



