require 'rails_helper'

	describe Post do 
		let(:user){ FactoryGirl.create(:user) }
		before { @post = user.posts.create(content: 'SOME CONTENT')}

		subject { @post }

		it { should be_valid }

		describe 'when content is not present' do 
			before {@post.content = nil }
			it { should_not be_valid }
	end		

	describe 'when user_is is not present' do
		before { @post.user_id = nil }
		




end







