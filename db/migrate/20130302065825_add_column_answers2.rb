class AddColumnAnswers2 < ActiveRecord::Migration
  def up
    add_column :answers, :answer_content, :string
    add_column :answers, :answer_date, :date
    add_column :answers, :answer_ent_kbn, :string
    add_column :answers, :answer_id, :integer
    add_column :answers, :answer_id_bn, :integer
    add_column :answers, :answer_pic, :string
    add_column :answers, :answer_question_id, :integer
    add_column :answers, :answer_url, :string
    add_column :answers, :answer_user_id, :integer
    add_column :answers, :question_id_bn, :integer
  end
  def down
  end
end
