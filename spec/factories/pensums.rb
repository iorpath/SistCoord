# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pensum do
    fechacreacion "2012-09-22"
    nombre "MyString"
    estado false
    maestrium nil
  end
end
