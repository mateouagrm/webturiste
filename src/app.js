const express = require('express');
const fileUpload = require('express-fileupload');
const app = express();

const morgan = require('morgan');
const bodyParser = require('body-parser');

const mysql = require('mysql');
const myConnection = require('express-myconnection');

var server = require('http').Server(app);

var io = require('socket.io')(server);

var	port = process.env.PORT || 3000;

const customerRoutes = require('./routes/userRoutes');

const path = require('path');
//middlewares
//app.use(morgan('dev'));
app.use(express.static(path.join(__dirname,'public')));
/*==================================================
app.use(fileUpload()) para subir imagen al servidor
===================================================*/
app.use(fileUpload());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
});


app.set('view engine', 'ejs');
app.set('views', path.join(__dirname,'views'));
/*
app.use(myConnection(mysql, {
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'miturista'
}, 'single'));
*/

app.use(myConnection(mysql, {
	host: 'sql138.main-hosting.eu.',
	user: 'u868365439_turis',
	password: '123456',
	database: 'u868365439_turis'
}, 'single'));


//routes
app.use('/', customerRoutes);

/*SOCKET.IO*/
io.on('connection',function (socket) {
  console.log("alguien se conecto");

	socket.on('channel1', (data) => {
	  console.log('Greetings from RN app', data);
	})

	io.emit('channel2', 'envio servidor');

	socket.on('coordenadas', (data, id_conductor) => {
	  console.log('coordenadas: ', data, id_conductor);
		io.emit('coordenadas', data, id_conductor);	  
	})

	socket.on('channel2', (obj) => {
	  console.log('channel2: ', obj);
	})
	
});


server.listen( port, () => console.log('Iniciando Express y Socket.IO en localhost:%d', port) );