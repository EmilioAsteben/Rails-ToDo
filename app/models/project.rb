class Project < ApplicationRecord
    has_many :todos , -> { order(text: :desc) },  dependent: :destroy
end
