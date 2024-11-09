class Personaje{
    const property fuerza
    const property inteligencia
    var rol

    method cambiarDeRol(unRol){
        rol = unRol
    }

    method poderOfensivo() = fuerza * 10 + rol.extra()
    method esGroso() = self.esInteligente() or self.esGrosoEnSuRol()
    method esInteligente() 
    // Se deja abstracto porque lo entienden todos diferente, tmb se puede poner false
    method esGrosoEnSuRol() = rol.esGroso(self) // self para ref la class padre con la hija
}

class Orco inherits Personaje{
    override method poderOfensivo() = super() * 1.1
    override method esInteligente() = false
}

class Humano inherits Personaje{
    override method esInteligente() = inteligencia > 50
}

object guerrero{
    method extra() = 100
    method esGroso(unPersonaje) = unPersonaje.fuerza() > 50
}
class Cazador{ // Es clase por pluralidad y tener atributos.
    const property mascota
    method extra() = mascota.extra()
    method esGroso(unPersonaje) = mascota.esLongeba()
}
object brujo{
    method extra() = 0
    method esGroso(unPersonaje) = true
}

class Mascotas{
    const property fuerza
    var edad
    const property tieneGarras

    method edad() = edad
    method aumentarEdad(){edad += 1}

    method extra() = if(tieneGarras){fuerza * 2}else(fuerza)

    method esLongeba() = edad > 10
}