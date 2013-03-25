# encoding: utf-8
class AnswersController < ApplicationController
#  before_filter :authorized_user, :only => [:create, :destroy]
  #  回答の新規作成
  def create
     @answer  = Answer.new(params[:answer2])
     if @answer.save
#       flash[:success] = "message"
       redirect_to root_path, notice: "回答を投稿しました。"
     else
       @feed_items = []
       redirect_to 'questions/show'
     end
  end
  
  #  回答の削除
  def destroy
    @answer = Answer.find(params[:answer2])
    # 登録区分に9: 削除を設定
    @answer.ans_ent_kbn = "9"
    # 削除日時にsysdateを設定
    @answer.ans_delete_datetime = Time.now
    

    redirect_to root_path, notice: "回答を削除しました"
  end

#  private

#    def authorized_user
#      @answer = answer.find(params[:id])
#      redirect_to root_path unless current_user?(@answer.user)
#    end
end
