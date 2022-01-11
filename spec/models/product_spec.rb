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
      puts subject.inspect
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include "Category can't be blank"
    end
   
  end
end

# example snippets


# describe Order do
#   describe "#submit" do

#     before do
#       @book = Book.new(:title => "RSpec Intro", :price => 20)
#       @customer = Customer.new
#       @order = Order.new(@customer, @book)

#       @order.submit
#     end

#    describe "customer" do
#      it "puts the ordered book in customer's order history" do
#        expect(@customer.orders).to include(@order)
#        expect(@customer.ordered_books).to include(@book)
#      end
#    end

#    describe "order" do
#      it "is marked as complete" do
#        expect(@order).to be_complete
#      end

#      it "is not yet shipped" do
#        expect(@order).not_to be_shipped
#      end
#    end
#   end
# end

# # spec/string_calculator_spec.rb
# describe StringCalculator do

#   describe ".add" do
#     context "given an empty string" do
#       it "returns zero" do
#         expect(StringCalculator.add("")).to eq(0)
#       end
#     end
#   end
# end

# spec/string_calculator_spec.rb
# describe StringCalculator do

#   describe ".add" do
#     context "two numbers" do
#       context "given '2,4'" do
#         it "returns 6" do
#           expect(StringCalculator.add("2,4")).to eql(6)
#         end
#       end

#       context "given '17,100'" do
#         it "returns 117" do
#           expect(StringCalculator.add("17,100")).to eql(117)
#         end
#       end
#     end
#   end
# end