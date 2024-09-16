import capos.*
import artefactos.*

object bendicion {
    const poder = 4

    method poder(personaje) {
        return poder
    }

}

object invisibilidad {

    method poder(personaje) {
        return personaje.poderBase()
    }

}

object invocacion {

    method poder(personaje) {
        return personaje.artefactoMasPoderosoEnCastillo().poder()
    }
    
}