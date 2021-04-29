class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password_digest, presence: true

  has_many :accounts, dependent: :destroy
  has_many :daily_summaries, dependent: :destroy
  has_many :daily_balances, through: :accounts, dependent: :destroy


  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (self.reset_password_sent_at + 30.minutes) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end

  private
  def generate_token
    SecureRandom.hex(10)
  end

end
