# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inscripcion_maestrium, :class => 'InscripcionMaestria' do
    estudiante nil
    maestrium nil
    estado "MyString"
  end
end
