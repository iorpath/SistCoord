# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seccion_inscrita do
    estudiante ""
    seccion ""
    periodo nil
  end
end
