require 'rails_helper'

RSpec.describe :product, type: :model do
    let (:product) { build(:product) }
    
    describe "object creation" do
        context "with validations" do
            it "creates a record" do
                expect{ product.save }.to change(Product, :count).by(1)
            end
        end
    end
end