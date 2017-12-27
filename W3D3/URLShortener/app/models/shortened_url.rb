# require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :long_url, uniqueness: true, presence: true
  attr_reader :short_url

  def self.random_code
    while true
      result = SecureRandom.urlsafe_base64
      return result unless ShortenedUrl.exists?(result)
    end
  end

  def self.create_for_user_and_long_url!(user, long_url)
   ShortenedUrl.create! (
     submitter_id: user.id,
     long_url: long_url,
     short_url: ShortenedUrl.random_code
   )
  end

end
