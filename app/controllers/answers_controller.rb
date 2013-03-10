# encoding: utf-8
class AnswersController < ApplicationController
  before_filter :authorized_user, :only => [:create, :destroy]
  def create
     @answer  = question.answers.build(params[:id])
     if @answer.save
       flash[:success] = "回答が投稿されました!"
       redirect_to root_path
     else
       @feed_items = []
       render 'questions/show'
     end
   end
  def destroy
    @answer.save
    redirect_to root_path
  end

  private

    def authorized_user
      @answer = answer.find(params[:id])
      redirect_to root_path unless current_user?(@answer.user)
    end
end
