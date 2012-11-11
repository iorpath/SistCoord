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
      if(mapaOrd.length < top) then
        llaves = []
        mapaOrd.each do |llave, valor|
          llaves << llave
        end
        return llaves
      else 
        llaves = []
        contador = 0;
        mapaOrd.each do |llave, valor|
          if(contador < top ) then
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
end