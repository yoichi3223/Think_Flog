class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
      has_many :lists, dependent: :destroy
      has_many :genres, dependent: :destroy
      attachment :image
      validates :family_name, presence: true
      validates :first_name, presence: true
      validates :email, presence: true, uniqueness: true
      # validates :password, presence: true, length: { minimum: 6 }
      # validates :password_confirmation, presence: true, length: { minimum: 6 }
      devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :omniauthable

      def active_for_authentication?
          super && (self.is_deleted == false)
      end

      def self.find_for_oauth(auth)
        user = User.where(uid: auth.uid, provider: auth.provider).first

        user ||= User.create(
          family_name: auth.info.name,
          first_name: auth.info.name,
          uid: auth.uid,
          provider: auth.provider,
          email: auth.info.email,
          password: Devise.friendly_token[0, 20]
        )
        user
      end
end
