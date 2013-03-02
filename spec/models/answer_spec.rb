# encoding: utf-8

#【テスト未了事項】
#(1)他モデルからの接続関係のテスト
#(2)回答URLに関するバリデーション
#次の場合はエラーとする（501文字以上、空欄、内容に以下が含まれないもの（http,https))

#【テスト内容】
#(1)ユーザーID付与に関するチェック
#ユーザーIDがない場合はエラーとする。
#(2)回答内容（answer_content)に関するバリデーション
#次の場合はエラーとする（751文字以上、空欄）
#(3)回答タイトル（ans_title)に関するバリデーション
#次の場合はエラーとする（151文字以上、空欄）


require 'spec_helper'

describe Answer do
    
before(:each) do
  @attr = {:answer_content => "Answer Sample",
             :answer_title => "Answer Title",
             :answer_url   => "Answer url"
  }
end  
describe "バリデーション" do

    it "(1-1)空欄の回答内容はエラーとなる。" do
      no_content = Answer.new(@attr.merge(:answer_content => ""))
      no_content.should_not be_valid
    end
    it "(1-2)長い（751文字以上）の回答内容はエラーとなる。" do
       long_answer_content = Answer.new(@attr.merge(:answer_content => "a"*751 ))
       long_answer_content.should_not be_valid
    end
    it "(2-1)空欄の回答題名はエラーとなる。" do
       no_title = Answer.new(@attr.merge(:answer_title => ""))
       no_title.should_not be_valid
    end
    it "(2-2)長い（151文字以上）の回答題名はエラーとなる。" do
       long_answer_title = Answer.new(@attr.merge(:answer_title => "a"*151 ))
       long_answer_title.should_not be_valid
    end
    it "(3-1)空欄の回答URLはエラーとなる。" do
       no_answer_url = Answer.new(@attr.merge(:answer_url => ""))
       no_answer_url.should_not be_valid
    end
    it "(3-2)長い（500文字以上）の回答URLはエラーとなる。" do
       long_answer_url = Answer.new(@attr.merge(:answer_url => "a"*501 ))
       long_answer_url.should_not be_valid
    end
  end
end
