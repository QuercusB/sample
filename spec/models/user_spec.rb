require 'spec_helper'

describe User do
  
  before do
  	@user = User.new(name: "Example User", email: "user1@example.ru", password: "foobar", password_confirmation: "foobar")
  end
  
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should be_valid }

 #Проверка правильности ввода имени
  describe "1. when name is not present" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end
  
  describe "2. when email is not present" do
  	before { @user.email = " " }
  	it { should_not be_valid }
  end

  describe "3. when name is too long" do
  	before { @user.name = "a"*51 }
  	it { should_not be_valid }
  end

  describe "4. when email format is valid" do
  	it "should be invalid" do
  		addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
        	@user.email = invalid_address
        	expect(@user).not_to be_valid 
   		     end
    	end
	end

   # describe "5. email address with mixed case" do
   #  	let(:mixed_case_email) { "Foo@ExAMPle.Com" }

   #  	it "should be saved as all lower-case" do
   #  		@user.email = mixed_case_email
   #  		@user.save
   #  		expect(@user.reload.email).to eq mixed_case_email.downcase
   #  		end
   #  	end

  describe "6. when email format is valid" do
  	it "should be valid" do
  		addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
  		addresses.each do |valid_address|
  			@user.email = valid_address
  			expect(@user).to be_valid
  		end
  	end
  end

  describe "7. when email address is already taken" do
  	before do
  		user_with_same_email = @user.dup
  		user_with_same_email.email = @user.email.upcase
  		user_with_same_email.save
  	end
  	it { should_not be_valid }
  end

 #Тесты для проверки паролей
  describe "8. when password is not present" do
  	before { @user.password = @user.password_confirmation = " " }
  	it { should_not be_valid }
  end

  describe "9. when password doesn't match connfirmation" do
  	before { @user.password_confirmation = "mismatch" }
  	it { should_not be_valid }
  end
  
  describe "10. with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
end
