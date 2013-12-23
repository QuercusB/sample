# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "Chesshall" }
  
  describe "Home page" do
    
    it "should have the content 'Chesshall'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      page.should have_selector('h1', text: 'Шахматы')
    end
  
    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title', text: "#{base_title}")
    end

    it "should not have a custom title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', text: '| Home')
    end
  end

  describe "Help page" do

  	it "should have the h1 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('h1', text: 'Help')
  	end
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', text: "#{base_title} | Help")
    end
  end

  describe "About page" do

  	it "should have the h1 'About Us'" do
  		visit '/static_pages/about'
  		page.should have_selector('h1', text: 'About Us')
  	end
    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title', text: "#{base_title} | About")
    end
  end

  describe "Contact page" do

    it "should have the h1 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', text: 'Contact')
    end

    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title', text: "#{base_title} | Contact")
    end
  end
end
