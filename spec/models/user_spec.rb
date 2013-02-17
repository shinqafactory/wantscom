# coding: utf-8
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

require 'spec_helper'

describe User do
  before do
    @user = User.new(username: "Example User", email: "user@example.com",
                     password: "12345678", password_confirmation: "12345678")
  end

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "username が長過ぎるとき" do
    before { @user.username = "a"*51 }
    it { should_not be_valid }
  end

  describe "username が短すぎるとき" do
    before { @user.username = "a" }
    it { should_not be_valid }
  end

  describe "username が存在しないとき" do
    before { @user.username = "" }
    it { should_not be_valid }
  end

  describe "email のフォーマットが正しくないとき" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                                           foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
      @user.email = invalid_address
      @user.should_not be_valid
      end
    end
  end

  describe "email のフォーマットが正しいとき" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end      
    end
  end

  describe "email address が登録済みであるとき"do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it {should_not be_valid }
  end

  describe "password が空欄のとき" do
    before { @user.password = @user.password_confirmation = "" }
    it { should_not be_valid }
  end

  describe "password confirmation が一致しないとき" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "password confirmation が nil のとき" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "password が短すぎるとき" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
end

