# encoding: utf-8

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
      no_ans_content = Ans.new(@attr.merge(:ans_content => ""))
      no_ans_content.should_not be_valid
    end
  end
end
