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
			expect(user.email).to eq("tommy@gmail.com")
		end  	
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

describe "#average_after_mood" do 
    context 'return average mood for after logs' do 
      it 'shows the average after rating mood for user' do
        expect(@angel.average_after_mood).to eq(9)
      end
    end 
  end

  describe "#average_before_mood" do 
    context 'return before mood for after logs' do 
      it 'shows the before rating mood for user' do
        expect(@angel.average_before_mood).to eq(2)
      end
    end 
  end


  describe "#popular_tags" do 
    context 'display most popular tag' do 
      it 'shows most popular tag for user' do
        expect(@bob.popular_tags).to eq({"work"=>3})
      end
    end 
  end

  describe "#top_five_tags" do 
    context 'display top five tags' do 
      it 'shows most popular tag for user' do
        expect(@bob.top_five_tags).to eq({"work"=>3, "relationship"=>1, "school"=>1})
      end
    end 
  end

  describe "#popular_distortions" do 
    context 'display most popular distortion' do 
      it 'shows most popular distortion for user' do
        expect(@bob.popular_distortions).to eq({"Anxious Andy"=>1})
      end
    end 
  end

  describe "#all_distortions" do 
    context 'display all distortions' do 
      it 'shows all distortions for user' do
        expect(@bob.all_distortions).to eq({"Anxious Andy"=>1, "Hurtful Harry"=>1, "Macho Mike"=>1})
      end
    end 
  end

  describe "#saddest_day" do 
    context 'display the most sad day for user' do 
      it 'shows day with lowest rating for user' do
        expect(@bob.saddest_day).to eq("2016-03-15 22:14:34")
      end
    end 
  end

  describe "#cleanup_logs" do 
    context 'destroys all logs for user' do 
      it 'destroys all logs for users' do
        @bob.cleanup_logs
        expect(@bob.logs).to eq([])
      end
    end 
  end 
  
end
