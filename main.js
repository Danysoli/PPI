class Aviones {
    constructor(tipo, modelo, placa){
        this.tipo = tipo;
        this.modelo = modelo;
        this.placa = placa;
    }

    mostrarAvion(){
        return `Datos del avion: \n Tipo: ${this.tipo} \nModelo: ${this.modelo} \n Placa: ${this.placa}` ;
    }

    volarAvion(){
        return `El avion con placa "${this.placa}" esta volando`
    }
}

class AvionMilitar extends Aviones{
    constructor(tipo, modelo, placa, cantidadMisiles){
        super(tipo, modelo, placa);
        this.cantidadMisiles = cantidadMisiles;
    }

    disparar(numMisiles){
        return `El avion con placa "${this.placa}" esta disparando ${numMisiles} misiles al objetivo`
    }
    
    volarAvion(){
        return `El avion Militar con placa "${this.placa}" esta volando`
    }
}

class AvionDeCarga extends Aviones{
    constructor(tipo, modelo, placa, pesoMax){
        super(tipo, modelo, placa);
        this.pesoMax = pesoMax;
    }

    pesoDisponible(peso){
        return `El avion con placa "${this.placa}" esta cargando ${peso}Kg y tiene ${this.pesoMax-peso}Kg disponibles`
    }

    volarAvion(){
        return `El avion de Carga con placa "${this.placa}" esta volando`
    }
}

class AvionComercial extends Aviones{
    constructor(tipo, modelo, placa, cantidadPasajeros){
        super(tipo, modelo, placa);
        this.cantidadPasajeros = cantidadPasajeros;
    }

    asientosDisponibles(pasajeros){
        return `El avion con placa "${this.placa}" tiene ${pasajeros} pasajeros, por lo que, tiene ${this.cantidadPasajeros-pasajeros} asientos disponibles`
    }

    volarAvion(){
        return `El avion Comercial con placa "${this.placa}" esta volando`
    }
}

const comercial = new AvionComercial("comercial", 2021, "254asd", 30);
console.log(comercial.asientosDisponibles(20));
console.log(comercial.volarAvion());