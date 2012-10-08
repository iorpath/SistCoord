# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :materia_pensum do
    pensum nil
    materium nil
    descripcion "MyText"
    cantidad 1
  end
end
