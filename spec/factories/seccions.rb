# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seccion do
    materia nil
    etiqueta "MyString"
    profesor "MyString"
    salon "MyString"
  end
end
