# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pensum do
    nombre "MyString"
    fecha_creacion "2012-09-22"
    maestria nil
  end
end
