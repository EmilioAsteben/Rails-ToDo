class Project < ApplicationRecord
    has_many :todos , -> { order(id: :asc) },  dependent: :destroy

    validates :title, presence: true, length: { minimum: 4 }
end
