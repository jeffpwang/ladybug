require 'feature_helper'

describe "creating ladybugs" do
  context "on the new ladybugs page" do
    before do
      @user = FactoryGirl.create(:user)
      page.set_rack_session(:user_id => @user.id)  
      visit new_lady_bug_path
    end      

    it "should have a form to create the ladybug" do
      expect(page).to have_css("form#new_lady_bug")

    end    


    # After submitting the form out with the given name, does the
    # ladybug exist in the database?
    #
    # Is the user redirected to a page that displays the postive thought?
    it "should create a ladybug when the form is submitted" do
      fill_in 'lady_bug_content', with: 'Happy'
      click_button('Create Ladybug')
      expect(LadyBug.first.content).to eq("Happy")      
      expect(page).to have_content("Happy")
    end

  end
end
