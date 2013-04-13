class TopController < ApplicationController

#  before_filter :authenticate_user! 
  def index
    @users = current_user
    @question_new = Question.new
    @question_all = Question.find_all_by_que_ent_kbn('1')
  end
end
