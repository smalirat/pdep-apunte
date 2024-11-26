
class Lugar {
    const nombre
    method esDivertido() =  self.cantidadDeLetras().even() 
                            && self.esDivertidoExtra()
    method esDivertidoExtra() 
    method esTranquilo()
    method cantidadDeLetras() = nombre.length() 
    method esRaro() = self.cantidadDeLetras() > 30  

}

class Ciudad inherits Lugar {
    const atracciones = []
    const cantidadDecibeles
    var property cantidadHabitantes

    override method esDivertidoExtra() = 
                            atracciones.length()> 3
                            && cantidadHabitantes > 100000
    override method esTranquilo() = cantidadDecibeles < 20

}

class Pueblo inherits Lugar {
    const provincia
    const fechaFundacion
    override method esDivertidoExtra()=   self.esDelLitoral() 
                                                  || self.esAntigua() 
    method esDelLitoral() = ["Corrientes","Entre Rios","Misiones"].contain(provincia) 
    method esAntigua() = fechaFundacion.year() < 1800 
    override method esTranquilo() = provincia == "La Pampa"
      
}

class Balneario inherits Lugar {
    const marEsPeligroso 
    const extencionPlaya 
    const tienePeatonal 

    override method esDivertidoExtra() =  marEsPeligroso && extencionPlaya > 300
    override method esTranquilo() =!tienePeatonal
}

class Persona {
    const preferencia 
    var property  presupuestoMaximo 

    method elige(lugar) = preferencia.elige(lugar) 
    method puedePagar(monto) = monto <= presupuestoMaximo 
    method eligeLugares(lugares) = lugares.all { lugar => self.elige(lugar)} 

}

object tranquilo{
    method elige(lugar) = lugar.esTranquilo()
}

object diversion {
    method prefiere(lugar) = lugar.esDivertido() 
}

object raris {
    method elige(lugar) = lugar.nombreRaro() 
  
}

class Conbineta {
    const preferencias = []
    method prefiere(lugar) = preferencias.any { preferencia => preferencia.prefiere(lugar)}
}

// Punto 3
class Tour {
    const integrantes = []
    var property montoTour 
    const destino = []
    const cuposTotales
    const listaDeEspera = []
    const fecha


    method agregarPersona(persona) { if(!(persona.puedePagar(montoTour)))
        throw new DomainException ( message = " usted esta dispuesto a pagar menos que"+ montoTour) // self.validarPagso(persona)
          if (!self.eligeLugares(persona)) 
            throw new DomainException (message = " Algun Lugar no lo eligiria") // self.validarPreferencia(persona)
          if (!self.estaConfirmado())
            // listaDeEspera.add(persona)
            // thow new DominException (message = " El tour esta confirmado. Quedas en la lista de espera")
            throw new DomainException (message = " No Hay Lugar en el Tour") // self.validarCupo()
            integrantes.add(persona)
     } 

    method eligeLugares(persona) = destino.all {lugar => persona.elige(lugar)}
    method estaConfirmado() = integrantes.size() < cuposTotales 
    //method agregarPersona(persona){ self.validarPago(persona) self.validarPreferencia(persona)  self.validarCupo()}
    method bajarPersona(persona) {
        integrantes.remove(persona)
        self.agregarPersonaEnEspera()
    } 
    method agregarPersonaEnEspera() { const nuevoIntegrante = listaDeEspera.firt()
                            listaDeEspera.remove(nuevoIntegrante)
                            integrantes.add(nuevoIntegrante)}
    method esDeEsteAnio() = fecha.year() == new Date().year()
    method montoTotal() = montoTour * integrantes.size() 
}

// Punto 4 Reportes
object reporte {
    const tours = []

    method toursPendienteDeConfirmacion() =  tours.filter{tour => !tour.estaConfirmado()}
    method montoTotal() = self.toursDeAnioActual().sum{tour => tour.montoTotal()} 
     
    method toursDeAnioActual() = tours.filter{ tour => tour.esDeEsteAnio()} 
}