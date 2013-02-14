class CreateAns < ActiveRecord::Migration
  def change
    create_table :ans do |t|
      t.integer :ans_id
      t.string :ans_content
      t.string :ans_title
      t.string :ans_url
      t.date :ans_date
      t.integer :ans_question_id
      t.integer :ans_use_id
      t.string :ans_pic
      t.integer :ans_id_bn
      t.integer :que_id_bn
      t.date :que_delete_datetime
      t.string :ans_ent_kbn

      t.timestamps
    end
  end
end
