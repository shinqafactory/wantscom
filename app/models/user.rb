# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable, :validatable,
  #  :recoverable, :rememberable, :trackable, :omniauthable, :confirmable,
  #  :authentication_keys => [:login]

  devise :trackable, :omniauthable, :registerable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :username, :name, :email, :password, :password_confirmation, :remember_me, :uid, :provider
  attr_accessible :name, :uid, :provider, :password
  # attr_accessible :title, :body
  has_many :answers, :foreign_key => "answer_user_id"
  has_many :questions, :foreign_key => "que_use_id"
  #set_primary_key :que_user_id;
  #validates :username,presence: true,
  #  uniqueness: { case_sensitive: false },
  #  length: { minimum:3, maximum: 32 }

  #ユーザ認証をユーザ名かメールアドレスのどちらかで行えるようにする
  attr_accessor :login
  attr_accessible :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  #to_paramメソッドをusernameでも利用できるようにオーバーライド
  def to_param
    name
    #username
  end

  def  self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(:name => auth.extra.raw_info.name,
                         :provider => auth.provider,
                         :uid => auth.uid,
                         # :email => auth.info.email, #emailを取得したい場合は、migrationにemailを追加してください。
                         :password => Devise.friendly_token[0,20]
                        )
    end
    user
  end


  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(:name => auth.info.nickname,
                         :provider => auth.provider,
                         :uid => auth.uid,
                         #                          email:auth.extra.user_hash.email, #色々頑張りましたがtwitterではemail取得できません
                         :password => Devise.friendly_token[0,20]
                        )
    end
    user
  end
end
