/** First Wollok example */
import wollok.game.*
import pgmProgram.*

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
	
	method patearDerecha() {
		if (position == pelota.position()) {pelota.pateoADerecha()}
			else { game.say(self, "pelota ven a mi") } 
	}	
}

	method taquito() {
		pelota.taquito()
	}
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method taquito() {
		if (self.position() == lionel.position()) {
			position = game.at(0.max(position.x() - 2), position.y())
		}
	}

	method pateoADerecha() {
		position = game.at(self.incrementarXen3Max(position.x()), position.y())
	}
  
	method incrementarXen3Max(posX) {
		return posX +  3.min(game.width() - posX) 
	}
}

object camisetaSuplente {
	method estado() = "suplente"

	method siguienteCamiseta() = camisetaTitular
}

object camisetaTitular {
	method estado() = "titular"

	method siguienteCamiseta() = camisetaSuplente
}
