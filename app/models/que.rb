# encoding: utf-8

class Que < ActiveRecord::Base
  attr_accessible :que_content, :que_date_time, :que_delete_datetime, :que_due_date, :que_ent_kbn, :que_id, :que_id_bn, :que_title, :que_use_id

  #質問事項（que_content）の入力チェック
  #必須チェック
  validates :que_content, :presence => true

  #入力文字数チェック500文字以内

end
