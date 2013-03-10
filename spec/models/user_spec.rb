# coding: utf-8
################### 残作業（未実装） #######################
#　・ユーザ名の全角チェック(半角が来たときのバリデーション）
#
#######################################################
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
#
#1.ユーザ名　バリデーションチェック
# 1-1.ユーザ名(username)が32文字を超える時：エラーが発生すること
# 1-3.ユーザ名(username)が空白のとき：エラーが発生すること
# 1-2.ユーザ名(username) が3文字より少ない時：エラーが発生すること
#2.メールアドレス バリデーションチェック
# 2-1.アドレス(email)のフォーマットが正しくない時：エラーが発生すること (FAILED - 12)
# 2-3.アドレス(email)が登録済みである時：エラーが発生すること
# 2-2.アドレス(email)のフォーマットが正しい時：エラーが発生しないこと
#3.パスワード バリデーションチェック
# 3-1.パスワード(password)が空白のとき：エラーが発生すること
# 3-2.パスワード(password)がnullのとき：エラーが発生すること
# 3-3.パスワードの確認(password confirmation)が一致しないとき：エラーが発生すること
# 3-4.パスワード(password)が8文字より少ないとき：エラーが発生すること

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

describe "1.ユーザ名　バリデーションチェック" do
it "1-1.ユーザ名(username)が32文字を超える時：エラーが発生すること" do
@user.username = "a"*33
should_not be_valid
end

it "1-2.ユーザ名(username) が3文字より少ない時：エラーが発生すること" do
@user.username = "a"*2
should_not be_valid
end

it "1-3.ユーザ名(username)が空白のとき：エラーが発生すること" do
@user.username = ""
should_not be_valid
end
end

describe "2.メールアドレス バリデーションチェック" do
it "2-1.アドレス(email)のフォーマットが正しくない時：エラーが発生すること" do
addresses = %w[user@foo,com user_at_foo.org example.user@foo.
foo@bar_baz.com foo@bar+baz.com]
addresses.each do |invalid_address|
@user.email = invalid_address
@user.should_not be_valid
end
end

it "2-2.アドレス(email)のフォーマットが正しい時：エラーが発生しないこと" do
addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
addresses.each do |valid_address|
@user.email = valid_address
@user.should be_valid
end      
end

it "2-3.アドレス(email)が登録済みである時：エラーが発生すること" do
user_with_same_email = @user.dup
user_with_same_email.email = @user.email.upcase
user_with_same_email.save
should_not be_valid
end
end

describe "3.パスワード バリデーションチェック" do
it "3-1.パスワード(password)が空白のとき：エラーが発生すること" do
@user.password = @user.password_confirmation = ""
should_not be_valid
end

it "3-2.パスワード(password)がnullのとき：エラーが発生すること" do
@user.password = @user.password_confirmation = nil
should_not be_valid
end


it "3-3.パスワードの確認(password confirmation)が一致しないとき：エラーが発生すること" do
@user.password_confirmation = "mismatch"
should_not be_valid
end

it "3-4.パスワード(password)が8文字より少ないとき：エラーが発生すること" do
@user.password = @user.password_confirmation = "a" * 5
should be_invalid
end
end
end
