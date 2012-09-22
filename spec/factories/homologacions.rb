# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :homologacion do
    materiaorigen "MyString"
    materia nil
    estado false
    estudiante nil
    observaciones "MyString"
  end
end
