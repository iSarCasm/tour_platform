FactoryBot.define do
  factory :note do
    # noteable_id 0
    # noteable_type 'Hotel'
    message 'Note message'
    user

    transient do
      object nil
    end

    before(:create) do |note, evaluator|
      if evaluator.object
        note.noteable_id = evaluator.object.id
        note.noteable_type = evaluator.object.class
      end
    end
  end
end
