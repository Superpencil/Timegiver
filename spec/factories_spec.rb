require 'rails_helper'

describe FactoryGirl do
  FactoryGirl.factories.each do |factory|
    context "with factory for :#{factory.name}" do
      subject { FactoryGirl.build(factory.name) }

      it "is valid" do
        expect(subject).to be_valid
      end
    end
  end
end
