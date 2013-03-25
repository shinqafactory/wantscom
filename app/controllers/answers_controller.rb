# encoding: utf-8
class AnswersController < ApplicationController
#  before_filter :authorized_user, :only => [:new, :create, :destroy]
 
  def create
     @answer  = Answer.new(params[:answer])
     @answer.answer_ent_kbn = '1'
     if @answer.save
       flash[:success] = "message"
       redirect_to root_path
     else
        feed_items = []
#       render 'questions/show'
        redirect_to root_path
     end
  end
  
  #  回答の削除
  def destroy

    @answer = Answer.find(params[:answer])
    # 登録区分に9: 削除を設定
    @answer.ans_ent_kbn = "9"
    # 削除日時にsysdateを設定
    @answer.ans_delete_datetime = Time.now
    redirect_to root_path
  end

#  private

#    def authorized_user
#      @answer = answer.find(params[:id])
#      redirect_to root_path unless current_user?(@answer.user)
#    end
end
