class AddColumAnswers < ActiveRecord::Migration
  def up
    add_column :answers, :answer_id, :string
  end
  def down
  end
end
