require 'feature_helper'

describe "creating logs" do
  context "on the new logs page" do
    before do
      @user = @bob
      page.set_rack_session(:user_id => @user.id)  
      visit new_log_path
    end      

    it "should have a form to create the logs" do
      expect(page).to have_css("form#new_log")

    end 

    # After submitting the form out with the given name, does the
    # ladybug exist in the database?
    #
    # Is the user redirected to a page that displays the postive thought?

    it "should create a log when the form is submitted" do
      fill_in 'log_content', with: "Sad"     
      click_button('Create Log')
      expect(page).to have_content("Sad")
      expect(Log.first.content).to eq("Sad")
    end

    it "should save log to user" do 
    end 
  end
end
