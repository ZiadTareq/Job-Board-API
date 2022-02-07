# frozen_string_literal: true

class Job < ApplicationRecord

# removing elastic for heroku 
# if you want to enable it un comment the lines bellow:

  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  # settings do
  #   mappings dynamic: false do
  #     indexes :description, type: :text
  #   end
  # end

  has_many :applications, dependent: :destroy
  scope :filter_by_title, ->(title) { where('title like ?', "%#{title}%") }
  scope :filter_by_creation_date, ->(created_at) { where('created_at like ?', "%#{created_at}%") }
  # validations
  validates_presence_of :title, :description
end
