class Chirp < ApplicationRecord
  validates :text, presence: true, length: { maximum: 140 }
  validates :author, presence: true
  validates :region, presence: true
end
