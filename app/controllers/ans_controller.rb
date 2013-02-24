class AnsController < ApplicationController
  def create
   @ans = ans.new(params[:que])
     if @ans.save
        redirect_to @user
     else
        render '***'
     end
  end
  def destroy
    @ans = ans.new(params[:que])
      if @ans.save
        redirect_to @que
      else
        render '***'
      end
  end
end