# coding: utf-8
class QuestionsController < ApplicationController
  
  # 回答一覧表示処理
  def show
    @question = Question.find(params[:que_id])
  end
  
  # 質問の新規登録用
  def new
    @question = Question.new
  end
  
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
