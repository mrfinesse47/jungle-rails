require 'rails_helper'

RSpec.describe User, type: :model do


  
  subject {User.new({"first_name"=>"Kevin", "last_name"=>"Mason", "email"=>"tt@y.com", "password"=>"12345", "password_confirmation"=>"12345"})}

  describe 'Validations' do

    it "initial product has all four fields and saves successfully" do
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
   end

    # puts subject.inspect
  end


end

