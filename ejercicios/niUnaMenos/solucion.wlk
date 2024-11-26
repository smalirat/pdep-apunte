class Agresion {
  const lugar
  const property agresor
  const palabras
  
  method esGrave() = palabras.any(
    { unaPalabra => diccionario.esInaceptable(unaPalabra) }
  )
  
  method esIgnea() = palabras.contains("fuego")
}

class AgresionFisica inherits Agresion {
  var elemento
  
  override method esGrave() = true
  
  override method esIgnea() = (elemento == "combustible") or super()
}

object diccionario {
  var palabrasInaceptables = ["matar", "asesinar", "quemar"]
  
  method esInaceptable(unaPalabra) = palabrasInaceptables.contains(unaPalabra)
}

class Denuncia {
  
}

class Persona {
  var agresiones = []
  
  method hacerDenuncia()
}

object actitudMiedosa {
  method permiteDenuncia(unaPersona, unaAgresion) = false
  
  method actitudFrenteALaAmenaza() = self
}

class ActitudPaciente {
  var tolerancia
  
  method permiteDenuncia(
    unaPersona,
    unaAgresion
  ) = unaPersona.cantidadDeAgresionesCausadasPor(
    unaAgresion.agresor()
  ) > tolerancia
  
  method actitudFrenteALaAmenaza() {
    tolerancia *= 2
    return self
  }
}

object actitudAguerrida {
  method permiteDenuncia(
    unaPersona,
    unaAgresion
  ) = unaPersona.fueAgredidaGravementePorUnFamiliar()
  
  method actitudFrenteALaAmenaza() = new ActitudPaciente(tolerancia = 5)
}

object actitudMilitante {
  method permiteDenuncia(unaPersona, unaAgresion) = true
  
  method actitudFrenteALaAmenaza() = actitudAguerrida
}