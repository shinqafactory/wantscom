class AnsController < ApplicationController
  def create
   @ans = ans.new(params[:que])
        if @ans.save
          redirect_to @que
        else
          @title = "Sign up"
          render 'que'
    end
  end
  def destroy
    @ans = ans.new(params[:que])
        if @ans.save
          sign_in @que
        redirect_to @que
        else
          @title = "Sign up"
          render 'que'
        end
  end
end