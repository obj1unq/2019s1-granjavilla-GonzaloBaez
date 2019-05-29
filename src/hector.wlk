import wollok.game.*
import plantas.*

object hector {
	var property posicionXHector = 0
	var property posicionYHector = 0
	
	method image() = "player.png"
	method position() = game.at(posicionXHector,posicionYHector)
	
	method moverEnX(direccion){
		if ((posicionXHector + direccion) <= (game.width() - 1) && (posicionXHector + direccion) >= 0)
		posicionXHector += direccion
	}
		method moverEnY(direccion){
		if ((posicionYHector + direccion) <= (game.height() - 1) && (posicionYHector + direccion) >= 0)
		posicionYHector += direccion
	}
	
	method plantarMaiz(){
		self.validarQueHayAlgoPlantado()
		game.addVisual(new Maiz(posicionX = posicionXHector,posicionY = posicionYHector))
		
	} 
	method plantarTrigo(){
		self.validarQueHayAlgoPlantado()
		game.addVisual(new Trigo(posicionX = posicionXHector,posicionY = posicionYHector))
	}
	
	method plantarTomaco(){
		self.validarQueHayAlgoPlantado()
		game.addVisual(new Tomaco(posicionX = posicionXHector,posicionY = posicionYHector))
	}
	method hayAlgoPlantado(){
		return not (self.objetosDelLugar() == [self])
	}
	method validarQueHayAlgoPlantado(){
		if (self.hayAlgoPlantado()){
			throw new UserException ("ya hay algo plantado")
		}
	}
	method plantaDeLugar(){
		return self.objetosDelLugar().filter{cosa => not (cosa == self)}.first()
	}
	method objetosDelLugar(){
		return game.getObjectsIn(game.at(posicionXHector,posicionYHector))
	}
	method regarPlantaDeLugar(){
		self.plantaDeLugar().regar()
	}
}


class UserException inherits Exception { }