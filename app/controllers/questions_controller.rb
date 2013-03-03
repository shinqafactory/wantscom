class QuestionsController < ApplicationController
  
  # 質問の新規登録
  def create
    @question = Question.new(params[:que_id])
    if @question.save
      redirect_to @question, notice: "質問を登録しました。"
    else
      render "home@index"
    end
  end

  # 質問の削除
  def destroy
    @question = Question.find(params[:que_id])
    @question.assign_attributes(params[:que_id])
    if @question.save
      redirect_to @question, notice: "質問を削除しました。"
    else
      render "home"
    end
  end
  
end
