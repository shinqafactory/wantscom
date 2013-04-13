# encoding: utf-8
class AnswersController < ApplicationController

  before_filter :authenticate_user! ,:only => [:create, :destroy]
  # 回答の新規登録
  def create
     @answer_new  = current_user.answers.new(params[:answer])
     @answer_new.answer_ent_kbn = '1'
     respond_to do |format|
     if @answer_new.save
       format.html { redirect_to :controller => 'questions', :action => 'show', :id => @answer_new.answer_question_id }
     else
       format.json { render json: @answer_new.errors, status: :unprocessable_entity }
       @question = Question.find_by_id(@answer_new.answer_question_id)
       @answer_all = @question.answers.find_all_by_answer_ent_kbn('1')     
       format.html { render :template =>"questions/show"}
     end
  end
end

 #  回答の削除
  def destroy
    @answer = Answer.find(params[:id])
    # 登録区分に9: 削除を設定
    @answer.answer_ent_kbn = '9'
    if @answer.save
      redirect_to :back
    else
      redirect_to root_path
    end
  end
end
