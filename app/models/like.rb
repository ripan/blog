class Like < ApplicationRecord
  validates :resource_type, :resource_id, :count, presence: true
  validates :resource_type, uniqueness: { scope: :resource_id }
end
