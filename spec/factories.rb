FactoryGirl.define do
  factory :template do
    name  'first template'
    short_description 'short description'
    detail_description 'detail of description'
    price '120'
  end
  factory :completion_day do
    title  '1 Day'
    price '10'
  end
  factory :number_of_page do
    title  '1 Page'
    price '10'
  end
  factory :color do
    title  'Blue'
    price '0'
  end
  factory :user do
    email 'example@gmail.com'
    password '123456789'
  end
  factory :order do
    status 'processing'
  end

  factory :visitor do 
  end

  

end