# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'attributes' do
			let(:user) {User.new(name: "Tommy",
				email: "tommy@gmail.com")}  		
  		it "has a name" do
  			expect(user.name).to eq("Tommy")
  		end
  		it "has an email" do
  			expect(user.email).to eq("tommy@gmail.com")
  		end  		
 	end
 	describe 'validations' do
 		
 	end
end
