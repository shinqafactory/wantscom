# encoding: utf-8
class AnswersController < ApplicationController
#  before_filter :authorized_user, :only => [:new, :create, :destroy]
  def new
    @answer = Answer.new
  end
  
  def create
     answer  = Answer.new(params[:answer])
     if answer.save
       flash[:success] = "message"
       redirect_to root_path 
     else
        feed_items = []
#       render 'questions/show'
        redirect_to root_path
     end
  end
  
  def destroy
    @answer = Answer.new(params[:answer])
    @answer.save
    redirect_to root_path
  end

#  private

#    def authorized_user
#      @answer = answer.find(params[:id])
#      redirect_to root_path unless current_user?(@answer.user)
#    end
end
