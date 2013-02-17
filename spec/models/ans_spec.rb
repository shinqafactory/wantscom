# encoding: utf-8
require 'spec_helper'

describe Ans do
    
  before(:each) do
    @attr = {:ans_content => "Answer Sample",
               :ans_title => "Answer Title",
               :ans_url => "Answer Url",
               :ans_date => "Answer Date",}
    @que1 = Factory(:questions, :answer => @answer, :created_at => 1.day.ago)
    @que2 = Factory(:questions, :answer => @answer, :created_at => 30.day.ago)
  end

  it "Question is attributed to Answer" do
    @attr.should respond_to(:questions)
  end

  it "should have the right questions in the right order" do
    @attr.questions.should == [@que2, @que1]
  end
end
