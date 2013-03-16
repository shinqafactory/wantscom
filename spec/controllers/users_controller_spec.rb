# coding: utf-8
require 'spec_helper'

describe UsersController do
  @user = login_user

  describe '1.ユーザプロフィールにアクセスしたら'do
    before do
      get:'questions',:uname => @user.username
    end

    it '1-1.サクセスであること'do
      response.should be_success
    end

    it '1-2.プロフィールを表示すること'do
      response.should render_template("users/show")
    end

#    it '1-4.質問がDBから取得できていること'do
#      #モック.Userモデルのfind_by_usernameメソッドが引数:allでよびだされることを期待
#      User.should_receive(:find_by_username).with("Test User")
#      get:'show',:uname => @user.username
#    end
#    it '1-5.回答がDBから取得できていること'do
#      it'５件より多い場合はエラー'do
#      end
#    end
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
