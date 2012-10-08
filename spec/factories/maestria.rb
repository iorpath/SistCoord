# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
    factory :maestrium do
    nombre  "Maestria en Tecnologias de Informacion"
    codigo  "MATI"   
    
    factory :maestria_con_materias do
      # posts_count is declared as an ignored attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      ignore do
        materias_count 5
      end
      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |maestrium, evaluator|
        FactoryGirl.create_list(:materium, evaluator.materias_count, maestrium: maestrium)
      end
    end
   end
end