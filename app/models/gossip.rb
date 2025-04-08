class Gossip < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :content, presence: true
end
