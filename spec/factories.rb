
FactoryGirl.define do
  factory :user, class: User do
    id 1
    username 'Test User'
    email 'user@test.com'
    password '12345678'
    password_confirmation "12345678"
  end
end
  
FactoryGirl.define do
  factory :question, class: Question do
    id 1
    que_id 1
    que_content 'test content'
    que_title 'test title'
    que_due_date 2013-03-11
    que_date_time 2013-03-11
    que_use_id 1
    que_ent_kbn "1"
  end
end

FactoryGirl.define do
  factory :answer do
    answer_content "Answer Sample"
    answer_title "Answer Title"
    answer_url "Answer url"
    answer_ent_kbn "1"
    answer_id 1
  end
end
