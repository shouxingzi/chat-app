FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |message| #afterメソッド 任意の処理の後に指定の処理を実行。buildを指定するとインスタンスがbuildされた後に指定の処理を実行できる
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      # io: File.openで設定したパスのファイルpublic/images/test_image.pngを、test_image.pngというファイル名で保存している
    end
  end
end
