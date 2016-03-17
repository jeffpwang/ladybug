# == Schema Information
#
# Table name: logs
#
#  id            :integer          not null, primary key
#  content       :text
#  before_rating :integer
#  after_rating  :integer
#  distortion_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  belief_id     :integer
#

require 'rails_helper'

RSpec.describe Log, type: :model do
	# describe 'attributes' do
	# 	let(:log) do
	# 		FactoryGirl.build(:log)
	# end
 #  		it "knows who the user is" do
 #  			expect(current_user.name).to eq("Tommy")
 #  		end
 #  		it "has an email" do
	# 		# user = build(:user) 		  			  			
 #  			expect(user.email).to eq("tommy@gmail.com")
 #  		end  	
 #  end
	# 	let(:user) do
	# 		FactoryGirl.create(:user)
	# end



 describe '#valid?' do
    context 'when the rating is not between 1 and 10' do
		let(:log) do
			FactoryGirl.build(:log, :before_rating => 15)
	end    	
      it 'is not valid' do 
        expect(log).not_to be_valid
      end
    end
 
   context 'when the content is blank' do
		let(:log) do
			FactoryGirl.build(:log, :content => nil)
	end    	
      it 'is not valid' do 
        expect(log).not_to be_valid
      end
    end

  end

end