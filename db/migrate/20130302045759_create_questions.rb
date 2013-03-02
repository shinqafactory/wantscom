class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :que_id
      t.string :que_content
      t.string :que_title
      t.date :que_due_date
      t.date :que_date_time
      t.integer :que_use_id
      t.integer :que_id_bn
      t.string :que_delete_datetime
      t.string :que_ent_kbn

      t.timestamps
    end
  end
end
