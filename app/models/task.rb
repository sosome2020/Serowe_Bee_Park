class Task < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name,  presence: true
  validates :quantity,  presence: true
  validates :unit_price, presence: true , numericality: { only_integer: true}
  scope :search_status, -> (status){where('status = ?',status)}
  scope :search_title, -> (title){where('title LIKE ?',"%#{task_name}%")}
  belongs_to :user, optional: true
  has_many :labellings,dependent: :destroy
  has_many :labels, through: :labellings
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
end
