FactoryGirl.define do
  factory :task do
    title "hoge"
    content "hogehoge"
    deadline "2018-01-01"
  end
  factory :task2, class: Task do
    title "hoge"
    content "hogehogehoge"
    deadline "2018-01-02"
  end
  factory :taska, class: Task do
    title "fugafugafugafugafugafugafugafugafugafugafugafugafuga"
    content "hogehoge"
    deadline "2018-01-01"
  end
  factory :taskb, class: Task do
    title "hoge"
    content "fugafugafugafugafugafugafugafugafugafugafugafugafuga
    fugafugafugafugafugafugafugafugafugafugafugafugafuga
    fugafugafugafugafugafugafugafugafugafugafugafugafuga"
    deadline "2018-01-01"
  end
end
