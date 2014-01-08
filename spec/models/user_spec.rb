require 'spec_helper'

describe User do
  before { @user = User.new(name: "Pavel Borisov", email: "borisov@chesshall.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
end
