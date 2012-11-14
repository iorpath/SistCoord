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

semestres = ["Primero", "Intersemestral 1", "Segundo", "Tercero", "Intersemestral 1", "Cuarto"]
semestres.each do |n|
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

pensum2 = FactoryGirl.create :pensum, :nombre => "Pensum 2013-1", :estado=>true

maestria2.pensums << pensum2
maestria2.user = user1
maestria2.save


m1 = FactoryGirl.create :materium, :nombre => "Gerencia de Proyectos de TI", :codigo => "MATI1010", :maestrium => maestria2
pensum2.materia_pensums.create :materium => m1, :semestre_sugerido => "Primero", :area => "Fundamentacion"

m2 = FactoryGirl.create :materium, :nombre => "Arquitectura de Negocios y Estrategia de TI", :codigo => "MATI1020", :maestrium => maestria2
pensum2.materia_pensums.create :materium => m2, :semestre_sugerido => "Primero", :area => "Fundamentacion"

m9 = FactoryGirl.create :materium, :nombre => "Electiva 1", :codigo => "MATI-E001" , :maestrium => maestria2
pensum2.materia_pensums.create :materium => m9, :semestre_sugerido => "Intersemestral 1", :area => "Complemento"

m3 = FactoryGirl.create :materium, :nombre => "Comunicacion Efectiva en TI", :codigo => "MATI1030", :maestrium => maestria2
pensum2.materia_pensums.create :materium => m3, :semestre_sugerido => "Segundo", :area => "Fundamentacion"

m4 = FactoryGirl.create :materium, :nombre => "Arquitectura de Solucion", :codigo => "MATI1040", :maestrium => maestria2
pensum2.materia_pensums.create :materium => m4, :semestre_sugerido => "Segundo", :area => "Profundizacion"

m5 = FactoryGirl.create :materium, :nombre => "Arquitectura de Informacion", :codigo => "MATI1050", :maestrium => maestria2
pensum2.materia_pensums.create :materium => m5, :semestre_sugerido => "Tercero", :area => "Profundizacion"

m6 = FactoryGirl.create :materium, :nombre => "Arquitectura de Infraestructura de TI", :codigo => "MATI1060", :maestrium => maestria2
pensum2.materia_pensums.create :materium => m6, :semestre_sugerido => "Tercero", :area => "Profundizacion"

m10 = FactoryGirl.create :materium, :nombre => "Electiva 2", :codigo => "MATI-E002", :maestrium => maestria2
pensum2.materia_pensums.create :materium => m10, :semestre_sugerido => "Intersemestral 2", :area => "Complemento"

m7 = FactoryGirl.create :materium, :nombre => "Arquitectura de Seguridad", :codigo => "MATI1070", :maestrium => maestria2
pensum2.materia_pensums.create :materium => m7, :semestre_sugerido => "Cuarto", :area => "Profundizacion"


m8 = FactoryGirl.create :materium, :nombre => "Proyecto", :codigo => "MATI1080", :maestrium => maestria2
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
 estudiante1.tipo_estudiante = "maestria"
 estudiante1.save
  userE1.estudiante = estudiante1
  userE1.save
else
  estudiante1 = User.find_by_name("Luis Fernando Test").estudiante
end
 
 equalMat = Materium.all.first
 
 
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante1, :materium => m4,  :periodo => periodo3, :area => "Fundamentacion", :estado => "vista"
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante1, :materium => m2,  :periodo => periodo3, :area => "Fundamentacion", :estado => "vista"
 
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante, :materium => m1,  :periodo => periodo1, :area => "Fundamentacion", :estado => "vista"
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante, :materium => m2,  :periodo => periodo2, :area => "Profundizacion", :estado => "vista"
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante, :materium => m3,  :periodo => periodo3, :area => "Complemento", :estado => "inscrita"
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante, :materium => m4,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"
 
#****************************
ms1 = FactoryGirl.create :materium, :nombre => "FROM BIG DATA TO CONTENT ANALYSIS", :codigo => "MISIS4513", :maestrium => maestria1
pensum1.materia_pensums.create :materium => ms1, :semestre_sugerido => "Primero", :area => "Fundamentacion"

ms2 = FactoryGirl.create :materium, :nombre => "LOCATION BASED SERVICES AND APPLICATIONS", :codigo => "MISIS4515", :maestrium => maestria1
pensum1.materia_pensums.create :materium => ms2, :semestre_sugerido => "Primero", :area => "Fundamentacion"

ms3 = FactoryGirl.create :materium, :nombre => "AUTOMATIZACION DE PROCESOS DE NEGOCIO", :codigo => "MISIS4618", :maestrium => maestria1
pensum1.materia_pensums.create :materium => ms3, :semestre_sugerido => "Segundo", :area => "Fundamentacion"


ms4 = FactoryGirl.create :materium, :nombre => "PROCESOS AGILES DE DESARROLLO DE SOFTWARE", :codigo => "MISIS4717", :maestrium => maestria1
pensum1.materia_pensums.create :materium => ms4, :semestre_sugerido => "Tercero", :area => "Profundizacion"

ms5 = FactoryGirl.create :materium, :nombre => "DESARROLLO DE LINEAS DE PRODUCTO", :codigo => "MISIS4716", :maestrium => maestria1
pensum1.materia_pensums.create :materium => ms5, :semestre_sugerido => "Tercero", :area => "Profundizacion"

ms6 = FactoryGirl.create :materium, :nombre => "COMPUTACION VISUAL INTERACTIVA", :codigo => "MISIS4823", :maestrium => maestria1
pensum1.materia_pensums.create :materium => ms6, :semestre_sugerido => "Cuarto", :area => "Profundizacion"


ms7 = FactoryGirl.create :materium, :nombre => "HERRAMIENTAS DE PROGRAMACION DE ALTO RENDIMIENTO", :codigo => "MISIS4824", :maestrium => maestria1
pensum1.materia_pensums.create :materium => ms7, :semestre_sugerido => "Cuarto", :area => "Profundizacion"

ms8 = FactoryGirl.create :materium, :nombre => "DESARRROLLO DE SOFTWARE BASADO EN MODELOS", :codigo => "MISIS4712", :maestrium => maestria1
pensum1.materia_pensums.create :materium => ms8, :semestre_sugerido => "Tercero", :area => "Integracion"

ms9 = FactoryGirl.create :materium, :nombre => "DISENO DE SOFTWARE BASADO EN PATRONES", :codigo => "MISIS4707",:maestrium => maestria1
pensum1.materia_pensums.create :materium => ms9, :semestre_sugerido => "Tercero", :area => "Complemento"

ms10 = FactoryGirl.create :materium, :nombre => "DESARROLLO DE SOFTWARE BASADO EN COMPONENTES", :codigo => "MISIS4713", :maestrium => maestria1
pensum1.materia_pensums.create :materium => ms10, :semestre_sugerido => "Tercero", :area => "Complemento"

if User.find_by_name("Ivan Orlando Test").nil?
 userE2 = FactoryGirl.create :user, :name =>"Ivan Orlando Test", :email =>"io.riveros22@uniandes.edu.co", :password => "geheim", :password_confirmation => 'geheim'
 estudiante2 = FactoryGirl.create :estudiante
 estudiante2.tipo_estudiante = "maestria"
 estudiante2.save
  userE2.estudiante = estudiante2
  userE2.save
else
  estudiante2 = User.find_by_name("Ivan Orlando Test").estudiante
end

if User.find_by_name("Carlos Test").nil?
 userE3 = FactoryGirl.create :user, :name =>"Carlos Test", :email =>"ce.diaz30@uniandes.edu.co", :password => "geheim", :password_confirmation => 'geheim'
 estudiante3 = FactoryGirl.create :estudiante
 estudiante3.tipo_estudiante = "maestria"
 estudiante3.save
  userE3.estudiante = estudiante3
  userE3.save
else
  estudiante3 = User.find_by_name("Carlos Test").estudiante
end

if User.find_by_name("Diego Fernando Test").nil?
 userE4 = FactoryGirl.create :user, :name =>"Diego Fernando Test", :email =>"df.ordonez94@uniandes.edu.co", :password => "geheim", :password_confirmation => 'geheim'
 estudiante4 = FactoryGirl.create :estudiante
 estudiante4.tipo_estudiante = "maestria"
 estudiante4.save
  userE4.estudiante = estudiante4
  userE4.save
else
  estudiante4 = User.find_by_name("Diego Fernando Test").estudiante
end

if User.find_by_name("Juan Carlos Test").nil?
 userE5 = FactoryGirl.create :user, :name =>"Juan Carlos Test", :email =>"jc.castro32@uniandes.edu.co", :password => "geheim", :password_confirmation => 'geheim'
 estudiante5 = FactoryGirl.create :estudiante
 estudiante5.tipo_estudiante = "maestria"
 estudiante5.save
  userE5.estudiante = estudiante5
  userE5.save
else
  estudiante5 = User.find_by_name("Juan Carlos Test").estudiante
end

if User.find_by_name("Luis Felipe Test").nil?
 userE6 = FactoryGirl.create :user, :name =>"Luis Felipe Test", :email =>"lfe.castro32@uniandes.edu.co", :password => "geheim", :password_confirmation => 'geheim'
 estudiante6 = FactoryGirl.create :estudiante
 estudiante6.tipo_estudiante = "maestria"
 estudiante6.save
  userE6.estudiante = estudiante6
  userE6.save
else
  estudiante1 = User.find_by_name("Luis Felipe Test").estudiante
end

if User.find_by_name("Miguel Test").nil?
 userE7 = FactoryGirl.create :user, :name =>"Miguel Test", :email =>"mi.castro32@uniandes.edu.co", :password => "geheim", :password_confirmation => 'geheim'
 estudiante7 = FactoryGirl.create :estudiante
 estudiante7.tipo_estudiante = "maestria"
 estudiante7.save
  userE7.estudiante = estudiante7
  userE7.save
else
  estudiante7 = User.find_by_name("Miguel Test").estudiante
end

if User.find_by_name("Marcela Test").nil?
 userE8 = FactoryGirl.create :user, :name =>"Marcela Test", :email =>"ma.castro32@uniandes.edu.co", :password => "geheim", :password_confirmation => 'geheim'
 estudiante8 = FactoryGirl.create :estudiante
 estudiante8.tipo_estudiante = "maestria"
 estudiante8.save
  userE8.estudiante = estudiante8
  userE8.save
else
  estudiante8 = User.find_by_name("Marcela Test").estudiante
end

if User.find_by_name("Claudia Test").nil?
 userE9 = FactoryGirl.create :user, :name =>"Claudia Test", :email =>"cl.castro32@uniandes.edu.co", :password => "geheim", :password_confirmation => 'geheim'
 estudiante9 = FactoryGirl.create :estudiante
 estudiante9.tipo_estudiante = "pregrado"
 estudiante9.save
  userE9.estudiante = estudiante9
  userE9.save
else
  estudiante9 = User.find_by_name("Claudia Test").estudiante
end

equalMat = Materium.all.first
 mat1 = Materium.find(60)
 mat2 = Materium.find(48)
 mat3 = Materium.find(49)
 mat4 = Materium.find(47)
 
 
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante1, :materium => mat4,  :periodo => periodo3, :area => "Integracion", :estado => "planeada"
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante1, :materium => mat2,  :periodo => periodo3, :area => "Integracion", :estado => "planeada"
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante, :materium => mat4,  :periodo => periodo3, :area => "Integracion", :estado => "planeada"
 FactoryGirl.create :estudiantematerium,  :estudiante => estudiante, :materium => mat3,  :periodo => periodo3, :area => "Integracion", :estado => "planeada"
 

FactoryGirl.create :estudiantematerium,  :estudiante => estudiante2, :materium => m3,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"
FactoryGirl.create :estudiantematerium,  :estudiante => estudiante2, :materium => ms2,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"

FactoryGirl.create :estudiantematerium,  :estudiante => estudiante3, :materium => m3,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"
FactoryGirl.create :estudiantematerium,  :estudiante => estudiante3, :materium => ms2,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"

FactoryGirl.create :estudiantematerium,  :estudiante => estudiante4, :materium => m3,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"
FactoryGirl.create :estudiantematerium,  :estudiante => estudiante4, :materium => ms2,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"

FactoryGirl.create :estudiantematerium,  :estudiante => estudiante5, :materium => m3,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"
FactoryGirl.create :estudiantematerium,  :estudiante => estudiante5, :materium => ms2,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"

FactoryGirl.create :estudiantematerium,  :estudiante => estudiante6, :materium => m3,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"
FactoryGirl.create :estudiantematerium,  :estudiante => estudiante6, :materium => m4,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"

FactoryGirl.create :estudiantematerium,  :estudiante => estudiante7, :materium => m3,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"
FactoryGirl.create :estudiantematerium,  :estudiante => estudiante7, :materium => ms4,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"

FactoryGirl.create :estudiantematerium,  :estudiante => estudiante8, :materium => ms4,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"
FactoryGirl.create :estudiantematerium,  :estudiante => estudiante8, :materium => ms1,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"

FactoryGirl.create :estudiantematerium,  :estudiante => estudiante9, :materium => ms4,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"
FactoryGirl.create :estudiantematerium,  :estudiante => estudiante9, :materium => ms1,  :periodo => periodo2, :area => "Integracion", :estado => "planeada"
