require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Task do
  it "title,content,user_idが入っていれば有効であること" do
    create(:user, id:3)
    task = Task.new(
      title: 'hoge',
      content: 'hogehoge',
      user_id: 3
    )
    expect(task).to be_valid
  end
  it "titleが無ければ無効であること" do
    create(:user, id:3)
    task = Task.new(
      title: nil,
      content: 'hogehoge',
      user_id: 3
    )
    task.valid?
    expect(task.errors[:title]).to include("を入力してください")
  end
  it "contentが無ければ無効であること" do
    create(:user, id:3)
    task = Task.new(
      title: 'hoge',
      content: nil,
      user_id: 3
    )
    task.valid?
    expect(task.errors[:content]).to include("を入力してください")
  end
  it "user_idが無ければ無効であること" do
    create(:user, id:3)
    task = Task.new(
      title: 'hoge',
      content: 'hogehoge',
      user_id: nil
    )
    task.valid?
    expect(task.errors[:user_id]).to include("を入力してください")
  end
end
