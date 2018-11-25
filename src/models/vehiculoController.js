const controller = {};
var Kairos = require('./TestKairos');


controller.index = (req, res, next) => {
  req.getConnection((err,conn) => {
    conn.query("SELECT * FROM vehiculo",(err,rows) => {
      if (err) {
        res.json(err);
      }
      res.render('administrador/crudVehiculo',{
        data: rows
      });
    })
  })
}



controller.postRegistrar = (req, res, next) => {
  let fotoVehiculo = req.files.foto;  
  fotoVehiculo.mv(`src/public/img/vehiculo/${fotoVehiculo.name}`,(err) => {
        if(err){
          return res.status(500).send({ message : err })
        }
  })
  
        let imagen = 'https://www.abc.es/media/estilo/2017/02/08/cara-kwm-U202521250342CmC-620x650@abc.jpg'
        Kairos.detectar_atributo_de_imagen(imagen,(data)=>{
            if (data) {
                      postRegistrarConductor(req,res,fotoVehiculo,id_conductor => {
                        Kairos.registrar_imagen(imagen,id_conductor,(e)=>{
                          console.log(e)
                        })
                      });
              res.redirect('/gestionarConductor');
            }else{
              console.log("imagen  incorrecto") 
              res.redirect('/gestionarConductor');
            }
        })
}

/*=====================================================
REGITRO DE CONDUCTOR
======================================================*/
 postRegistrarConductor = (req, res, fotoConductor,callback) => {
      const userData = {
      id: null,
      ci: req.body.ci,
      nombre: req.body.nombre,
      apellido: req.body.apellido,
      telefono: req.body.telefono,
      direccion: req.body.direccion,
      foto: fotoConductor,
      email: req.body.email,
      password: req.body.ci,
      tipoCliente: 'no',
      tipoConductor: 'si'
     };
      req.getConnection((err, conn) => {
    conn.query('insert into usuario set ?', [userData], (err, data) =>{
        if (data && data.insertId) {
            callback(data.insertId);
     	}else{
           callback(err);
     	}
    });
   });
}


/*=====================================================
REGITRO DE AUTO
======================================================*/
postRegistrarAuto = (req, res, id,fotoVehiculo) => {
	const autoData = {
			      id: null,
			      placa: req.body.placa,
			      ruat: req.body.ruat,
			      modelo: req.body.modelo,
			      marca: req.body.marca,
			      color: req.body.color,
			      foto: fotoVehiculo,
			      id_conductor: id 
			     };   
      req.getConnection((err, conn) => {
    conn.query('insert into vehiculo set ?', [autoData], (err, data) =>{
      console.log(data);
        if (data && data.insertId) {
        console.log(data);
     	res.json({
          	status: true,
          	msg: 'success',
          	data: data
          })		
			
     	}else{
          res.json({
          	status: false,
          	msg: 'error',
          	data: err
          })
     	}
    });
   });
}



controller.listaConductor = (req, res) => {
  req.getConnection((err,conn) => {
    conn.query("SELECT * FROM usuario as u where u.id  not in( SELECT v.id_conductor from vehiculo as v )",(err,conductor) => {
      if (err) {
        res.json(err);
      }
      res.json(conductor);
    })
  })
}



module.exports = controller


