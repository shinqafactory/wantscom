# encoding: utf-8
# == Schema Information
#
# Table name: answers
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  answer_id          :string(255)
#  answer_title       :string(255)
#  answer_content     :string(255)
#  answer_date        :date
#  answer_ent_kbn     :string(255)
#  answer_id_bn       :integer
#  answer_pic         :string(255)
#  answer_question_id :integer
#  answer_url         :string(255)
#  answer_user_id     :integer
#  question_id_bn     :integer
#

class Answer < ActiveRecord::Base
    attr_accessible :answer_content, :answer_date, :answer_ent_kbn, :answer_id, :answer_id_bn, :answer_pic, :answer_question_id, :answer_title, :answer_url, :answer_use_id, :question_id_bn 
    #URLのバリデーションにかかる正規化表現
    url_regex = /(https:|http:)+.+(.com|.jp)/
    #アソシエーション
    belongs_to :question, :foreign_key => "id"
    belongs_to :user, :foreign_key => "id"
    
    #回答事項（answer_content）の入力チェック
    validates :answer_content , :presence => true, 
    :length => { :minimum => 1, :maximum => 750 , :allow_blank => true }
      
       
    #回答url（answer_url）の入力チェック
    validates  :answer_url, :presence => true,
    :length => { :minimum => 1, :maximum => 500 , :allow_blank => true },
    :format => { :with => url_regex }
      
    #回答入力区分（answer_ent_kbn）の入力チェック
    validates  :answer_ent_kbn, :presence => true,
    :inclusion => { :in => ["1", "2", "9"] }
    
  end
