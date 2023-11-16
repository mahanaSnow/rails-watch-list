class Review < ApplicationRecord
  belongs_to :list
  validates :content, presence: true, uniqueness: true, length: { minimum: 5 }
end
