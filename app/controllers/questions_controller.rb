# encoding: utf-8
class QuestionsController < ApplicationController
  
  # 回答一覧表示処理
  def show
    @question = Question.find(params[:id])
    @answer_new = Answer.new
    @answer_all = Answer.all
  end
  
  # 質問の新規登録用
  
  # 質問の新規登録
  def create
#    @question = Question.new(params[:question])
#    if @question.save
#      redirect_to @question, notice: "質問を投稿しました。"
#    else
#      redirect_to "new"
 #     redirect_to root_url
#    end
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to :controller => 'top', :action => 'index' }
        #format.json { render json: @question, status: :created, location: @question }
      else
        redirect_to :action => 'new'
        #format.html { redirect_to action: "new" }
        #format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
    
    end

  # 質問の削除
  def destroy
    @question = Question.find(params[:que_id])
    # 登録区分に9：削除を設定
    @question.que_ent_kbn = "9"
    # 削除日時にsysdateを設定
    @question.que_delete_datetime = Time.now
    
    if @question.update_attributes(params[:que_id])
      redirect_to @question, notice: "質問を削除しました。"
    else
      redirect_to redirect_to
    end
  end
  
end
