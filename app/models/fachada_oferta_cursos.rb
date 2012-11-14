class FachadaOfertaCursos
  def initialize
    
  end
  def darMaestriasCoordinador(idCoordinador)
    maestrias = Maestrium.all
    maestriasretorno = []
    maestrias.each do |maestrium|
      if (maestrium.user != nil and maestrium.user.id == idCoordinador) then
        maestriasretorno << maestrium
      end
    end
    return maestriasretorno
  end
  
  def darMateriasMaestria(idMaestria)
    maestria = Maestrium.find(idMaestria)
    materiasretorno = []
    if(maestria.pensums != nil) then
      if(maestria.pensums.length > 0) then
        pensum = maestria.pensums.last
        if(pensum.materia != nil) then
          pensum.materia.each do |materium|
            materiasretorno << materium
          end
        end
      end
     end
     return materiasretorno
  end
  
  def darMateriasPorMaestriaDeCoordinador(idCoordinador)
    resultado = {}
    maestrias = darMaestriasCoordinador(idCoordinador)
    if(maestrias != nil) then
      maestrias.each do |maestrium|
        if(darMateriasMaestria(maestrium.id) != nil) then
          resultado[maestrium.id] = darMateriasMaestria(maestrium.id)
        end
      end
    end  
    return resultado
  end
  
  def darIdsMateriasTopDeCoordinador(idCoordinador, top, idPeriodo)
      materiasTop = darMateriasPorMaestriaDeCoordinador(idCoordinador)
      mapaTopMaterias = {}
      if(materiasTop != nil) then 
        estmaterias = Estudiantematerium.all 
        if(estmaterias != nil) then
          estmaterias.each do |em|
            materiasTop.each do |idMaestria, mats|
              if(mats!=nil) then
                mats.each do |mat|
                  if(em.materium.id == mat.id and
                     em.periodo.id == idPeriodo) then
                    if (mapaTopMaterias[em.materium.id] != nil) then
                      mapaTopMaterias[em.materium.id] = mapaTopMaterias[em.materium.id] + 1
                    else
                      mapaTopMaterias[em.materium.id] = 1
                    end
                  end
                end
              end
            end
          end
        end
      end
      mapaOrd = mapaTopMaterias.sort_by {|k,v| v}.reverse
      if(mapaOrd.length < top.to_i) then
        llaves = []
        mapaOrd.each do |llave, valor|
          llaves << llave
        end
        return llaves
      else 
        llaves = []
        contador = 0;
        mapaOrd.each do |llave, valor|
          if(contador < top.to_i ) then
            llaves << llave
            contador = contador + 1
          end
        end
        return llaves
      end 
  end
  
  def darMateriasPorMaestriaDeCoordinadorConTop(idCoordinador, top, idPeriodo)
    retorno = {}
    idMateriasTop = darIdsMateriasTopDeCoordinador(idCoordinador, top, idPeriodo)
    materiasMaestria = darMateriasPorMaestriaDeCoordinador(idCoordinador)
    if(materiasMaestria != nil) then
      materiasMaestria.each do |maestriumid, materias|
        if(materias != nil) then
          materias.each do |materium|
            if(idMateriasTop.include?(materium.id)) then
              materium.estop = true
            else
              materium.estop = false
            end
          end
        end
      end
    end  
    return materiasMaestria
  end
  
  def darPeriodosDisponibles()
    return Periodo.all
  end
  
  def darDetallesMateria(idMateria, idPeriodo)
    mapaResultados = {}
    materium = Materium.find(idMateria)
    if (materium != nil) then
      mapaResultados["codigo"] = materium.codigo
      mapaResultados["nombre"] = materium.nombre
      if (materium.maestrium != nil) then
        mapaResultados["maestria"] = Maestrium.find(materium.maestrium.id).codigo
      else
        mapaResultados["maestria"] = ""
      end
      estmaterias = Estudiantematerium.all
      if (estmaterias != nil) then
        estmaterias.each do |em|
            tipoEstudiante = em.estudiante.tipo_estudiante
            
            if(em.periodo.id == idPeriodo and em.materium.id == idMateria) then
              #cuenta cant estudiantes pregrado que toman la materia en el periodo
              if (tipoEstudiante == "pregrado") then
                if (mapaResultados["cantidadPregrado"] == nil) then
                  mapaResultados["cantidadPregrado"] = 1
                else
                  mapaResultados["cantidadPregrado"] = mapaResultados["cantidadPregrado"] + 1
                end  
              #cuenta cant. estudiantes maestria que toman la materia en el periodo
              else if (tipoEstudiante == "maestria" or tipoEstudiante == nil) then
                if (mapaResultados["cantidadMaestria"] == nil) then
                  mapaResultados["cantidadMaestria"] = 1
                else
                  mapaResultados["cantidadMaestria"] = mapaResultados["cantidadMaestria"] + 1 
                end 
              end
              #cuenta estudiantes de una maestria en especifico que la desean ver para el periodo
              if (em.tipo_pensum != nil) then
                tipoPensum = TipoPensum.find(em.tipo_pensum.id)
                if (tipoPensum.pensum != nil) then
                  pensum = Pensum.find(tipoPensum.pensum.id)
                  if (pensum.maestrium != nil) then
                    maestriaconteo = Maestrium.find(pensum.maestrium.id)  
                    if (mapaResultados[maestriaconteo.codigo] == nil) then
                      mapaResultados[maestriaconteo.codigo] = 1
                    else
                      mapaResultados[maestriaconteo.codigo] = mapaResultados[maestriaconteo.codigo] + 1
                    end
                  end
                end
              end
            end
          end    
        end
      end
      return mapaResultados   
    else
      return mapaResultados
    end 
  end
  
  def definirOfertaCursos(idsMaterias, idPeriodo)
    if (idsMaterias != nil) then
      periodo = Periodo.find(idPeriodo)
      idsMaterias.each do |idMat|
        materia = Materium.find(idMat)
        oferta = OfertaCursosPeriodo.new
        oferta.periodo = Periodo.find(idPeriodo)
        oferta.materium = materia
        oferta.save
        estmat = Estudiantematerium.all
        if (estmat != nil) then 
          estmatborrarids = []
          estmat.each do |est|
            if(est.periodo.id == idPeriodo and est.estado == "planeada") then
              if(idsMaterias.include?(est.materium.id)) then
                #no se hace nada
              else
                estmatborrarids << est.id
              end 
            end
          end  
          estmatborrarids.each do |idb|
            estmatborrar = Estudiantematerium.find(idb)
            puts idb
            estmatborrar.destroy
          end      
        end
      end   
    end
  end
end