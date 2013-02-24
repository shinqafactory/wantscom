class Ans < ActiveRecord::Base
  attr_accessible :ans_content, :ans_date, :ans_ent_kbn, :ans_id, :ans_id_bn, :ans_pic, :ans_question_id, :ans_title, :ans_url, :ans_use_id, :que_delete_datetime, :que_id_bn
  validates  :ans_id, presence: true
  validates  :ans_content, presence: true, length: { maximum:750 }
  validates  :ans_titie, presence: true, length: { :maximum =>150}
end
