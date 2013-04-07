# encoding: utf-8
class QuestionsController < ApplicationController
  before_filter :authenticate_user! 
  # 回答一覧表示処理
  def show
    @question = Question.find(params[:id])
    @answer_new = Answer.new
    @answer_all = Answer.find_all_by_answer_ent_kbn_and_answer_question_id('1',@question.id)
  end
  
  # 質問の新規登録用
  # 質問の新規登録
  def create
    @question_all = Question.find_all_by_que_ent_kbn('1')
    @question_new = Question.new(params[:question])
    @question_new.que_ent_kbn = "1"
    respond_to do |format|
      if @question_new.save
        format.html { redirect_to :controller => 'top', :action => 'index' }
      else
#        format.html { redirect_to :controller => 'top', :action => 'index' }
        format.html { render :template => "top/index" }
        format.json { render json: @question_new.errors, status: :unprocessable_entity }
        format.json { render json: @question_all }
      end
    end
  end

  # 質問の削除
  def destroy
    @question = Question.find(params[:id])
    # 登録区分に9：削除を設定
    @question.que_ent_kbn = "9"
    # 削除日時にsysdateを設定
    @question.que_delete_datetime = Time.now
    respond_to do |format|
      if @question.save
        format.html { redirect_to :controller => 'top', :action => 'index' }
      else
        format.html { redirect_to :controller => 'top', :action => 'index' }
      end
    end
  end
  
end
