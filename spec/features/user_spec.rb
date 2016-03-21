require 'feature_helper'

# describe "creating users" do
#   context "on the new user page" do
#     before do
#       @user = FactoryGirl.build(:user)
#       page.set_rack_session(:user_id => @user.id)  
#       visit new_user_path
#     end
#   end

#     it "should have a form to create the user" do
#       expect(page).to have_css("form#new_user")
#       fill_in 'name', with: 'Tommy'
#       click_button('Create User')
#       expect(User.first.name).to eq("Tommy")      
#       expect(page).to eq("Tommy")
#     end    
# end
end
