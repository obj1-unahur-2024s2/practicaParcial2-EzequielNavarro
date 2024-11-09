import personajes.*

class Localidad{
    var ejercito = []
    method potencialDefensivo() = ejercito.potencialTotal()
    method invacion(ejercitoInvasor)
    method serOcupada(unEjercito)
 
}

class Aldea inherits Localidad{
    const property cantMaximaPersonajes
    override method serOcupada(unEjercito){
        // Ordenar ejercito y tomar los primeros 10
        if (unEjercito.size() > cantMaximaPersonajes){
            ejercito = unEjercito.nuevoEjercitoFuerte(10)
        }
    }
}

class Ciudad inherits Localidad{
    override method potencialDefensivo() = super() + 300
    override method serOcupada(unEjercito){
        ejercito = unEjercito
    }
}

class Ejercito{
    const property personajes = []
    method potencialTotal(){
        return personajes.sum({ p => p.poderOfensivo()})
    }

    method puedeTomarUnaLocalidad(unaLocalidad) =
        self.potencialTotal() > unaLocalidad.potencialDefensivo()

    method invadir(unaLocalidad){
        if(self.puedeTomarUnaLocalidad(unaLocalidad)){
            unaLocalidad.serOcupada(self)
        }
    }
    // Ordenar y tomar x cantidad
    method nuevoEjercitoFuerte(unaCantidad){
        const nuevoEjercito = personajes.sortBy({ p1, p2 => p1.poderOfensivo() > p2.poderOfensivo() }).take(unaCantidad)
        personajes.removeAll(personajes) // Borro para evitar duplicados.
        return new Ejercito( personajes = nuevoEjercito) 
    }
}