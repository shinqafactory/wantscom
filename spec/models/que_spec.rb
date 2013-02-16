# encoding: utf-8
require 'spec_helper'
#require 'Que'

describe Que do
#  before do
#    @que = Que.new(que_content: "test content", que_title: "test title",
#        que_due_date: "2013/02/13")
#  end 
#  subject { @que }
  
#  before(:each) do 
#    @que = Que.new(que_id: 1,
#    que_content: "テスト質問事項",
#    que_title: "テストタイトル",
#    que_due_date: 2013-02-16,
#    que_date_time: 2013-02-16,
#    que_use_id: 1,
##    que_id_bn: 1,
#    que_ent_kbn: "1"
#    )
#  end
  
  before(:each) do 
    @attr = { :que_content => "test content" }
  end

  #質問事項(que_content)
  #値が無い場合はエラーとする
  it "should require nonblank que_content" do 
    no_content = Que.new(@attr.merge(:que_content => ""))
    no_content.should_not be_valid
  end

  #桁数が500文字を超える場合はエラーとする
  
#  before(:each) do 
#    @attr = { :que_content => "test content" }
#  end

  #質問事項(que_content)
  #値が無い場合はエラーとする
#  it "should require a que_content" do 
    #Que.new(:que_content => "").should_not be_valid
#    @que.que_content.should_not be_valid
#  end
    
    
#  it "should require a que_content" do 
#    before { @que.que_content = "a" }
#    it { should_not be_valid }
#  end
    
    
    
#　 describe que_content," の入力チェックをおこなう " do
#    before { @que.que_content = "" }
#    #値が無い場合はエラーとする
#    it { should_not be_valid }
#  end
    
    
  #桁数が500文字を超える場合はエラーとする
#  describe que_content,"when que_content is too long" do
#    before { @que.que_content = "a"*501 }
#    it { should_not be_valid }
#  end

    
end
