/** First Wollok example */
import wollok.game.*

object lionel {
	var property position = game.at(3, 5)
	
	method image() = "lionel-titular.png"
	
	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y())
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y())
	}
	method levantarla() {
		pelota.subir(self)
}
}
object pelota {
	const property image = "pelota.png"
	var property position = game.at(5, 5)
	
	method irAlInicion() {
		self.position(game.at(0, 0))
	}
	method subir(lionel) {
		if(lionel.position() == self.position()){
			position = game.at(self.position().x(), self.position().y() + 1)
			game.schedule(2000, { => position = game.at(self.position().x(),self.position().y() - 1 ) })
		}
	}

	
	
}