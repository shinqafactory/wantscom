class ApplicationController < ActionController::Base
  protect_from_forgery

  # 500エラー
  def render_500
    render :file => "#{Rails.root}/public/500.html", :status => 500, :layout => false, :content_type => 'text/html'
  end

  # 404エラー
  def render_404
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false, :content_type => 'text/html'
  end
end
