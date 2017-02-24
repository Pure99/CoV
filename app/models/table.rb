class Table < ApplicationRecord
  belongs_to :user
  has_many :lines
  validates :title, presence: true, length: {minimum:5}
end
