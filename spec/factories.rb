FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password "p@ssw0rd"
    password_confirmation "p@ssw0rd"

    factory :admin_user do
      admin true
    end
  end

  factory :relationship do
    association :follower, factory: :user
    association :followed, factory: :user
  end

  factory :category do
    name {Faker::Name.name}
    description {Faker::Lorem.word}
  end

  factory :word do
    category
    content {Faker::Lorem.word}

    factory :word_with_no_correct_answer do
      after(:create) do |word|
        create_list :answer, 4, word: word
      end
    end

    factory :word_with_a_correct_answer do
      after(:create) do |word|
        create_list :answer, 3, word: word
        create :correct_answer, word: word
      end
    end
  end

  factory :answer do
    word
    content {Faker::Lorem.word}

    factory :correct_answer do
      correct true
    end
  end

  factory :lesson do
    user
    category
  end

  factory :answer_sheet do
    lesson
    association :word, factory: :word_with_a_correct_answer
  end

  factory :learned_word do
    user
    category
  end
end
