require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) {Chef.new("Bobby Flay") }
  let(:dessert) {Dessert.new("cake", 20, chef)}
  
  
  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end
      
    it "sets a quantity" do
      expect(dessert.quantity).to eq(20)
    end 

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect do
        Dessert.new("Cake", "Five", "Chef")
      end.to raise_error()
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("Milk")
      expect(dessert.ingredients).to include("Milk")
    end
  end

  

  describe "#mix!" do
    it "shuffles the ingredient array" do
      old_ingredients = ["Milk", "Flour", "Butter", "Eggs"]
      old_ingredients.each {|item| dessert.add_ingredient(item)}
      dessert.mix!
      expect(dessert.ingredients).to_not eq(old_ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(10)
      expect(dessert.quantity).to eq(10)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(30)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titlelize).and_return("Chef Bobby the Great Baker")
      expect(dessert.serve).to eq("Chef Bobby Flay the Great Baker has made 20 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:titlelize).and_return("Chef Bobby the Great Baker")
      expect(chef).to receive(:bake).with(dessert)    
    end
  end
end
