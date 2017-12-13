FactoryGirl.define do
  factory :task do
    title "hoge"
    content "hogehoge"
  end
  factory :taska, class: Task do
    title "fugafugafugafugafugafugafugafugafugafugafugafugafuga"
    content "hogehoge"
  end
  factory :taskb, class: Task do
    title "hoge"
    content "fugafugafugafugafugafugafugafugafugafugafugafugafuga
    fugafugafugafugafugafugafugafugafugafugafugafugafuga
    fugafugafugafugafugafugafugafugafugafugafugafugafuga"
  end
end
