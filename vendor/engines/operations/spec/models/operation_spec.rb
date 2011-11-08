require 'spec_helper'

describe Operation do

  def reset_operation(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @operation.destroy! if @operation
    @operation = Operation.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_operation
  end

  context "validations" do
    
    it "rejects empty title" do
      Operation.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_operation
      Operation.new(@valid_attributes).should_not be_valid
    end
    
  end

end