FactoryBot.define do
  factory :user do
    username { Faker::FunnyName.name }
    password { 'password' } 

    factory :harry_potter do
      username { 'Harry Potter' } # overrides line 3
      # still has a password of 'password'
    end
  end
end