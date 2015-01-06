require 'rails_helper'
include Warden::Test:Helpers
Warden.test.mode!

RSpec.describe "FollowingUsers", :type => :request do
 	subject { page }

 	let(:following_user) {FactoryGirl.create(:user) }
 	let(:followed_user) {FactoryGirl.create(:user) }
 	let(:post) { FactoryGirl.create(:post, user_id: followed_user.id) }

 	describe 'as not logged in user' do
 		before { visit root_path }
 		it { should_not have_button('follow') }
 	end 

 	describe 'as logged in user' do

 		describe 'own post' do 
 			before do
 				login_as(followed_user)
 				visit root_path
 			end

 			it { should_not have_button('follow') }
 		end 

 		describe 'other users posts' dp 
 		before do
 			login_as(following_user)
 			visit root_path
 		end
 		it { should have_button('follow') }
 		it ' should create connection' do
 			expect {click_button 'follow' }.to change(Relationship, :count).by(1)
 	end

 end

end

end