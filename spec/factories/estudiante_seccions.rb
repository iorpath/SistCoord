# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :estudiante_seccion do
    estudiante nil
    seccion nil
    estado "MyString"
    periodo "MyString"
  end
end
