require 'spec_helper'

describe "StaticPages" do

	let(:base_title) {"Chesshall"}

  describe "Home page" do
    
    it "should have the content 'Chesshall'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Chesshall')
    end
	
	it "should have the base title" do
  		visit '/static_pages/home'
  		page.should have_selector('title', :text => "Chesshall") 
	end

	it "should not have the custom page title" do
  		visit '/static_pages/home'
  		page.should_not have_selector('title', :text => '|Home') 
	end
  end

  describe "Help page" do

  	it "should have the content 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('h1', :text => 'Help')
  	end

  	it "should have the right title 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('title', :text => "#{base_title} | Help")
  end
end

  describe "About page" do

  	it "should have the content 'About Us'" do
  		visit '/static_pages/about'
  		page.should have_selector('h1', :text => 'About Us')
		end

  	it "should have the right title 'About Us'" do
	  	visit '/static_pages/about'
  		page.should have_selector('title', :text => "#{base_title} | About Us")
		end
	end

  describe "Chess circles" do

  	it "should have the content 'Chess circles'" do
  		visit '/static_pages/chesscircles'
  		page.should have_selector('h1', :text => 'For chess circles and tournament organizers')
		end

  	it "should have the right title 'About Us'" do
	  	visit '/static_pages/chesscircles'
  		page.should have_selector('title', :text => "#{base_title} | Chess circles")
		end
	end
end
