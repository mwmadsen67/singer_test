FactoryBot.define do
  factory :song do
    body { 'happy birthday to you!' }
    
    # first arg: name of association
    # second arg: factory to use to create instance(s) returned by association
    association :author, factory: :user
  end
end