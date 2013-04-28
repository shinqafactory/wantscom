# encoding: utf-8

module ApplicationHelper
  
  #ユーザーIDを元にユーザー名を取得
  def get_user_name(user_id)
    @user_name = User.select("username").find_by_id(user_id)
    return @user_name.username
  end
  
end
