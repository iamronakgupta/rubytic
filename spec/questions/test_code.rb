# calculator_spec.rb

require_relative '../../app/questions/ruby_code'
RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  describe "#add" do
    it "returns the sum of two numbers" do
      expect(calculator.add(2, 3)).to eq(5)
    end
  end

  describe "#subtract" do
    it "returns the difference between two numbers" do
      expect(calculator.subtract(5, 3)).to eq(2)
    end
  end

  describe "#multiply" do
    it "returns the product of two numbers" do
      expect(calculator.multiply(2, 3)).to eq(6)
    end
  end

  describe "#divide" do
    it "returns the division of two numbers" do
      expect(calculator.divide(6, 3)).to eq(2)
    end

    it "raises an error when dividing by zero" do
      expect { calculator.divide(6, 0) }.to raise_error(ArgumentError, "Cannot divide by zero")
    end
  end
end
