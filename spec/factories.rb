FactoryGirl.define do
  factory :question, class: Question do
    id 1
    que_id 1
    que_content 'test content'
    que_title 'test title'
    que_due_date 2013-03-11
    que_date_time 2013-03-11
    que_use_id 1
    que_ent_kbn '1'
  end
end

FactoryGirl.define do
  factory :answers, class: Answer do
    id 1
    answer_id 1
    answer_content 'test content'
    answer_title 'test title'
    answer_date 2013-03-11
    answer_user_id 1
    answer_ent_kbn '1'
  end
end

FactoryGirl.define do
  factory :user, class: User do
    id 1
    username 'Test User'
    email 'user@test.com'
    password '12345678'
    password_confirmation "12345678"
    questions {
      [FactoryGirl.create(:question)]
    }
  end
end
