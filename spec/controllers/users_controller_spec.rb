# coding: utf-8

################### 未実装 #######################
########################################################
#  DBからの取得確認
#  1.回答一覧
#  2.質問一覧　
#  ただし，プロフィールページでのモデル取得確認が完了していることから
#  重複した処理になるとの予想，またviewからも確認されることから緊急性は低いと判断


require 'spec_helper'

#各モデルのモックをつくってfindの返り値を検証
#FactoryGirlと代用できないか？
def mock_question(stubs={})
  @mock_question ||= mock_model(Question, stubs) 
end
def mock_answer(stubs={})
  @mock_question ||= mock_model(Question, stubs) 
end
def mock_user
  @mock_user ||= mock_model(User, {
    :questions => [mock_question],
    :answers => [mock_answer]
  }) 
end


describe UsersController do

  @user = login_user

  describe '1.ユーザプロフィールにアクセスしたら'do
    before do
      get:'show',:uname => @user.username
    end

    it '1-1.サクセスであること'do
      response.should be_success
    end

    it '1-2.プロフィールを表示すること'do
      response.should render_template("users/show")
    end

    it '1-3.質問および回答がモデルから取得できていること'do
      #Userモデルのfind_by_usernameメソッドが引数@user.usernameでよびだされてmock_userを返すことを期待
      User.should_receive(:find_by_username).with(@user.username).and_return(mock_user)
      #mock_userのアソシエーションを参照してレシーブ
      mock_user.questions.should_receive(:find).with(:all, :limit => 5).and_return(mock_question)
      mock_user.answers.should_receive(:find).with(:all, :limit => 5).and_return(mock_answer)
      #最後にgetする決まり
      get:'show',:uname => @user.username
    end

  end

  describe '2.プロフィールの質問一覧にアクセスしたら'do
    before do
      get:'questions',:uname => @user.username
    end

    it '2-1.サクセスであること'do
      response.should be_success
    end

    it '2-2.質問一覧を表示すること'do
      response.should render_template("users/questions")
    end
  end

  describe '3.プロフィールの回答一覧にアクセスしたら'do
    before do
      get:'answers',:uname => @user.username
    end

    it '3-1.サクセスであること'do
      response.should be_success
    end

    it '3-2.回答一覧を表示すること'do
      response.should render_template("users/answers")
    end
  end

  #  it "ユーザがログインしていること" do
  #    subject.current_user.should_not be_nil
  #  end

  #  it "indexをGETリクエストすること" do
  #    get 'index'
  #    response.should be_success
  #  end

end
