# encoding: utf-8

################### 残作業（未実装） #######################
########################################################
#　検索に関するテスト
#　1.回答一覧表示処理
#　　1-1.質問テーブルから指定した質問IDのレコードが取れなかった場合はエラー
#　　1-2.桁数が500文字を超える場合はエラーとする
#　2.質問題名(que_title)
#　　2-1.値が無い場合はエラーとする
#　　2-2.桁数が50文字を超える場合はエラーとする
#　3.期限(que_due_date)
#　　3-1.値が無い場合はエラーとする
#　　3-2.現時日付より前日付の場合はエラーとする
#　　3-3.YYYY/MM/DD形式以外はエラーとする
#　4.登録区分(que_ent_kbn)
#　　4-1.値が"1","2","9"以外の場合はエラーとする

require 'spec_helper'

describe QuestionsController do
  
  describe "1.回答一覧表示処理" do
#    subject { { :get => "/questions/1" } }
#    it { should route_to(:controller => "Question", :action => "show", :id => "1") }
#    { get: "/questions/1" }.should route_to(controller: "Question", action: "show", id: "1")
      
    expect(:get => "/questions/1").to route_to(:controller => "Question", :action => "index", :id => "1")
    
  end
  
end
