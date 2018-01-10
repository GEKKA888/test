require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do
  it "name,email,passwordが入っていれば有効であること" do
    user = User.new(
      name: 'name',
      email: 'email',
      password: 'password'
    )
    expect(user).to be_valid
  end
  it "nameが無ければ無効であること" do
    user = User.new(
      name: nil,
      email: 'email',
      password: 'password'
    )
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end
  it "emailが無ければ無効であること" do
    user = User.new(
      name: 'name',
      email: nil,
      password: 'password'
    )
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end
  it "passwordが無ければ無効であること" do
    user = User.new(
      name: 'name',
      email: 'email',
      password: nil
    )
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end
end
