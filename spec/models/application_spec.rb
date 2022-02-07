require 'rails_helper'

RSpec.describe Application, type: :model do
  # Association test
  # ensure an application record belongs to a single job record
  it { should belong_to(:job) }
  # Validation test
  # ensure column applicant is present before saving
  it { should validate_presence_of(:applicant) }
end
