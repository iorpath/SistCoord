# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :estudiante do
    user nil
    foto "MyString"
    direccion "MyString"
    telefono "MyString"
    tipo_estudiante "MyString"
    documento "MyString"
    tipo_documento "MyString"
  end
end
