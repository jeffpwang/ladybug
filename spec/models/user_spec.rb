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
		let(:user) do
			FactoryGirl.build(:user)
	end
  		it "has a name" do
  			expect(user.name).to eq("Tommy")
  		end
  		it "has an email" do
			# user = build(:user) 		  			  			
  			expect(user.email).to eq("tommy@gmail.com")
  		end  	
  end
		let(:user) do
			FactoryGirl.create(:user)
	end

 describe '#valid?' do
    context 'when its name is blank' do
		let(:user) do
			FactoryGirl.build(:user, :name => nil)
	end    	
      it 'is not valid' do 
        expect(user).not_to be_valid
      end
    end
   context 'when its attributes are not blank' do
		let(:user) do
			FactoryGirl.build(:user)
	end    	
      it 'is valid' do 
        expect(user).to be_valid
      end
    end  
	end
	describe "#destory dependent?" do
		# context "when a user is destroyed"    
		# let (:user) do			
		# 	FactoryGirl.create(:user)
		#   user.logs.create(attributes_for(:log))
		#   user.logs.create(attributes_for(:log))
		# end
		# it 'destroys all the logs'
		# 	expect(user.name).to eq("Tommy")
		# 	binding.pry
		 end
end
