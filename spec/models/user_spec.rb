require 'rails_helper'

RSpec.describe User, :type => :model do

	before { @user = User.new(email: 'zackeidman@gmail.com', password: '5htp100mg', password_confirmation: '5htp100mg') }
	subject { @user }

	it { should be_valid }
	it { should respond_to(:followers) }
	it { should respond_to(:users_followed) }
end
