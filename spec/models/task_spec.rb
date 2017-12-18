require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Task do
  it "titleとcontentが入っていれば有効であること" do
    task = Task.new(
      title: 'hoge',
      content: 'hogehoge'
    )
    expect(task).to be_valid
  end
  it "titleが無ければ無効であること" do
    task = Task.new(
      title: nil,
    )
    task.valid?
    expect(task.errors[:title]).to include("can't be blank")
  end
  it "contentが無ければ無効であること" do
    task = Task.new(
      content: nil,
    )
    task.valid?
    expect(task.errors[:content]).to include("can't be blank")
  end

end
