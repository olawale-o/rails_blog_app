FactoryBot.define do
  factory :comment do
    user
    post
    text { 'Comment' }
  end
end



