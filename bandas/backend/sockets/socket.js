//Recogemos la importacion de la variable io en index.js para poder
//usar los sockets con el app de express
const { io } = require('../index');

const Bands = require('../models/bands');
const Band =  require('../models/band');

const bands = new Bands();

bands.addBand(new Band('Queen'));
bands.addBand(new Band('Bon Jovi'));
bands.addBand(new Band('Metallica'));
bands.addBand(new Band('Heroes del Silencio'));

console.log(bands);

//Mensajes de sockets
io.on('connection', client => {

    console.log("Cliente conectado");

    //Cuando se conecta un cliente, le emitimos todas las bandas que tenemos disponible
    client.emit('active-bands', bands.getBands() );

    client.on('mensaje', (payload) => {
        console.log("Mensaje", payload);

        io.emit('mensaje', {admin: 'Nuevo Mensaje'});
    });

    client.on('disconnect', () =>{
        console.log("Cliente desconectado");
    });

    //Escuchamos evento para la votacion de bandas por parte
    //del cliente
    client.on('vote-band', (payload) => {

        //Votamos por la banda
        bands.voteBands(payload.id);

        //Notificamos a todos los demas que ha habido cambios.
        //De hecho se emiten las mismas bandas pero actualizadas
        io.emit('active-bands', bands.getBands() );
    });

    //Escuchamos evneto para añadir una band
    client.on('add-band', (payload) =>{
        //Creamos nueva banda
        const new_band = new Band(payload.name);
        //Añadimos la banda
        bands.addBand(new_band);
        //Emitimos eventos para que todos los clientes se enteren
        //de la nueva banda
        io.emit('active-bands', bands.getBands());
    });

    //Escuchamos evento para borrar una banda
    client.on('delete-band', (payload) =>{
        //Añadimos la banda
        bands.deleteBand(payload.id);
        //Emitimos eventos para que todos los clientes se enteren
        //de la banda borrada
        io.emit('active-bands', bands.getBands());
    });

    /*
    client.on('emitir-mensaje', (payload) => {
        //console.log(payload);
        client.broadcast.emit('nuevo-mensaje', payload);
    });
    */
});