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
estudiante.tipo_estudiante = "pregrado"
estudiante.save

8.times do |n|
  5.times do |m|
    m = FactoryGirl.create :materium, :nombre => "materia #{m}", :codigo => "MESI10#{m}#{n}", :maestrium => maestria
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
  
    m = FactoryGirl.create :materium, :nombre => "materia MISIS #{m}", :codigo => "MISIS10#{m}", :maestrium => maestria1
    pensum1.materia_pensums.create :materium => m
 
end


maestria2 = FactoryGirl.create :maestrium, :nombre => "Maestria en Arquitecturas  de Tecnologias de informacion", :codigo => "MATI"

pensum2 = FactoryGirl.create :pensum, :nombre => "Pensum 2013-1"

maestria2.pensums << pensum2
maestria2.user = user1
maestria2.save


10.times do |m|
  
    m = FactoryGirl.create :materium, :nombre => "materia MATI #{m}", :codigo => "MATI10#{m}", :maestrium => maestria2
    pensum2.materia_pensums.create :materium => m
 
end


if User.find_by_name("Luis Fernando Test").nil?
 userE1 = FactoryGirl.create :user, :name =>"Luis Fernando Test", :email =>"lf.castro32@uniandes.edu.co", :password => "geheim", :password_confirmation => 'geheim'
 estudiante1 = FactoryGirl.create :estudiante
 estudiante1.tipo_estudiante = "maestria"
 estudiante1.save
  userE1.estudiante = estudiante1
  userE1.save
else
  estudiante1 = User.find_by_name("Luis Fernando Test").estudiante
end
 
 equalMat = Materium.all.first
 mat1 = Materium.find(60)
 mat2 = Materium.find(48)
 mat3 = Materium.find(49)
 mat4 = Materium.find(47)
 
 
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante1, :materium => mat4,  :periodo => periodo3
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante1, :materium => mat2,  :periodo => periodo3
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante, :materium => mat4,  :periodo => periodo3
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante, :materium => mat3,  :periodo => periodo3