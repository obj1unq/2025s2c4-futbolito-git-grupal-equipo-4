/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method taquito() {
		if (pelota.position() == self.position()) {
			pelota.position = game.at(0.max(pelota.position().x() - 2), pelota.position().y())
		}
	}
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}
