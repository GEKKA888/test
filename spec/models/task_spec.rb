require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Task do
  it "title,content,deadlineが入っていれば有効であること" do
    task = Task.new(
      title: 'hoge',
      content: 'hogehoge',
      deadline: '2018-01-01'
    )
    expect(task).to be_valid
  end
  it "titleが無ければ無効であること" do
    task = Task.new(
      title: nil
    )
    task.valid?
    expect(task.errors[:title]).to include("を入力してください")
  end
  it "contentが無ければ無効であること" do
    task = Task.new(
      content: nil
    )
    task.valid?
    expect(task.errors[:content]).to include("を入力してください")
  end
  it "deadlineが無ければ無効であること" do
    task = Task.new(
      deadline: nil
    )
    task.valid?
    expect(task.errors[:deadline]).to include("を入力してください")
  end
end
