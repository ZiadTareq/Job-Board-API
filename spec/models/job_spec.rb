require 'rails_helper'

RSpec.describe Job, type: :model do
  # Association test
  # ensure job model has a 1:m relationship with the application model
  it { should have_many(:applications).dependent(:destroy) }
  # Validation tests
  # ensure columns title and description are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
