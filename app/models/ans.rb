# encoding: utf-8


class Ans < ActiveRecord::Base
  # 回答はユーザーと質問に帰属する
  belongs_to :user
  belongs_to :que

  attr_accessible :ans_content,
                  :ans_date,
                  :ans_ent_kbn, 
                  :ans_id,
                  :ans_id_bn, 
                  :ans_pic, 
                  :ans_question_id,
                  :ans_title, 
                  :ans_url, 
                  :ans_use_id, 
                  :que_id_bn

  #回答バリデーション
  validates  :ans_content, presence: true, 
  length: { minimum: 1, maximum: 750 , allow_blank: true }
  validates  :ans_title, presence: true, 
  length: { minimum: 1, maximum: 150 , allow_blank: true }
  validates  :ans_url, presence: true, 
  length: { minimum: 1, maximum: 500 , allow_blank: true }

end
