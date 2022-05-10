const { comprobarJWT } = require('../helpers/jwt');
const { io } = require('../index');
const { usuarioConectado, usuarioDesconectado, grabarMensaje } = require('../controllers/sockets');


// Mensajes de Sockets
io.on('connection', client => {
    console.log('Cliente conectado');

    const [valido, uid] = comprobarJWT( client.handshake.headers['x-token'])

    if(!valido) { return client.disconnect(); }

    //Cliente autenticado
    usuarioConectado( uid );

    //Ingresamos al usuario a una sala en particular
    client.join( uid );

    //Añadimos oyente
    client.on('mensaje-personal', async (payload) => {
        console.log(payload);

        await grabarMensaje( payload );

        io.to( payload.para ).emit('mensaje-personal', payload);

    });

    client.on('disconnect', () => {
        usuarioDesconectado( uid );
    });

    /*
    client.on('mensaje', ( payload ) => {
        console.log('Mensaje', payload);

        io.emit( 'mensaje', { admin: 'Nuevo mensaje' } );

    });
    */


});
