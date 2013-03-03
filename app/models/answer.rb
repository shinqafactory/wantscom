class Answer < ActiveRecord::Base
    attr_accessible :answer_content, :answer_date, :answer_ent_kbn, :answer_id, :answer_id_bn, :answer_pic, :answer_question_id, :answer_title, :answer_url, :answer_use_id, :question_id_bn
    #質問事項（answer_content）の入力チェック
    validates  :answer_content, presence: true, 
    length: { minimum: 1, maximum: 750 , allow_blank: true }
    #質問題名（answer_title）の入力チェック  
    validates  :answer_title, presence: true, 
    length: { minimum: 1, maximum: 150 , allow_blank: true }
    #質問url（answer_url）の入力チェック
    validates  :answer_url, presence: true, 
    length: { minimum: 1, maximum: 500 , allow_blank: true }
  end
