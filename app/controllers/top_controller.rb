class TopController < ApplicationController
 # before_filter :authenticate_user! 
  def index
    #@users = User.all
    @question_new = Question.new
    @question_all = Question.all
  end
end
