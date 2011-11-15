require 'spec_helper'

describe New do

  def reset_new(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @new.destroy! if @new
    @new = New.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_new
  end

  context "validations" do
    
    it "rejects empty title" do
      New.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_new
      New.new(@valid_attributes).should_not be_valid
    end
    
  end

end