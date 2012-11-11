# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :estudiantematerium do
    estado "MyString"
    estudiante nil
    materium nil
    tipo_pensum nil
    periodo nil
  end
end
