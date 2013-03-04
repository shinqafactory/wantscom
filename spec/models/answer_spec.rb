# encoding: utf-8

#####################残作業（未実装）###########################
#・他モデルからの接続関係のテスト
#　理由：作業方法が不明確であるため
#・回答URLに関する長さ・実在性を除いたテスト（形式フォーマット等）
# 理由：invaildとすべき状況について把握不十分のため
#　例示　次の場合はエラーとする（501文字以上、空欄、内容に以下が含まれないもの（http,https))
############################################################

#【テスト内容】
#1.回答事項（answer_content)に関するバリデーション
# 1-1.値が無い場合はエラーとする
# 1-2.桁数が750文字を超える場合はエラーとする
#2.回答タイトル（answer_title)に関するバリデーション
#　2-1.値が無い場合はエラーとする
# 2-2.桁数が150文字を超える場合はエラーとする
#3.回答URL（answer_url)に関するバリデーション
#　3-1.値が無い場合はエラーとする
# 3-2.桁数が500文字を超える場合はエラーとする
# 3-3.(未実装参照）

require 'spec_helper'

describe Answer do
    
before(:each) do
  @attr = {:answer_content => "Answer Sample",
             :answer_title => "Answer Title",
             :answer_url   => "Answer url"
  }
end  

it { should respond_to(:answer_content) }
it { should respond_to(:answer_title) }
it { should respond_to(:answer_url) }
  
it { should be_valid }
  
  describe "1.回答事項（answer_content)バリデーションチェック" do
    it "1-1.回答事項(answer_content)が空白の時：エラーが発生すること" do
      no_content = Answer.new(@attr.merge(:answer_content => ""))
      no_content.should_not be_valid
    end
    it "1-2.回答事項(answer_content)の文字数が750文字を超える時：エラーが発生すること" do
      long_answer_content = Answer.new(@attr.merge(:answer_content => "a"*751 ))
      long_answer_content.should_not be_valid
    end
  end
  describe "2.回答タイトル（answer_title)バリデーションチェック" do    
    it "2-1.回答タイトル(answer_title)が空白の時：エラーが発生すること" do
      no_title = Answer.new(@attr.merge(:answer_title => ""))
      no_title.should_not be_valid
    end
    it "2-2.回答タイトル(answer_title)の文字数が150文字を超える時：エラーが発生すること"do
      long_answer_title = Answer.new(@attr.merge(:answer_title => "a"*151 ))
      long_answer_title.should_not be_valid
    end
  end
  describe "3.回答URL（answer_url)バリデーションチェック" do    
    it "3-1.回答URL(answer_url)が空白の時：エラーが発生すること" do
     no_answer_url = Answer.new(@attr.merge(:answer_url => ""))
     no_answer_url.should_not be_valid
    end
    it "3-2.回答タイトル(answer_url)の文字数が501文字を超える時：エラーが発生すること" do
     long_answer_url = Answer.new(@attr.merge(:answer_url => "a"*501 ))
     long_answer_url.should_not be_valid
    end
    #it "変更未了" do
     #invaild_answer_url = Answer.new(@attr.merge(:answer_url => *** ))
     #invaild_answer_url.should_not be_valid
    #end
    #it "変更未了" do
    #invaild_answer_url = Answer.new(@attr.merge(:answer_url => *** ))
     #invaild_answer_url.should_not be_valid
    #end
    #it "変更未了" do
    #invaild_answer_url = Answer.new(@attr.merge(:answer_url => *** ))
     #invaild_answer_url.should_not be_valid
    #end
  end

end
