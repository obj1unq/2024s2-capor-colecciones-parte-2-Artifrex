import artefactos.*
import hechizos.*

object rolando {
	const property inventario = #{}
	const property cosasEncontradas = []
	var capacidadInventario = 2
	var hogar = castillo
	var poderBase = 5

	method artefactoMasPoderosoEnCastillo() {
		return hogar.cofre().max({artefacto => artefacto.poder(self)})
	}

	method poderBase() {
		return poderBase
	}

	method pelearBatalla() {
		self.usarArtefactos()
		poderBase = poderBase + 1
	}

	method usarArtefactos() {
	  inventario.forEach({artefacto => artefacto.serUsado()})
	}

	method poderPelea() {
		return poderBase + self.poderDeArtefactos()
	}

	method poderDeArtefactos() {
		return inventario.sum{artefacto => artefacto.poder(self)}
	}	

	method capacidadInventario(_capacidadInventario) {
		capacidadInventario = _capacidadInventario
	}

	method encontrar(artefacto) {
		if (inventario.size() < capacidadInventario) {
			inventario.add(artefacto)
		} 
		cosasEncontradas.add(artefacto)
	}

	method irACastillo() {
		hogar.depositar(inventario)
		inventario.clear()
	}

	method hogar(_hogar) {
		hogar = _hogar
	}
	
	method posesionesTotales() {
		return self.inventario() + castillo.cofre()
	}
}

object castillo {
	const property cofre = #{}

	method depositar(inventario) {
		cofre.addAll(inventario)
	}


}



