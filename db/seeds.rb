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

if User.find_by_name("Felipe Test").nil?
  user = FactoryGirl.create :user, :name =>"Felipe Test", :email =>"gf.moyano131@uniandes.edu.co", :password => "geheim", :password_confirmation => 'geheim'
  estudiante = FactoryGirl.create :estudiante
  estudiante.user = user
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

8.times do |n|
  5.times do |m|
    m = FactoryGirl.create :materium, :nombre => "materia #{m}", :codigo => "MISIS10#{m}#{n}"
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



maestria2.pensums << pensum1
maestria2.user = user1
maestria2.save


10.times do |m|
  
    m = FactoryGirl.create :materium, :nombre => "materia MATI #{m}", :codigo => "MATI10#{m}"
    pensum1.materia_pensums.create :materium => m
 
end





 
