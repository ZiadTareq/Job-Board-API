# frozen_string_literal: true

class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :applications, foreign_key: :applicant
  # Validations
  validates_presence_of :name, :email, :password_digest
  validates :email, uniqueness: true
end
