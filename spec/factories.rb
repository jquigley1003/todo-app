FactoryGirl.define do
  factory :task do
    title       "Walk the dog"
    completed   false
    priority    (1..10).to_a.sample
  end
end