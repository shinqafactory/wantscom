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
  　　＃ユーザーID付与に関するチェック
  describe "validations" do
    it "should require a user id" do
      Ans.new(@attr).should_not be_vaild
    end
    ＃内容に関するバリデーション
    ＃既定以上の長い内容
    it "should reject nonblank content" do
      no_ans_content = ans.new(@attr.merge(:ans_content => ""))
      no_ans_content.should_not be_vaild
    end
    it "should reject long content" do
       long_ans_content = ans.new(@attr.merge(:ans_content => "a"*751 ))
       long_ans_content.should_not be_vaild
    end
    ＃タイトルに関するバリデーション
    it "should reject nonblank　title " do
         no_ans_titie = ans.new(@attr.merge(:ans_title => ""))
         no_ans_title.should_not be_vaild
    end
    it "should reject long title" do
       long_ans_title = ans.new(@attr.merge(:ans_title => "a"*151 ))
       long_ans_title.should_not be_vaild
    end
    ＃URLに関するバリデーション
    it "should reject nonblank URL" do
       no_ans_url = ans.new(@attr.merge(:ans_url => ""))
       no_ans_url.should_not be_vaild
    end
    it "should reject long URL" do
       long_ans_url = ans.new(@attr.merge(:ans_url => "a"*501 ))
       long_ans_url.should_not be_vaild
    end
  end 
end
