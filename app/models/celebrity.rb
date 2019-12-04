## celebrity.rb Model
class Celebrity < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :wiki_page, presence: true
end
