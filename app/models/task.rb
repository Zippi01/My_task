class Task < ApplicationRecord
  validates :name, :descripion, presence: true
end
