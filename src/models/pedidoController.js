const controller = {};

controller.save = (req,res) => {
	const data = req.body;
	const id_solicitud = req.body.id_solicitud;
  req.getConnection((err,conn) => {
		conn.query('INSERT INTO pedido set ?', data, (err, rows) =>{
			if (err) {
       	  	 res.json(err);
       	  }
       	  actualizarSolicitud(req,res,id_solicitud, (e) => {
       	  		if (e) {
       	  			res.redirect('solicitud');	
       	  		}else{
       	  			res.redirect('solicitud');
       	  		}
       	  })	
		})
	})
};

 actualizarSolicitud=(req, res, id, callback) => {
	var data = {
            estado    : "aceptado",
            notificar : "no"
        };
	req.getConnection((err,conn)=>{
		conn.query("update solicitud  set ? WHERE id = ?", [data,id], (err, rows) => {
      		if (err) {
      			console.log("err")
       	  	 callback(false)
       	  }
       	  callback(true)
		})
	})	
}

module.exports = controller
