import testTierra.*

//Punto 1
//Integrante 1 (Valen)

//Integrante 2 (Santi)

/*object espada {
  var property magia = magiaElfica

  method poderOtorga(guerrero) = magia.poderDeMagia(guerrero) * 10
}*/




object flechaDeBronce {
  var property fechaLustrado = new Date()
  var property fechaDeUso = calendarioPosta

  method poderOtorga(guerrero) = (100 - self.diasPasados()).max(0)

  method diasPasados() = fechaDeUso.today() - fechaLustrado
}

object calendarioPosta {
  method today() = new Date()
}

object flechaDeAluminio {
  var property poder = 50

  method poderOtorga(guerrero) = poder
}

object flechaDeHierro {
  var property oxidada = true
  var property poder = 70

  method poderOtorga(guerrero) = if (oxidada) poder / 2 else poder
}

object cajadeFlechasNegra {
  var property flechas = #{flechaDeBronce, flechaDeAluminio, flechaDeHierro}

  method flechasValidas(guerrero) = flechas.filter(
    { flecha => flecha.poderOtorga(guerrero) > 50 }
  )

  method sumarPoderFlechas(guerrero) = self.flechasValidas(guerrero).sum(
    { flecha => flecha.poderOtorga(guerrero) }
  )

  method poderOtorga(guerrero) = self.sumarPoderFlechas(
    guerrero
  ) / self.flechasValidas(guerrero).size()
}

/*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

// La Tierra Media - 2da Parte

// Punto 1: Arsenal

// Integrante 1 (Valentina)
class Espada {
  var property multiplicadorDePoder
  var property magia

  method poderOtorga(guerrero) = magia.poderDeMagia(guerrero) * multiplicadorDePoder
}

object magiaElfica {
  method poderDeMagia(guerrero) = 25
}
object magiaEnana {
  method poderDeMagia(guerrero) = guerrero.nivelDeVida() / 2
}
class Daga inherits Espada {

 override method poderOtorga(guerrero)= 0.5 * super(guerrero)

}

class MagiaHumana {
  const property fraccionDeVida
  method poderDeMagia(guerrero)= guerrero.nivelDeVida() * (fraccionDeVida/100)

}



// Integrante 2 (Santiago)

class Arco {
  var property tension = 40
  const property largo


  method poderOtorga(guerrero) = (tension * largo )*0.1

}

class Ballesta inherits Arco {

  override method poderOtorga(guerrero) = super(guerrero) * self.cuantoIncrementaLaTensionDel(guerrero)

  method cuantoIncrementaLaTensionDel(guerrero) = if (guerrero.cantidadDeArmas() > 3) 1.2 else 1.1
}

/*class ArmaDeRango {

  method poderOtorga(guerrero) = (arma.multiplicadorDeArma(
    self) * self.valorTension()) / 10
}
object arco {
  method multiplicadorDeArma(guerrero) = 1
}
object ballesta {
  method multiplicadorDeArma(guerrero)
} */


// Integrante 3 (Joaco)

class Hacha {
  var property madera
  const property valorFijo
  //var property porcentaje

  method poderOtorga(guerrero) = valorFijo + madera.poderMadera(self)
}

object ruberoica {
  var property porcentaje = 1
  method calcularPoderMango(hacha) = hacha.valorFijo() * porcentaje / 100

  method poderMadera(hacha) = self.calcularPoderMango(hacha).min(50)

}
object nolan {
  method poderMadera(hacha) = 35

 }

object luduenico {
  //var property porcentaje = 1
  method poderMadera(hacha) = ruberoica.poderMadera(hacha) + 10
}

object baculo {
  var property poderBase = 250

  method poderOtorga(guerrero) = self.calculoPoderBase(guerrero).min(400)

  method calculoPoderBase(guerrero) = poderBase * self.efectoMultiplicador(
    guerrero
  )

  method efectoMultiplicador(guerrero) = if (guerrero.tienePocaVida()) 2 else 1
} // Igual que en la primera entrega

// Arma super poderosa de gollum
object piedra{
  method poderOtorga(guerrero) = 10
}

// Punto 2: Sobre los Guerreros


object maiar {
  //method tienePocaVida(guerrero) = guerrero.nivelDeVida() < 10

  /*method poder(guerrero) = if (guerrero.tienePocaVida())
                     (guerrero.nivelDeVida() * 200) + (guerrero.sumarPoderArmas() * 2)
                   else (guerrero.nivelDeVida() * 15) + (guerrero.sumarPoderArmas() * 2) */

  method poder(guerrero) = guerrero.sumarPoderArmas() *2 + guerrero.nivelDeVida() * self.multiplicadorSegunLaVida(guerrero)
  method multiplicadorSegunLaVida(guerrero) = if (guerrero.tienePocaVida() ) 200 else  15
}

// Integrante 1 (Valentina)
object hobbit{
  method poder(guerrero) = guerrero.nivelDeVida()  + (guerrero.sumarPoderArmas() * 2)
}

class Elfo{
  var property poderPocillo = 1000.randomUpTo(5000)

  method poder(guerrero) = poderPocillo/2

}

// Integrante 2 (Santiago)

class Enano {
  const property factorDePoder
  method calculoDePoder(guerrero) = (guerrero.nivelDeVida() * factorDePoder ) + (guerrero.sumarPoderArmas() * 2)
  method poder(guerrero) =  self.calculoDePoder(guerrero) * 0.3

}

// Integrante 3 (Joaco)
class Humano {

  method factorPorArmas(guerrero) = 1.1 ** guerrero.cantidadDeArmas()
  method poder(guerrero) = (guerrero.nivelDeVida()*self.factorPorArmas(guerrero)) + (guerrero.sumarPoderArmas() * 2)
}


/*object gollum{
  method nivelDeVida() = 50
  method poder(guerrero) = hobbit.poder(guerrero) / 2
  method armas() = #{piedra}
}*/

const gollum = new Guerrero (armas = #{piedra}, nivelDeVida = 50, raza=hobbit)
const gandalf =  new Guerrero (armas = #{baculo, new Espada(multiplicadorDePoder = 10, magia = magiaElfica)/*, cajadeFlechasNegra*/}, nivelDeVida = 100, raza = maiar)
const frodo =  new Guerrero (armas = #{new Espada(multiplicadorDePoder = 10, magia = magiaElfica)}, nivelDeVida = 60, raza = hobbit)
const gimli =  new Guerrero (armas = #{new Daga(multiplicadorDePoder = 10, magia = magiaElfica)}, nivelDeVida = 70, raza = new Enano(factorDePoder = 3))
const legolas =  new Guerrero (armas = #{new Arco(largo = 110), new Espada(multiplicadorDePoder = 12, magia = magiaElfica) }, nivelDeVida = 80, raza = new Elfo())
const aragorn = new Guerrero (armas = #{new Ballesta(largo = 10), new Espada(multiplicadorDePoder = 18, magia = magiaElfica) }, nivelDeVida = 80, raza = new Humano())
//agrego un archienemigo
const saruman = new Guerrero (armas = #{baculo, new Espada(multiplicadorDePoder = 20, magia = magiaElfica), cajadeFlechasNegra, new Ballesta(largo = 10)}, nivelDeVida = 60, raza = maiar)

object tom {
  const property nivelDeVida = 100
  //const property armas = #{}
  const property poder = 2000

  method nivelDeVida(nuevoNivel) {
  }

  method cantidadDeArmas() = 100

  method actualizarVida(valor) {

  }

  method pasarPor(zona) {}
}
// Lo dejamos igual que en la 1era entrega

// Punto 3: Los Caminos de la Tierra Media

object bosqueDeFangorn  {
  const property limitePoder = 50

  method condicionPasar(guerrero) = guerrero.poder() > limitePoder

  method pasoPorzona(guerrero) = -10
}

object edoras  {
  const property limitePoder = 300

  method condicionPasar(guerrero) = guerrero.poder() > limitePoder

  method pasoPorzona(guerrero) = -50
}

// Los caminos de la 1era entrega se mantienen igual
object lebennin {
  var property cantidadGuardias = 0

  method condicionPasar(guerrero) =  (cantidadGuardias > 3 && (guerrero.poder() > 1500)) || (cantidadGuardias < 3 && (guerrero.poder() > 1000))

  method pasoPorzona(guerrero) = guerrero.cantidadDeArmas() * (-10)


}

object minasTirith {
  method condicionPasar(guerrero) = guerrero.cantidadDeArmas() >= 1

  method pasoPorzona(guerrero) = guerrero.cantidadDeArmas() * (-10)

}

object lossarnach {
  method condicionPasar(guerrero) = true

  method pasoPorzona(guerrero) = guerrero.cantidadDeArmas() * (2)

}


/*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

// La Tierra Media - 3era Parte

// Punto 1: A la carga!!! - Integrante 1 (Valentina)
class Tactica {
  method ejecutar(atacante, oponente) {
    oponente.recibirDanio(atacante, atacante.poder())
    atacante.recibirDanio(oponente, oponente.poder())
  }
}
object tacticaAgil inherits Tactica{
 override method ejecutar(atacante, oponente){
    atacante.valorAgregado(100)
    super(atacante,oponente)

  }
}
object tacticaDeResistencia inherits Tactica {
  override method ejecutar(atacante, oponente) {
    atacante.recibirDanio(oponente,oponente.poder())
    oponente.recibirDanio(atacante, atacante.poder()*0.5)

  }

}
class TacticaCaruso inherits Tactica {
  const property umbralDeEnergia
  override method ejecutar(atacante, oponente) {
    if(oponente.poder()> umbralDeEnergia){
      super(atacante,oponente)
    }
    else {atacante.actualizarVida(-10)}
  }
}
object tacticaLaCuatroTresTres inherits Tactica {
  override method ejecutar(atacante, oponente) {
    oponente.recibirDanio(atacante, atacante.poder())
    oponente.recibirDanio(atacante, atacante.poder())
    if(atacante.nivelDeVida() <= 60 ){
      atacante.recibirDanio(oponente, oponente.poder())
    }

  }
}




// Punto 2: Penalidades - Integrante 2 (Santiago)

class Guerrero{
//aca hay parte del punto
  var property nivelDeVida
  var property armas
  const property raza
  var property tactica = tacticaAgil
  var property valorAgregado = 0

  method poder() = raza.poder(self) + valorAgregado

  method tieneVida()= nivelDeVida > 0

  method sumarPoderArmas() = armas.sum({ arma => arma.poderOtorga(self) })

  method cantidadDeArmas() = self.armas().size()

  method tienePocaVida() = self.nivelDeVida()<10

  method enfrentarA(guerrero){ tactica.ejecutar(self, guerrero)}

  method recibirDanio(elQueAtaca, elPoder) {
    if(elQueAtaca.tieneVida()){
      self.actualizarVida(elPoder*(-0.1))
      }
  }

  method armaMasPoderosa ()  =
    self.armas().maxIfEmpty({arma => arma.poderOtorga(self)},{0})

  method deshacerArma(arma) {
    self.armas().remove(arma)
  }

  method actualizarVida(nuevoValor) {
    nivelDeVida += nuevoValor
  }


  method pasarPor(zona) {
    self.actualizarVida(zona.pasoPorzona(self))
  }


}

//Anillos - Integrante 3 Joaco:D

class Anillo {
  method invocar(duenio, archienemigo, amigo) {
    duenio.nivelDeVida((duenio.nivelDeVida() * 2).min(100))
  }
}
class AnilloDeFuego inherits Anillo{
  override method invocar(duenio, archienemigo, amigo) {
    archienemigo.actualizarVida(-20)
    super(duenio,archienemigo, amigo)
  }
}



// Anillo Maldito
class AnilloMaldito inherits Anillo {
    override method invocar(duenio, archienemigo, amigo) {
        duenio.deshacerArma(duenio.armaMasPoderosa())
        super(duenio, archienemigo, amigo)
    }
}


// Anillo de Aire
class AnilloDeAire inherits Anillo {
    override method invocar(duenio, archienemigo, amigo) {
        amigo.actualizarVida(30)
        super(duenio,archienemigo,amigo)
    }
}

// Anillo Único
object anilloUnico inherits Anillo {
    override method invocar(duenio, archienemigo, amigo) {
        super(duenio, archienemigo, amigo)
        if (duenio.cantidadDeArmas() > 3) {
            duenio.actualizarVida(-20)
        } else {
            duenio.actualizarVida(-30)
        }
    }
}


class Camino  {
  const property zonas
  var property castigos

  method puedeSerAtravesadoPor(guerrero) = self.zonas().all(
    { zone => zone.condicionPasar(guerrero) }
  )

  method atravesarCamino(guerrero) {
   if (!self.puedeSerAtravesadoPor(guerrero)){
      self.castigos().forEach({ castigo => castigo.aplicarCastigo(guerrero) })
      throw new Exception (message = "El guerrero no puede atravesar el camino ")
    }
    self.zonas().forEach({ zona => guerrero.pasarPor(zona) })
  }

}

class PierdeAlgoDeVida {
  var property cantidad

  method aplicarCastigo(guerrero) = guerrero.actualizarVida(-1*cantidad) //me parece mas comodo que la cantidad que pierde se declare positiva
}

object pierdeTodaLaVida {

  method restarVidaTotal(guerrero) = guerrero.nivelDeVida() * -1

  method aplicarCastigo(guerrero) = guerrero.actualizarVida(self.restarVidaTotal(guerrero))
}

object quitarArmaMasPoderosa {
  method aplicarCastigo(guerrero) = guerrero.deshacerArma(guerrero.armaMasPoderosa())
}


const rohan = new Camino (zonas = [bosqueDeFangorn, lossarnach, edoras], castigos = [])
const gondor = new Camino (zonas = [lebennin, minasTirith], castigos = [])

