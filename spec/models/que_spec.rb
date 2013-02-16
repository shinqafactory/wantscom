# encoding: utf-8
require 'spec_helper'

describe Que do
  
  before(:each) do 
    @attr = {:que_content => "テスト質問事項",
      :que_title => "テストタイトル",
      :que_due_date => 2013-02-16
    }
  end
  
  #質問事項(que_content)
  describe '質問事項 バリデーションチェック' do
    #値が無い場合はエラーとする
    it '質問事項(que_content)が空白の時：エラーが発生すること' do 
      no_content = Que.new(@attr.merge(:que_content => ""))
      no_content.should_not be_valid
    end
    
    #桁数が500文字を超える場合はエラーとする
    it '質問事項(que_content)の文字数が500文字を超える時：エラーが発生することを確認' do
      long_content = Que.new(@attr.merge(:que_content => "a"*501))
      long_content.should_not be_valid
    end
  end
      
  #質問題名(que_title)
  describe '質問題名 バリデーションチェック' do
    #値が無い場合はエラーとする
    it '質問題名(que_title)が空白の時：エラーが発生すること' do 
      no_title = Que.new(@attr.merge(:que_title => ""))
      no_title.should_not be_valid
    end
    
    #桁数が50文字を超える場合はエラーとする
    it '質問題名(que_title)の文字数が50文字を超える時：エラーが発生することを確認' do
      long_title = Que.new(@attr.merge(:que_title => "a"*51))
      long_title.should_not be_valid
    end
  end  
    
  #期限(que_due_date)
  describe '期限 バリデーションチェック' do
    #値が無い場合はエラーとする
    it '期限(que_title)が空白の時：エラーが発生すること' do 
      no_due_date = Que.new(@attr.merge(:que_due_date => nil))
      no_due_date.should_not be_valid
    end
  end
  
end