# encoding: utf-8

# == Schema Information
#
# Table name: ques
#
#  que_id                     :integer          not null, primary key
#  que_content                :string(1500)     not null
#  que_title                  :string(150)      not null
#  que_due_date               :date             not null
#  que_date_time              :datetime         not null
#  que_use_id                 :integer          not null
#  que_id_bn                  :integer          not null
#  que_delete_datetime        :datetime
#  que_ent_kbn                :string(1)        not null

#　バリデーションのチェック
#　質問事項(que_content)
#　　値が無い場合はエラーとする
#　　桁数が500文字を超える場合はエラーとする
#　質問題名(que_title)
#　　値が無い場合はエラーとする
#　　桁数が50文字を超える場合はエラーとする
#　期限(que_due_date)
#　　値が無い場合はエラーとする

require 'spec_helper'

describe Que do
  
  before(:each) do 
    @attr = {:que_content => "テスト質問事項",
      :que_title => "テストタイトル",
      :que_due_date => 2013-02-16
    }
  end
  
  describe '質問事項 バリデーションチェック' do
    it '質問事項(que_content)が空白の時：エラーが発生すること' do 
      no_content = Que.new(@attr.merge(:que_content => ""))
      no_content.should_not be_valid
    end
    
    it '質問事項(que_content)の文字数が500文字を超える時：エラーが発生することを確認' do
      long_content = Que.new(@attr.merge(:que_content => "a"*501))
      long_content.should_not be_valid
    end
  end
      
  describe '質問題名 バリデーションチェック' do
    it '質問題名(que_title)が空白の時：エラーが発生すること' do 
      no_title = Que.new(@attr.merge(:que_title => ""))
      no_title.should_not be_valid
    end
    
    it '質問題名(que_title)の文字数が50文字を超える時：エラーが発生することを確認' do
      long_title = Que.new(@attr.merge(:que_title => "a"*51))
      long_title.should_not be_valid
    end
  end  
    
  describe '期限 バリデーションチェック' do
    it '期限(que_title)が空白の時：エラーが発生すること' do 
      no_due_date = Que.new(@attr.merge(:que_due_date => nil))
      no_due_date.should_not be_valid
    end
  end
  
end