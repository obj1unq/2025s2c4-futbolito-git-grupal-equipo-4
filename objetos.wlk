/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var property objeto = pelota

	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method irASaqueLateral(){
		self.validarIrASaqueLateral()
		position = game.at(position.x(), 0)
		objeto.llevarObjetoALateral()
	}

	method validarIrASaqueLateral() {
		if (self.estoySobreAlgo(objeto)){
			self.error("Flaco, no puedo estar sobre" + objeto + " en el mismo lugar")
		}
	}
	
	method estoySobreAlgo(algo){
		return self.position() == algo.position()
	}
}
object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)
}