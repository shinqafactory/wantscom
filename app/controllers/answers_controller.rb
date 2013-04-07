﻿# encoding: utf-8
class AnswersController < ApplicationController

  before_filter :authenticate_user! ,:only => [:create, :destroy]
  # 回答の新規登録
  def create

     @answer  = current_user.answers.new(params[:answer])
     @answer.answer_ent_kbn = '1'

     if @answer.save
        redirect_to :back
     else
        feed_items = []
        redirect_to root_path
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
  

 
 private
 
#    def authorized_user
#      @answer = answer.find(params[:id])
#      redirect_to root_path unless current_user?(@answer.user)
#    end
end
