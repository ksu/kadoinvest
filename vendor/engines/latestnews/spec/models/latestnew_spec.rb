require 'spec_helper'

describe Latestnew do

  def reset_latestnew(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @latestnew.destroy! if @latestnew
    @latestnew = Latestnew.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_latestnew
  end

  context "validations" do
    
    it "rejects empty title" do
      Latestnew.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_latestnew
      Latestnew.new(@valid_attributes).should_not be_valid
    end
    
  end

end