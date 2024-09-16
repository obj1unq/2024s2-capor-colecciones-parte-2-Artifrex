import capos.*
import hechizos.*

object espada {
    var estaNueva = true

    method poder(personaje) {
        return personaje.poderBase() * self.multiplicadorDeDano() 
    }

    method multiplicadorDeDano() {
        return if (estaNueva) 1 else 0.5
    }

    method serUsado() {
        estaNueva = false 
    }
}

object libro {
    const hechizos = []

    method poder(personaje) {
        return if (self.quedanHechizos()) self.hechizoActual().poder(personaje)
              else 0
    }

    method hechizoActual() {
        return hechizos.head()
    }

    method quedanHechizos() {
        return not hechizos.isEmpty()
    }

    method serUsado() {
        hechizos.remove(self.hechizoActual())
    }

}

object collar {

    const poderBase = 3
    var usos = 0 

    method poder(personaje) {
        return poderBase + self.modificadorDePoder(personaje)
    }

    method modificadorDePoder(personaje) {
      return if (personaje.poderBase() > 6) usos else 0
    }

    method serUsado() {
        usos = usos + 1
    }

}

object armadura {

    const poderDeBatalla = 6

    method poder(personaje) {
        return poderDeBatalla
    }

    method serUsado() {
    
    }

}