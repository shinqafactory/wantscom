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
require 'questions_controller'

describe QuestionsController do
  
  before(:each) do
    @que = FactoryGirl.create(:question)
    @params = {
      :id => @que.id,
      :que_id => @que.id,
      :que_content => @que.que_content
    }
  end
  
  def valid_attributes
    {"id" => 1}
  end
  
  def valid_session
    {}
  end
    
#  describe "1.回答一覧表示処理" do
#    subject { { :get => "/questions/1" } }
#    it { should route_to(:controller => "Question", :action => "show", :id => "1") }
#    { get: "/questions/1" }.should route_to(controller: "Question", action: "show", id: "1")
      
#    expect(:get => "/questions/1").to route_to(:controller => "Question", :action => "index", :id => "1")
    
#    it { should be_routable }
#    it { should route_to :controller => "Question", :action => "show", :id => "1" }
      
#    describe :routes do
#      subject { {:get => "/blogs/1"} }
#      it { should route_to(controller: "blogs", action: "show", id: "1") }
#    end
#  end
  
#  describe "2" do
#    it "2-1.createを行った場合に質問テーブルにレコードが増えていない場合はエラー" do
#      expect do
#        xhr :post, :create, question: { que_id: que_content: }
#      end.to change(Question, :count).by(1)
#    end
#    it "should create new item" do
#      expect{
#        post :create, @params
#      }.to change(Item, :count).by(1)
#    end
    
    
#    it "should create a new post" do
#      lambda do
#        post :create, :question => @attr
#        flash[:notice].should_not be_nil
#      end.should change(Post, :count).by(1)
#    end
    
    it "2-1.createを行った場合に質問テーブルにレコードが増えていない場合はエラー" do
      expect {
        post :create, {:question => valid_attributes}, valid_session
      }.to change(Question, :count).by(1)
#      lambda do
#        post :create, :question => @params
#      end.should change(Question, :count).by(1)
#    end
#    it "2-2.create処理が正常に行われていない場合はエラー" do
#      xhr :post, :create, relationship: { followed_id: other_user.id }
#      response.should be_success
    end
#  end
end
