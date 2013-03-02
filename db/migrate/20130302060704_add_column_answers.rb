class AddColumnAnswers < ActiveRecord::Migration
  def up
    add_column :answers, :answer_title, :string
  end

  def down
  end
end
