class TopController < ApplicationController
#  before_filter :authenticate_user! 
  def index
    #@users = User.all
    @question = Question.find(:all, :conditions => { :que_ent_kbn => "1"}, :order => "created_at DESC")
  end
end
