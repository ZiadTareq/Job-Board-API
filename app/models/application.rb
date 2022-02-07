class Application < ApplicationRecord
  belongs_to :job

  # validation
  validates_presence_of :applicant
end
