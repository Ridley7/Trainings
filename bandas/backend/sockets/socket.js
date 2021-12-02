//Recogemos la importacion de la variable io en index.js para poder
//usar los sockets con el app de express
const { io } = require('../index');

//Mensajes de sockets
io.on('connection', client => {

    console.log("Cliente conectado");

    client.on('mensaje', (payload) => {
        console.log("Mensaje", payload);

        io.emit('mensaje', {admin: 'Nuevo Mensaje'});
    });

    client.on('disconnect', () =>{
        console.log("Cliente desconectado");
    });
});