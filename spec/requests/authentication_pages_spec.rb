# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Authentication" do
  
  subject { page }

  describe "signin" do 

  	  before { visit signin_path }

	  it { should have_content('Вход в Chesshall') }
	  it { should have_title('Sign in') }

	  describe "with invalid information" do
      	before { click_button "Войти" }

	    it { should have_title('Sign in') }
	    it { should have_selector('div.alert.alert-error') }

	    # describe "after visiting another page" do
	    #   before { click_link "Home" }
	    #   it { should_not have_selector('div.alert.alert-error') }
	    # end
   	  end

	  describe "with valid information" do
	  	let(:user) { FactoryGirl.create(:user) }
	  	before do
	  		fill_in "Адрес электронной почты",		with: user.email.upcase
	  		fill_in "Пароль",						with: user.password
	  		click_button "Войти"
	  	end

	  	it { should have_title(user.name) }
	  	it { should have_link('Мой профиль',	href: user_path(user)) }
	  	it { should have_link('Выйти',		href: signout_path) }
	  	it { should_not have_link('Войти',	href: signin_path) }

	  	describe "Тест выхода пользователя" do
	  		before { click_link "Выйти" }
	  		it { should have_link('Войти') }
	  	end
	  end
  end
end
