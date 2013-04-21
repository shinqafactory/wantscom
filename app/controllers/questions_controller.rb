# encoding: utf-8
class QuestionsController < ApplicationController
  before_filter :authenticate_user! ,:only => [:create, :destroy]
  # 回答一覧表示処理
  def show
    @question = Question.find(params[:id])
    @user = current_user
    @answer_new = Answer.new
    @answer_all = @question.answers.find_all_by_answer_ent_kbn('1')
    @user_answer = User.find_by_id(@answer_all.answer_user_id)
  end
  
  # 質問の新規登録用
  # 質問の新規登録
  def create
    @question_all = Question.find_all_by_que_ent_kbn('1')
    @question_new = current_user.questions.new(params[:question])
    @question_new.que_ent_kbn = "1"
    
    respond_to do |format|
      if @question_new.save
        format.html { redirect_to :controller => 'top', :action => 'index' }
      else
        format.html { render :template => "top/index" }
        format.json { render json: @question_new.errors, status: :unprocessable_entity }
        format.json { render json: @question_all }
      end
    end
  end

  # 質問の削除
  def destroy
    @question = Question.find(params[:id])
    # 登録区分に9：削除を設定
    @question.que_ent_kbn = "9"
    # 削除日時にsysdateを設定
    @question.que_delete_datetime = Time.now
    respond_to do |format|
      if @question.save
        format.html { redirect_to :controller => 'top', :action => 'index' }
      else
        format.html { redirect_to :controller => 'top', :action => 'index' }
      end
    end
  end
  
  def upload_process
    #アップロードファイルを取得
    file = params[:upfile]
    #ファイルのベース名（パスを除いた部分）を取得
    name = file.original_filename
    #許可する拡張子を定義
    perms =['.jpg','.jpeg','.gif','.png']
    #配列permsにアップロードファイルの拡張子に合致するものがあるか
    if !perms.include?(File.extname(name).downcase)
       result = 'アップロードできるのは画像ファイルのみです。'
       #アップロードファイルのサイズが１MB以下であるか
    elsif file.size > 1.megabyte
      result = 'ファイルサイズは1MBまでです。'
    else
    
      #/public/docフォルダ配下にアップロードファイルを保存
      File.open("public/docs/#{name}", 'wb'){|f| f.write(file.read)}
      result = "#{name}をアップロードしました。"
    end
      #成功/エラーメッセージを保存
    render :text => result
    format.html {redirect_to :controller =>'question' ,:action =>'show'}
  end
  
end
