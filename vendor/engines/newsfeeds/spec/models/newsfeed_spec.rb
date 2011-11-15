require 'spec_helper'

describe Newsfeed do

  def reset_newsfeed(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @newsfeed.destroy! if @newsfeed
    @newsfeed = Newsfeed.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_newsfeed
  end

  context "validations" do
    
    it "rejects empty title" do
      Newsfeed.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_newsfeed
      Newsfeed.new(@valid_attributes).should_not be_valid
    end
    
  end

end