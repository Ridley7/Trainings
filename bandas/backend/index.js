//Traemos el modulo de express npm i express
const express = require ('express');
const path = require('path');
//npm i dotenv -> fichero de configuracion para que se lean variables de entorno
require('dotenv').config();

//App de express
const app = express();

//Node server
const server = require('http').createServer(app); //Aqui se mezcla express y el servidor node
//const io = require('socket.io')(server);
//Exportamos el nombre io, para poder usarlo en el fichero donde estan los sockets
module.exports.io = require('socket.io')(server);

//Importamos los sockets que estan en otro fichero
require('./sockets/socket');

//path publico
const publicPath = path.resolve(__dirname, 'public');

app.use( express.static(publicPath));


server.listen(process.env.PORT, (err) => {

    if( err ) throw new Error(err);

    console.log('Escuchando desde el puerto', process.env.PORT);
});