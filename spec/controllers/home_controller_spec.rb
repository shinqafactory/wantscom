# coding: utf-8
require 'spec_helper'

describe HomeController do

  login_user

  it "ユーザがログインしていること" do
    subject.current_user.should_not be_nil
  end

  it "indexをGETリクエストすること" do
    get 'index'
    response.should be_success
  end

end
