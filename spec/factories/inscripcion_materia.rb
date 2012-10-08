# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inscripcion_materium, :class => 'InscripcionMateria' do
    estudiante nil
    materium nil
    seccion nil
    estado "MyString"
    periodo "MyString"
  end
end
