FactoryBot.define do
  factory :like do
    resource_type{ "Article" }
    resource_id{ rand(1..100) }
    count{ rand(1..100) }
  end
end
