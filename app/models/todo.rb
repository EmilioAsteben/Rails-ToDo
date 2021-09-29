class Todo < ApplicationRecord
  belongs_to :project

  validates :text, presence: true, length: { minimum: 4 }
end
