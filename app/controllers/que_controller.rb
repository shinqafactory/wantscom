# coding: utf-8
class QueController < ApplicationController
  
  # 質問の新規登録
  def create
    @que = Que.new(params[:que_id])
    if @member.save
      redirect_to @que, notice: "質問を登録しました。"
    else
      render ""
    end
  end

  # 質問の削除
  def destroy
    @que = Que.find(params[:que_id])
    @que.assign_attributes(params[:que_id])
    if @que.save
      redirect_to @que, notice: "質問を削除しました。"
    else
      render ""
    end
  end

end
