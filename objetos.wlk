/** First Wollok example */
import wollok.game.*

object lionel {
	var camiseta = camisetaTitular
	var property position = game.at(0, 5)
	
	method image() {
		return "lionel-" + camiseta.estado() + ".png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method cambiarDeCamiseta() { 
		self.validarPosicionEnElBordeIzq()
		camiseta = camiseta.siguienteCamiseta() 
	}
	
	method validarPosicionEnElBordeIzq() {
		if(! self.estaEnElBordeIzq()){
			self.error("Lionel no está en el borde izquierdo")
		}
	}

	method estaEnElBordeIzq() = position == game.at(0, 5)
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}

object camisetaSuplente {
	method estado() = "suplente"

	method siguienteCamiseta() = camisetaTitular 
  
}

object camisetaTitular {
	method estado() = "titular"

	method siguienteCamiseta() = camisetaSuplente
}