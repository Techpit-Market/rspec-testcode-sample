FactoryBot.define do
  factory :food_enquete do
  end

  factory :food_enquete_tanaka, class: 'FoodEnquete' do
    name { '田中 太郎' }
    mail { 'taro.tanaka@example.com' }
    age { 25 }
    food_id { 2 }
    score { 3 }
    request { 'おいしかったです。' }
    present_id { 1 }
  end

  factory :food_enquete_yamada, class: 'FoodEnquete' do
    name { '山田 次郎' }
    mail { 'jiro.yamada@example.com' }
    age { 22 }
    food_id { 1 }
    score { 2 }
    request { '' }
    present_id { 0 }
  end

  factory :food_enquete_sato, class: 'FoodEnquete' do
    name { '佐藤 仁美' }
    mail { 'hitomi.sato@example.com' }
    age { 19 }
    food_id { 2 }
    score { 3 }
    request { 'おいしかったです。' }
    present_id { 1 }
  end
end
