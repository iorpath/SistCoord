# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :estudiante_pensum do
    estudiante nil
    pensum nil
    estado "MyString"
  end
end
