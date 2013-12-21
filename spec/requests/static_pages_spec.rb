require 'spec_helper'

describe "StaticPages" do

	let(:base_title) {"Chesshall"}

  subject {page}
  describe "Home page" do
    
    before (visit root_path)
    
    it { should have_selector('h1',       text: 'Chesshall') }
  	it { should have_selector('title',    text: full_title('')) }
  	it { should_not have_selector 'title', text: '|Home' }
  	end
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1',    text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About Us')) }
  end

  describe "Chess circles" do

  	it "should have the content 'Chess circles'" do
  		visit chesscircles_path
  		page.should have_selector('h1', :text => 'For chess circles and tournament organizers')
		end

  	it "should have the right title 'About Us'" do
	  	visit  chesscircles_path
  		page.should have_selector('title', :text => "#{base_title} | Chess circles")
		end
	end
end
