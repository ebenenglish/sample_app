FactoryGirl.define do
  factory :user do
    name "Michael Hartl"
    email "mhartl@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

end

# FactoryGirl.define do
#  sequence :email do |n|
#    "person-#{n}@example.com"
#  end
# end