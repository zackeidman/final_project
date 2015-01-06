require 'rails_helper'

RSpec.describe Relationship, :type => :model do
		let(:following_user) { FactoryGirl.create(:user) }
		let(:followed_user) { FactoryGirl.create(:user) }

		before {@relationship = following_user.relationships.create(following_id: followed_user.id) }

		subject { @relationship }

		it { should be_valid }
		its(:followed_user) { should == followed_user }
		its(:following_user) { should == following_user }

		describe 'when follower_id is not present' do
			before { @relationship.follower_id = nil }
			it { should_not be_valid }
		end

		describe 'when following_id is not present' do
			before { @relationship.following_id = nil }
			it { should_not be_valid }
		end

end
