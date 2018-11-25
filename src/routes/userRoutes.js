const express = require('express');
const router = express.Router();

const customerController = require('../models/user');
const conductorController = require('../models/conductorController');
const vehiculoController = require('../models/vehiculoController');
const solicitudController = require('../models/solicitudController');
const pedidoController = require('../models/pedidoController');


/*Api*/
router.get('/users', customerController.users);
router.post('/insertUsersCliente', customerController.insertUsersCliente);
router.post('/ingresar', customerController.ingresar);
router.post('/ingresarConductor', customerController.ingresarConductor);
router.post('/pedirMovil', customerController.pedirMovil);
router.get('/pedirMovilId/:id', customerController.pedirMovilId);
router.get('/pedidoEnProceso/:id', customerController.pedidoEnProceso);
router.get('/pedidoEnProcesoConductor/:id', customerController.pedidoEnProcesoConductor);
router.post('/verificarImagen', customerController.verificarImagen);
router.post('/compararImagen', customerController.compararImagen);
router.get('/notificarPedido/:id', customerController.notificarPedido);

/*WEB*/
//registro de conductor
router.get('/registroconductor', conductorController.registrar);
router.post('/registrarConductor', conductorController.postRegistrar);

//administrador
router.get('/gestionarConductor', conductorController.index);


//solicitud
router.post('/solicitudTotal', solicitudController.total);
router.get('/solicitud', solicitudController.atender);
router.get('/asignar/:id', solicitudController.atenderPedido);
router.post('/finalizar_solicitud', solicitudController.finalizar);
router.get('/obtenerIdAuto/:idConductor', solicitudController.obtenerIdAuto);

/*principal*/
router.get('/', solicitudController.atender);

/*Vehiculo*/
router.get('/gestionarVehiculo', vehiculoController.index);
router.post('/registrarVehiculo', vehiculoController.postRegistrar);
router.get('/obtenerConductor', vehiculoController.listaConductor);

//pedidos
router.post('/registrarpedido', pedidoController.save);



//socket
router.get('/socket', (req,res) => {
	 res.render('administrador/socket');
});

module.exports = router;

