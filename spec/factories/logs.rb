FactoryGirl.define do
  factory :log do
    content "MyText"
    before_rating 1
    after_rating 1
    distortion_id 1
    user_id 1
  end
end
