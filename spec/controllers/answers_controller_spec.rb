# encoding: utf-8

require 'spec_helper'
describe AnswersController do

  # ファクトリーガール設定
  before(:each) do
    @answer = FactoryGirl.create(:answer)
    @params = {
      :id => @answer.id,
      :answer_content => @answer.answer_content
    }
  end

require 'spec_helper'

#    describe "1.アクセスコントロール" do
#     it "1-1.権限のないもののcreateへのアクセス：エラーを返す" do
#       #post :create
#        #response.should redirect_to(root_path)
#     # end
#     # it "1-2.権限のないもののdestroyへのアクセス：エラーを返す" do
#        #delete :destroy, :id => 1
#       # response.should redirect_to(root_path)
#     # end
#    end
    describe "2.createに関するテスト" do
      before(:each) do
        #@user = test_sign_in(Factory(:user))
      end
      describe "2-1.回答失敗時" do
        before(:each) do
            @answer = { :answer_content => "" }
        end
          it "2-1-1.回答内容がない投稿はエラーである。" do
            lambda do
             post :create, :answer => @answer
            end.should_not change(Answer, :count)
         end
      end
#         it "2-1-2.回答内容がない投稿は投稿ページへ遷移する。" do
#           post :create, :answer => @ans
##           response.should render_template()
#            redirect_to(root_path)
#         end
    end
#       describe "2-2.回答投稿成功時" do
#         before(:each) do
#           @ans = { :answer_content => "Lorem ipsum" }
#         end
#         it "2-2-1.回答は投稿される。" do
#           lambda do
#             post :create, :answer => @ans
#           end.should change(Answer, :count).by(1)
#         end
#         it "2-2-2.回答の投稿後は投稿ページへ遷移する。" do
#           post :create, :answer => @ans
#           response.should redirect_to(root_path)
#         end
#         it "2-2-3.回答の投稿後、回答した旨の連絡が表示される" do
#           post :create, :answer => @ans
#           flash[:success].should =~ "message"
#         end
#       end
#     end
#     describe "destroyに関するテスト" do
#       #describe "ユーザ権限外のないもの" do
#        # before(:each) do
#           #@user = Factory(:user)
#           #wrong_user = Factory(:user, :email => Factory.next(:email))
#           #test_sign_in(wrong_user)
#           #@micropost = Factory(:micropost, :user => @user)
#         #end
#         #it "権限がないためアクセスが否定される" do
#           #delete :destroy, :id => @answer
#           #response.should redirect_to(root_path)
#         #end
#       #end   
#       describe "ユーザ権限のあるもの" do
#         #before(:each) do
#          # @user = test_sign_in(Factory(:user))
#          # @micropost = Factory(:micropost, :user => @user)
#         #end
#         it "回答は削除される。" do
#           lambda do 
#             delete :destroy, :answer_id => @ans
#           end.should change(Answer, :count).by(-1)
#         end
#       end
#     end
end