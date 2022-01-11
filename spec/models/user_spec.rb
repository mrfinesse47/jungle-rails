require 'rails_helper'

RSpec.describe User, type: :model do


  

  describe 'Validations' do

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

    it "must be invalid when email matches existing email in database" do
      expect(@user4).to be_invalid
      expect(@user4.errors.full_messages).to include "Email has already been taken"
    end

  end


end

