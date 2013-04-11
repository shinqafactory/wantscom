# encoding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user! 
  before_filter :get_user

  # ユーザプロフィール表示処理
  def show
    # ユーザIDに紐づいたquestionとanswerを５件取得
    #   @question = @user.questions.find(:all, :limit => 5)
    #   @answer = @user.answers.find(:all, :limit => 5)#
    #    @question_user_all = current_user.questions.find_all_by_question_ent_kbn('1')
    @answer_user_all = current_user.answers.find_all_by_answer_ent_kbn('1')
    @question_user_all = current_user.questions.find_all_by_que_ent_kbn('1')
    #     @user_detail = current_user
    #   @question_all = User.find(:all) 
    #    @question_all = Question.find(:all)
    #    @answer = Answer.find(:all)

  end

  def questions
    @question = @user.questions.find(:all)
  end

  def answers
    @question = @user.questions.find(:all)
  end

  def get_user
    #ユーザモデルを取得
    #エラー処理とか書く？
    @user = User.find_by_username(params[:uname])
    if @user.nil?
      render_404
    end
  end

end
