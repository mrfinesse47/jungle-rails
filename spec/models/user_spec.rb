require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    before do
      @user0 = User.new({"first_name"=>"Kevin", "last_name"=>"Mason", "email"=>"ttttttttt1t@y.com", "password"=>"1234567", "password_confirmation"=>"1234567"})
    end

    it "must be valid" do
      expect(@user0).to be_valid
    end

    before do
      @user1 = User.new({"first_name"=>"Kevin", "last_name"=>"Mason", "email"=>"tttttt1t@y.com", "password"=>"12345", "password_confirmation"=>"123456"})
    end

    it "must be invalid when passwords dont match" do
      expect(@user1).to be_invalid
      expect(@user1.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    before do
      @user2 = User.new({"first_name"=>"", "last_name"=>"Mason", "email"=>"tttttt1t@y.com", "password"=>"12345", "password_confirmation"=>"12345"})
    end

    it "must be invalid when first_name is not given" do
      expect(@user2).to be_invalid
      expect(@user2.errors.full_messages).to include "First name can't be blank"
    end

    before do
      @user3 = User.new({"first_name"=>"Kevin", "last_name"=>"", "email"=>"tttttt1t@y.com", "password"=>"12345", "password_confirmation"=>"12345"})
    end

    it "must be invalid when last_name is not given" do
      expect(@user3).to be_invalid
      expect(@user3.errors.full_messages).to include "Last name can't be blank"
    end

    before do
      @testUser = User.new({"first_name"=>"Kevin", "last_name"=>" Mason", "email"=>"test@test.com", "password"=>"12345", "password_confirmation"=>"12345"})
      @testUser.save
      @user4 = User.new({"first_name"=>"Kevin", "last_name"=>"Mason", "email"=>"TEST@test.com", "password"=>"12345", "password_confirmation"=>"12345"})
    end

    it "must be invalid when email matches existing email in database (case insensitive)" do
      expect(@user4).to be_invalid
      expect(@user4.errors.full_messages).to include "Email has already been taken"
    end

    before do
      @user5 = User.new({"first_name"=>"Kevin", "last_name"=>"Mason", "email"=>"", "password"=>"12345", "password_confirmation"=>"12345"})
    end

    it "must be invalid when email is not given" do
      expect(@user5).to be_invalid
      expect(@user5.errors.full_messages).to include "Email can't be blank"
    end

    before do
      @user6 = User.new({"first_name"=>"Kevin", "last_name"=>"Mason", "email"=>"hello@yes.com", "password"=>"1", "password_confirmation"=>"1"})
    end

    it "must have a minimum password length of 5" do
      expect(@user6).to be_invalid
      expect(@user6.errors.full_messages).to include "Password is too short (minimum is 5 characters)"
    end

  end

  describe '.authenticate_with_credentials tests' do
    # create the user of example@example.com | password:12345
    before do
      @example_user = User.new({"first_name"=>"Kevin", "last_name"=>"Mason", "email"=>"example1@example.com", "password"=>"1234567", "password_confirmation"=>"1234567"})
      @example_user.save
    end
    
    it "must not be falsy when successfully authenticated, and have first name Kevin, and last name Mason" do
      user = User.authenticate_with_credentials("example1@example.com","1234567")
      #because it normally returns false if it does not authenticate
      expect(user).not_to be_falsy
      expect(user).to have_attributes(:first_name => "Kevin", :last_name  => "Mason")
    end

    it "must allow the user to log in with leading whitespace for email" do
      user = User.authenticate_with_credentials("       example1@example.com","1234567")
      #because it normally returns false if it does not authenticate
      expect(user).not_to be_falsy
      expect(user).to have_attributes(:first_name => "Kevin", :last_name  => "Mason")
    end


    it "must allow the user to log in with mIs-cAsEd eMail" do
      user = User.authenticate_with_credentials("       EXaMpLe1@eXample.Com","1234567")
      #because it normally returns false if it does not authenticate
      expect(user).not_to be_falsy
      expect(user).to have_attributes(:first_name => "Kevin", :last_name  => "Mason")
    end

  end

end

