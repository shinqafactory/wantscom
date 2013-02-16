# encoding: utf-8

class Que < ActiveRecord::Base
  attr_accessible :que_content, :que_date_time, :que_delete_datetime, :que_due_date, :que_ent_kbn, :que_id, :que_id_bn, :que_title, :que_use_id

  #質問事項（que_content）の入力チェック
#  validates :que_content, :presence => true,             #必須チェック
#                          :length => { :maximum => 500 } #入力文字数チェック500文字以内

  validates :que_content, presence: true,
#  format: { with: /\A[A-Za-z]\w*\z/, allow_blank: true  },
  length: { minimum: 1, maximum: 500 , allow_blank: true }
#  uniqueness: { case_sensitive: false }
  
  #質問題名（que_title）の入力チェック
#  validates :que_title, :presence => true,               #必須チェック
#                        :length => { :maximun => 50 }    #入力文字数チェック50文字以内
  validates :que_title, presence: true,
  length: { minimum: 1, maximum: 50 , allow_blank: true }

  #期限(que_due_date)の入力チェック
  validates :que_content, presence: true


end
