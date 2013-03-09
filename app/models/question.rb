# encoding: utf-8
class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answer
  
  attr_accessible :que_content, :que_date_time, :que_delete_datetime, :que_due_date, :que_ent_kbn, :que_id, :que_id_bn, :que_title, :que_use_id
  
  #質問事項（que_content）の入力チェック
  validates :que_content, presence: true,                  #必須チェック
  length: { minimum: 1, maximum: 500 , allow_blank: true } #入力文字数チェック500文字以内
  
  #質問題名（que_title）の入力チェック
  validates :que_title, presence: true,                   #必須チェック
  length: { minimum: 1, maximum: 50 , allow_blank: true } #入力文字数チェック50文字以内

  #期限(que_due_date)の入力チェック
  validates :que_due_date, presence: true
  
  #期限のチェック　現在時間より前の場合はエラー
#  validates_date :que_due_date, :after => Time.now
#  def cannot_be_in_the_past?
#    errors.add(:que_due_date, "現在日より後の日付を入力してください。") if !:que_due_date.blank? and :que_due_date < Date.today
#  end
  #MAX日付は現在日付+一ヶ月　それより後は変更する
  #validates_date :que_due_date
  
  #ent_kbnのチェック
  #有効ｎ値以外の場合はエラー
  validates :que_ent_kbn, :inclusion => { :in => ["1", "2", "9"] }

end
