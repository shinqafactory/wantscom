# encoding: utf-8

#################### 残作業（未実装） #######################
#　・URLに関するバリデーションの拡充チェック
#　・テーブル結合のRSPECの実装
#　　理由：テーブル間の結合関係の把握が出来ておらず未着手状態となっています。
#  ・
#######################################################

#【テスト内容】
#(1)ユーザーID付与に関するチェック
#ユーザーIDがない場合はエラーとする。
#(2)回答内容（ans_content)に関するバリデーション
#次の場合はエラーとする（751文字以上、空欄）
#(3)回答タイトル（ans_title)に関するバリデーション
#次の場合はエラーとする（151文字以上、空欄）
#(4)回答URLに関するバリデーション
#次の場合はエラーとする（501文字以上、空欄、内容に以下が含まれないもの（http,https))

require 'spec_helper'

describe Ans do
    
before(:each) do
  @attr = {:ans_content => "Answer Sample",
             :ans_title => "Answer Title",
             :ans_url   => "Answer url"
  }
end  
describe "バリデーション" do

    it "空欄の回答内容はエラーとなる。" do
      no_content = Ans.new(@attr.merge(:ans_content => ""))
      no_content.should_not be_valid
    end
    it "長い（751文字以上）の回答内容はエラーとなる。" do
       long_ans_content = Ans.new(@attr.merge(:ans_content => "a"*751 ))
       long_ans_content.should_not be_valid
    end
    it "空欄の回答題名はエラーとなる。" do
       no_title = Ans.new(@attr.merge(:ans_title => ""))
       no_title.should_not be_valid
    end
    it "長い（151文字以上）の回答題名はエラーとなる。" do
       long_ans_title = Ans.new(@attr.merge(:ans_title => "a"*151 ))
       long_ans_title.should_not be_valid
    end
    it "空欄の回答URLはエラーとなる。" do
       no_ans_url = Ans.new(@attr.merge(:ans_url => ""))
       no_ans_url.should_not be_valid
    end
    it "長い（500文字以上）の回答URLはエラーとなる。" do
       long_ans_url = Ans.new(@attr.merge(:ans_url => "a"*501 ))
       long_ans_url.should_not be_valid
    end
  end
end
