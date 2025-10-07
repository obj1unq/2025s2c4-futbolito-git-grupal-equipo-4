/** First Wollok example */
import wollok.game.*
import pgmProgram.*

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
	
	method patearDerecha() {
		if (position == pelota.position()) {pelota.pateoADerecha()}
			else { game.say(self, "pelota ven a mi") } 
	}
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method pateoADerecha() {
		position = game.at(self.incrementarXen3Max(position.x()), position.y())
	}
	method incrementarXen3Max(posX) {
		return posX +  3.min(game.width() - posX) 
	}
}

