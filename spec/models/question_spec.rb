# encoding: utf-8
# == Schema Information
#
# Table name: questions
#
#  id                  :integer          not null, primary key
#  que_id              :integer
#  que_content         :string(255)
#  que_title           :string(255)
#  que_due_date        :date
#  que_date_time       :date
#  que_use_id          :integer
#  que_id_bn           :integer
#  que_delete_datetime :string(255)
#  que_ent_kbn         :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#


################### 残作業（未実装） #######################
#　・期限(que_due_date)の日付形式チェックの実装
#　　理由：railsには日付のバリデーションが提供されておらず、それのRSPECも同じように
#　　　　提供されていないため現段階では調査中で止まっています。
#　・テーブル結合のRSPECの実装
#　　理由：テーブル間の結合関係の把握が出来ておらず未着手状態となっています。
#######################################################
#　バリデーションのチェック
#　1.質問事項(que_content)
#　　1-1.値が無い場合はエラーとする
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

describe Question do
  
  before(:each) do 
    @attr = Question.new(que_content: "テスト質問事項", que_title: "テストタイトル",
      que_due_date: 2013-03-04, que_ent_kbn: "1")
  end
  
  subject { @attr }

  it { should respond_to(:que_content) }
  it { should respond_to(:que_title) }
  it { should respond_to(:que_due_date) }
  it { should respond_to(:que_ent_kbn) }
  
  describe '1.質問事項(que_content) バリデーションチェック' do
    it '1-1.質問事項(que_content)が空白の時：エラーが発生すること' do 
      @attr.que_content = ""
      should_not be_valid
    end
    
    it '1-2.質問事項(que_content)の文字数が500文字を超える時：エラーが発生すること' do
      @attr.que_content = "a"*501
      should_not be_valid 
    end
  end
      
  describe '2質問題名(que_title) バリデーションチェック' do
    it '2-1.質問題名(que_title)が空白の時：エラーが発生すること' do 
      @attr.que_title = ""
      should_not be_valid
    end
    
    it '2-2.質問題名(que_title)の文字数が50文字を超える時：エラーが発生すること' do
      @attr.que_title = "a"*51
      should_not be_valid
    end
  end
    
  describe '3.期限(que_due_date) バリデーションチェック' do
    it '3-1.期限(que_due_date)が空白の時：エラーが発生すること' do 
      @attr.que_due_date = ""
      should_not be_valid
    end

#    it '3-2.現時日付より前日付の場合はエラーとする' do 
#      @attr.que_due_date = 2013-03-03
#      should_not be_cannot_be_in_the_past
      #should_not be_valid
#    end
  end
  
  describe '4.登録区分(que_ent_kbn) バリデーションチェック' do
    it '4-1.登録区分が1,2,9以外の時：エラーが発生すること' do
      @attr.que_ent_kbn = "3"
      should_not be_valid
    end
  end
  
end
