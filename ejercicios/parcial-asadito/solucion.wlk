import wollok.game.*

class Persona {
  const property elementos = []
  var property criterioDeCambio = normal
  var property posicion = new Position(x = 0, y = 0)
  var property dieta = vegetariano
  const comidasIngeridas = []
  const posicionesOcupadas = [posicion]
  
  method agregarElementos(otrosElementos) {
    self.elementos().addAll(otrosElementos)
  }
  
  method quitarElementos(otrosElementos) {
    self.elementos().removeAll(otrosElementos)
  }
  
  method pasame(elemento, quienLoDa) {
    self.validarElemento(elemento)
    criterioDeCambio.aplicar(elemento, self, quienLoDa)
  }
  
  method validarElemento(elemento) {
    if (!self.tengoElemento(elemento)) {
      throw new DomainException(message = "no tengo el elemento")
    }
  }
  
  method tengoElemento(elemento) = elementos.contains(elemento)
  
  method primerElemento() = self.elementos().first()
  
  method cambiarDeLugarCon(otraPersona) {
    var aDondeVoy = otraPersona.posicion()
    otraPersona.ocuparPosicion(posicion)
    self.ocuparPosicion(aDondeVoy)
  }
  
  method ocuparPosicion(nuevaPosicion) {
    posicion = nuevaPosicion
    posicionesOcupadas.add(nuevaPosicion)
  }
  
  method comer(comida) {
    if (dieta.quiereComer(comida)) comidasIngeridas.add(comida)
  }
  
  method estaPipon() = comidasIngeridas.any({ comida => comida.esPesada() })
  // podria Hacer !comidaPocoCalorica, pero incluiria 500, lo cual no se pide, se pide >500
  
  method comioAlgo() = !comidasIngeridas.isEmpty()
  
  method laEstaPasandoBien() = self.comioAlgo() && self.laPasaBienPersonalmente()
  
  method laPasaBienPersonalmente() = true
}

class CriterioDeCambio {
  method aplicar(elemento, quienLoPide, quienLoDa) {
    const elementosADevolver = self.queElementosLePaso(elemento, quienLoDa)
    quienLoPide.agregarElementos(elementosADevolver)
    quienLoDa.quitarElementos(elementosADevolver)
  }
  
  method queElementosLePaso(elemento, quienLoDa)
}

object irritado inherits CriterioDeCambio {
  override method queElementosLePaso(
    elemento,
    quienLoDa
  ) = quienLoDa.elementos()
}

object sordo inherits CriterioDeCambio {
  override method queElementosLePaso(elemento, quienLoDa) = [
    quienLoDa.primerElemento()
  ]
}

object normal inherits CriterioDeCambio {
  override method queElementosLePaso(elemento, quienLoDa) = [elemento]
}

object cambioDeLugar {
  method aplicar(elemento, quienLoPide, quienLoDa) {
    quienLoPide.cambiarDeLugarCon(quienLoDa)
  }
} /* Punto 2 */

class BandejaDeComida {
  const property comidas
}

class Comida {
  var property calorias
  var property esCarne
  
  method tieneMenosCaloriasQue(
    topeDeCalorias
  ) = self.calorias() < topeDeCalorias
  
  method esPesada() = self.calorias() > 500
}

object vegetariano {
  method quiereComer(comida) = !comida.esCarne()
}

class Alternado {
  var property estaDeHumor = false
  
  method quiereComer(comida) {
    estaDeHumor != estaDeHumor
    return estaDeHumor
    // si no un metodo? para q no haga las 2 cosas
  }
}

object dietetico {
  var property topeDeCalorias = 500
  
  method quiereComer(comida) = comida.tieneMenosCaloriasQue(topeDeCalorias)
}

class Conbineta {
  const property dietas = []
  
  method agregarDieta(unaDieta) {
    self.dietas().add(unaDieta)
  }
  
  method quiereComer(comida) = dietas.all(
    { dieta => dieta.quiereComer(comida) }
  )
} // Punto 4

const osky = new Persona()

object moni inherits Persona {
  override method laPasaBienPersonalmente() = posicionesOcupadas.contains(
    game.at(1, 1)
  )
}

object facu inherits Persona {
  override method laPasaBienPersonalmente() = comidasIngeridas.any(
    { comida => comida.esCarne() }
  )
}

object vero inherits Persona {
  override method laPasaBienPersonalmente() = elementos.size() <= 3
}