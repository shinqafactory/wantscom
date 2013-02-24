#【テスト未了事項】
#(1)他モデルからの接続関係のテスト
#（２）URLに関するバリデーションの拡充チェック

#【テスト内容】
#(1)ユーザーID付与に関するチェック
#ユーザーIDがない場合はエラーとする。
#(2)回答内容（ans_content)に関するバリデーション
#次の場合はエラーとする（751文字以上、空欄）
#(3)回答タイトル（ans_title)に関するバリデーション
#次の場合はエラーとする（151文字以上、空欄）
#(4)回答URLに関するバリデーション
#次の場合はエラーとする（501文字以上、空欄、内容に以下が含まれないもの（http,https))

# encoding: utf-8
require 'spec_helper'

describe Ans do
    
  before(:each) do
    @attr = {:ans_content => "Answer Sample",
               :ans_title => "Answer Title",
               :ans_url => "Answer url",
               :ans_date => "Answer Date",}
    @que1 = Factory(:questions, :answer => @answer, :created_at => 1.day.ago)
    @que2 = Factory(:questions, :answer => @answer, :created_at => 30.day.ago)
  end

  it "質問は回答に帰属する。" do
    @attr.should respond_to(:questions)
  end

  it "回答は正しい順番で並ぶ。" do
    @attr.questions.should == [@que2, @que1]
  end

  describe "質問関連のバリデーション" do
    it "ユーザーIDは必要とされる。" do
      Ans.new(@attr).should_not be_vaild
    end

    it "空欄の回答内容はエラーとなる。" do
      no_ans_content = ans.new(@attr.merge(:ans_content => ""))
      no_ans_content.should_not be_vaild
    end
    it "長い（751文字以上）の回答内容はエラーとなる。" do
       long_ans_content = ans.new(@attr.merge(:ans_content => "a"*751 ))
       long_ans_content.should_not be_vaild
    end
    it "空欄の回答題名はエラーとなる。" do
         no_ans_titie = ans.new(@attr.merge(:ans_title => ""))
         no_ans_title.should_not be_vaild
    end
    it "長い（151文字以上）の回答題名はエラーとなる。" do
       long_ans_title = ans.new(@attr.merge(:ans_title => "a"*151 ))
       long_ans_title.should_not be_vaild
    end
    it "空欄の回答URLはエラーとなる。" do
       no_ans_url = ans.new(@attr.merge(:ans_url => ""))
       no_ans_url.should_not be_vaild
    end
    it "長い（500文字以上）の回答URLはエラーとなる。" do
       long_ans_url = ans.new(@attr.merge(:ans_url => "a"*501 ))
       long_ans_url.should_not be_vaild
    end
    it "回答URLはhttpを含んっでいる。" do
           http_ans_url = ans.new(@attr.merge(:ans_url => "http" ))
           http_ans_url.should be_vaild
    end
    it "回答URLはhttpsを含んっでいる。" do
           https_ans_url = ans.new(@attr.merge(:ans_url => "https" ))
           https_ans_url.should be_vaild
    end

  end 
end
