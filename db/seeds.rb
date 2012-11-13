# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#sraiputs 'SETTING UP DEFAULT USER LOGIN'
#user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'New user created: ' << user.name
#user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'New user created: ' << user2.name
#user.add_role :admin
periodo1 = FactoryGirl.create :periodo, :nombre=>"2012-1"
periodo2 = FactoryGirl.create :periodo, :nombre=>"2012-2"
periodo3 = FactoryGirl.create :periodo, :nombre=>"2013-1", :vigente => true


if User.find_by_name("Felipe Test").nil?
  user = FactoryGirl.create :user, :name =>"Felipe Test", :email =>"gf.moyano131@uniandes.edu.co", :password => "geheim", :password_confirmation => 'geheim'
  estudiante = FactoryGirl.create :estudiante
  user.estudiante = estudiante
  user.save
else
  estudiante = User.find_by_name("Felipe Test").estudiante
end


maestria = FactoryGirl.create :maestrium, :nombre => "Maestria en Seguiridad Informatica", :codigo => "MESI"

pensum = FactoryGirl.create :pensum, :nombre => "2012-2"


maestria.pensums << pensum
maestria.user = user
maestria.save

estudiante.pensums << pensum
estudiante.save

semestres = ["Primero", "Intersemestral 1", "Segundo", "Tercero", "Intersemestral 1", "Cuarto"]
semestres.each do |n|
  5.times do |m|
    m = FactoryGirl.create :materium, :nombre => "materia #{m}", :codigo => "MESI10#{m}#{n}"
    pensum.materia_pensums.create :materium => m, :semestre_sugerido => n 
  end
end

#*******************************
if User.find_by_name("Felipe TestCoord").nil?
  user1 = FactoryGirl.create :user, :name =>"Felipe TestCoord", :email =>"gfCoord.moyano131@uniandes.edu.co", :password => "geheim", :password_confirmation => 'geheim'
else
  user1 = User.find_by_name("Felipe TestCoord")
end  

maestria1 = FactoryGirl.create :maestrium, :nombre => "Maestria en Ingenieria de Sistemas", :codigo => "MISIS"

pensum1 = FactoryGirl.create :pensum, :nombre => "2013-1"

maestria1.pensums << pensum1
maestria1.user = user1
maestria1.save

10.times do |m|
  
    m = FactoryGirl.create :materium, :nombre => "materia MISIS #{m}", :codigo => "MISIS10#{m}"
    pensum1.materia_pensums.create :materium => m
 
end


maestria2 = FactoryGirl.create :maestrium, :nombre => "Maestria en Arquitecturas  de Tecnologias de informacion", :codigo => "MATI"

pensum2 = FactoryGirl.create :pensum, :nombre => "Pensum 2013-1", :estado=>true

maestria2.pensums << pensum2
maestria2.user = user1
maestria2.save


m1 = FactoryGirl.create :materium, :nombre => "Gerencia de Proyectos de TI", :codigo => "MATI1010"
pensum2.materia_pensums.create :materium => m1, :semestre_sugerido => "Primero", :area => "Fundamentacion"

m2 = FactoryGirl.create :materium, :nombre => "Arquitectura de Negocios y Estrategia de TI", :codigo => "MATI1020"
pensum2.materia_pensums.create :materium => m2, :semestre_sugerido => "Primero", :area => "Fundamentacion"

m9 = FactoryGirl.create :materium, :nombre => "Electiva 1", :codigo => "XXXX"
pensum2.materia_pensums.create :materium => m9, :semestre_sugerido => "Intersemestral 1", :area => "Complemento"

m3 = FactoryGirl.create :materium, :nombre => "Comunicacion Efectiva en TI", :codigo => "MATI1030"
pensum2.materia_pensums.create :materium => m3, :semestre_sugerido => "Segundo", :area => "Fundamentacion"

m4 = FactoryGirl.create :materium, :nombre => "Arquitectura de Solucion", :codigo => "MATI1040"
pensum2.materia_pensums.create :materium => m4, :semestre_sugerido => "Segundo", :area => "Profundizacion"

m5 = FactoryGirl.create :materium, :nombre => "Arquitectura de Informacion", :codigo => "MATI1050"
pensum2.materia_pensums.create :materium => m5, :semestre_sugerido => "Tercero", :area => "Profundizacion"

m6 = FactoryGirl.create :materium, :nombre => "Arquitectura de Infraestructura de TI", :codigo => "MATI1060"
pensum2.materia_pensums.create :materium => m6, :semestre_sugerido => "Tercero", :area => "Profundizacion"

m10 = FactoryGirl.create :materium, :nombre => "Electiva 2", :codigo => "XXXX"
pensum2.materia_pensums.create :materium => m10, :semestre_sugerido => "Intersemestral 2", :area => "Complemento"

m7 = FactoryGirl.create :materium, :nombre => "Arquitectura de Seguridad", :codigo => "MATI1070"
pensum2.materia_pensums.create :materium => m7, :semestre_sugerido => "Cuarto", :area => "Profundizacion"

m8 = FactoryGirl.create :materium, :nombre => "Proyecto", :codigo => "MATI1080"
pensum2.materia_pensums.create :materium => m8, :semestre_sugerido => "Cuarto", :area => "Integracion"

estudiante.pensums << pensum2
estudiante.save
#10.times do |m|
#  
#    m = FactoryGirl.create :materium, :nombre => "materia MATI #{m}", :codigo => "MATI10#{m}"
#    pensum2.materia_pensums.create :materium => m
# 
#end


if User.find_by_name("Luis Fernando Test").nil?
 userE1 = FactoryGirl.create :user, :name =>"Luis Fernando Test", :email =>"lf.castro32@uniandes.edu.co", :password => "geheim", :password_confirmation => 'geheim'
 estudiante1 = FactoryGirl.create :estudiante
  userE1.estudiante = estudiante1
  userE1.save
else
  estudiante1 = User.find_by_name("Felipe Test").estudiante
end
 
 equalMat = Materium.all.first
 
 
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante1, :materium => m4,  :periodo => periodo3
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante1, :materium => m2,  :periodo => periodo3
 
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante, :materium => m1,  :periodo => periodo1, :area => "Fundamentacion", :estado => "vista"
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante, :materium => m2,  :periodo => periodo2, :area => "Profundizacion", :estado => "vista"
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante, :materium => m3,  :periodo => periodo3, :area => "Complemento", :estado => "inscrita"
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante, :materium => m4,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"