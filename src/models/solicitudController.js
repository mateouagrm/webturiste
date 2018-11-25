const controller = {};

controller.total = (req,res) => {
	const estado = req.body.estado;
	//console.log(estado);
	req.getConnection((err,conn) => {
		conn.query('SELECT COUNT(*) as cantidad FROM `solicitud` WHERE solicitud.estado= ?',[estado],(err,rows) => {
			if (err) {
				res.json(err);
			}
			res.json(rows);

		})
	})
};



controller.atender = (req,res) => {
	req.getConnection((err,conn) => {
		conn.query('select * from solicitud',(err,rows) => {
			if (err) {
				res.json(err);
			}
			res.render('administrador/solicitudPedido',{
				data: rows
			});
		})
	})
};

controller.atenderPedido = (req,res) => {
	const id = req.params.id;
	req.getConnection((err,conn) => {
		conn.query("SELECT s.id,s.fecha,s.hora,s.lat_origen,s.lon_origen,s.lat_destino,s.lon_destino,s.estado,u.email FROM solicitud as s INNER join usuario as u on s.id_cliente=u.id WHERE u.tipoCliente='si' and s.id= ?",[id],(err,data) => {
			if (err) {
				res.json(err);
			}
			res.render('administrador/atenderPedido',{
				data: data[0]
			});
		})
	})
};



controller.finalizar = (req,res) => {
	var id_solicitud = req.body.id_solicitud;
	var data = {
            estado    : req.body.estado
        };
	req.getConnection((err,conn) => {
		conn.query("update solicitud set ? WHERE id = ?",[data,id_solicitud],(err,rows) => {
			if (err) {
				res.json({
		          	status: 'false',
		          	msg: 'Error al guardar los cambios'
		        });
			}
				res.json({
		          	status: 'true',
		          	msg: 'Datos Cambiado correctamente'
		        });
		})
	})
};



controller.obtenerIdAuto = (req,res) => {
	const id = req.params.idConductor;
	req.getConnection((err,conn) => {
		conn.query("SELECT * FROM vehiculo as v WHERE v.id_conductor= ?",[id],(err,data) => {
			if (err) {
				res.json(err);
			}
			res.json(data[0]);
		})
	})
};


module.exports = controller
