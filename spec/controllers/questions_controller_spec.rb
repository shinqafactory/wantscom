# encoding: utf-8

################### 残作業（未実装） #######################
########################################################
#　検索に関するテスト
#　1.回答一覧表示処理
#　　1-1.質問テーブルから指定した質問IDのレコードが取れなかった場合はエラー
#　2.質問の新規登録
#　　2-1.createを行った場合に質問テーブルにレコードが
#　　　　　増えていない場合はエラー
#　　2-2.create処理が正常に行われていない場合はエラー


require 'spec_helper'

describe QuestionsController do
  
  #before(:each) do
    @que = FactoryGirl.create(:question)
    @params = {
      :id => @que.id,
      :que_id => @que.id,
      :que_content => @que.que_content
    }
  #end
  
#  describe "1.回答一覧表示処理" do
#    subject { { :get => "/questions/1" } }
#    it { should route_to(:controller => "Question", :action => "show", :id => "1") }
#    { get: "/questions/1" }.should route_to(controller: "Question", action: "show", id: "1")
      
#    it { should be_routable }
#    it { should route_to :controller => "Question", :action => "show", :id => "1" }
      
#    describe :routes do
#      subject { {:get => "/blogs/1"} }
#      it { should route_to(controller: "blogs", action: "show", id: "1") }
#    end
#  end
  
    
    it "2-1.createを行った場合に質問テーブルにレコードが増えていない場合はエラー" do
      expect {
#        post :create, {:question => valid_attributes}, valid_session
         post :create, :question => FactoryGirl.attributes_for(:question)
      }.to change(Question, :count).by(1)
      
#    it "2-2.create処理が正常に行われていない場合はエラー" do
#      xhr :post, :create, relationship: { followed_id: other_user.id }
#      response.should be_success
    end
#  end
end
