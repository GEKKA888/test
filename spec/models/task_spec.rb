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
end
