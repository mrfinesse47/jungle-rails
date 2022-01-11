require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  
  let(:category){Category.create(name: "anything")}

  subject {category.products.create({name: "whatever", price: 12312, quantity: 2})}

  describe 'Validations' do

    it "initial product has all four fields and saves successfully" do
       expect(subject).to be_valid
       expect(subject.errors.full_messages).to be_empty
    end

    it "should be invalid when subject name is not provided" do
      subject.name = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include "Name can't be blank"
    end

    it "should be invalid when price is not provided" do
      subject.price_cents = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include "Price can't be blank"
    end
   
    it "should be invalid when quantity is not provided" do
      subject.quantity = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include "Quantity can't be blank"
    end

    it "should be invalid when category is not provided" do
      subject.category_id = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include "Category can't be blank"
    end
   
  end
end