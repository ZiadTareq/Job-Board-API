# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'seen_application' do
    user = 'to@example.org'
    let(:mail) { UserMailer.seen_application(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('your application has been reviewed')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['ziadtareq@outlook.com'])
    end
  end
end
