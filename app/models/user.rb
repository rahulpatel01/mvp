class User < ApplicationRecord
  # after_initialize :assign_default_role, :if => :new_record?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter]

  mount_uploader :avatar, AvatarUploader
  serialize :avatars, JSON
  has_many :subjects
  has_many :feedbacks
  has_one  :performance
  has_many :grades
  has_many :assignments
  has_many :user_assignments
  has_many :inverse_user_assignments, :class_name => "User", :foreign_key => "educator_id"
  has_many :discussions
  has_many :donates
  has_many :ratings
  has_many :surveys
  has_many :questions
  has_many :comments

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end
    user
  end

  def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
     end
   end
  end

  def assign_default_role
    self.add_role(:learner) if self.roles.blank?
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
