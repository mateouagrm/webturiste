const controller = {};
var Kairos = require('./TestKairos');

controller.users = (req, res) =>{
  req.getConnection((err, conn) =>{
       conn.query('select * from usuario where tipoCliente="si" order by id', (err, data) =>{
          console.log(data);
          if (err) {
             res.json(err);
          }else{
            res.status(200).json(data);
          }
       });
  });
};

controller.insertUsersCliente = (req, res) =>{
    const userData = {
      id: null,
      ci: 0,
      nombre: 'null',
      apellido: 'null',
      telefono: 'null',
      direccion: 'null',
      foto: 'null',
      email: req.body.email,
      password: req.body.password,
      tipoCliente: 'si',
      tipoConductor: 'no'
     };
   req.getConnection((err, conn) => {
    conn.query('insert into usuario set ?', [userData], (err, data) =>{
      console.log(data);
        if (data && data.insertId) {
        console.log(data);
          res.json({
            status: 'true',
            msg: 'insertado correctamente',
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

};

controller.ingresar = (req, res) =>{
    const userData = {
      email: req.body.email,
      password: req.body.password
     };
  req.getConnection((err, conn) => {
    conn.query('select * from usuario where email=? and password=? and tipoCliente="si"', [userData.email,userData.password], (err, data) =>{
          console.log(data);
          if (err) {
             res.json(err);
          }else{
           if (Object.entries(data).length === 0) {
              res.json({
              status: 'false',
              msg: 'email o contraseña incorrectos'
            });
           }else{
              res.json({
              status: 'true',
              msg: 'ok',
              data: data
            })
           }
           
          }
    });
   });

};

controller.ingresarConductor = (req, res) =>{
    const userData = {
      email: req.body.email,
      password: req.body.password
     };
  req.getConnection((err, conn) => {
    conn.query('select * from usuario where email=? and password=? and tipoConductor="si"', [userData.email,userData.password], (err, data) =>{
          console.log(data);
          if (err) {
             res.json(err);
          }else{
           if (Object.entries(data).length === 0) {
              res.json({
              status: 'false',
              msg: 'email o contraseña incorrectos'
            });
           }else{
              res.json({
              status: 'true',
              msg: 'ok',
              data: data
            })
           }
           
          }
    });
   });

};


controller.pedirMovil = (req, res) =>{
    const userData = {
      id: null,
      fecha: req.body.fecha,
      hora: req.body.hora,
      lat_origen: req.body.lat_origen,
      lon_origen: req.body.lon_origen,
      lat_destino: req.body.lat_destino,
      lon_destino: req.body.lon_destino,
      estado: req.body.estado,
      id_cliente: req.body.id_cliente,
      notificar: "null"
     };
   req.getConnection((err, conn) => {
    conn.query('insert into solicitud set ?', [userData], (err, data) =>{
      console.log(data);
        if (data && data.insertId) {
        console.log(data);
          res.json({
            status: 'true',
            msg: 'insertado correctamente',
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

};


controller.pedirMovilId = (req, res) =>{
   const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query('select * from solicitud where id_cliente=? and (estado="enviado" or estado="aceptado")', [id], (err, data) =>{
          console.log(data);
          if (err) {
             res.json(err);
          }else{
           if (Object.entries(data).length === 0) {
              res.json({
              status: 'true',
              msg: 'correcto'
            });
           }else{
              res.json({
              status: 'false',
              msg: 'ya ha enviado una solicitud "revise pedidos en procesos si su servicio ha sido aceptado"'
            });
           }
           
          }
    });
   });

};

controller.pedidoEnProceso = (req, res) =>{
   const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query('select * from solicitud where id_cliente=? and estado="aceptado"', [id], (err, data) =>{
          console.log(data);
          if (err) {
             res.json(err);
          }else{
           if (Object.entries(data).length === 0) {
              res.json({
              status: 'false',
              msg: 'debe solicitar un servicio primero'
            });
           }else{
              res.json({
              status: 'true',
              msg: 'tiene pedidos en proceso'
            });
           }
           
          }
    });
   });

};

controller.pedidoEnProcesoConductor = (req, res) =>{
   const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query('select * from pedido where id_conductor=? and estado="proceso"', [id], (err, data) =>{
          console.log(data);
          if (err) {
             res.json(err);
          }else{
           if (Object.entries(data).length === 0) {
              res.json({
              status: 'false',
              msg: 'no tiene pedido en proceso'
            });
           }else{
              res.json({
              status: 'true',
              msg: data
            });
           }
           
          }
    });
   });

};


controller.compararImagen = (req, res) =>{
    //var img='https://ep01.epimg.net/verne/imagenes/2018/03/16/mexico/1521160950_066364_1521240456_noticia_normal.jpg';
     const data = {
      id: req.body.idConductor,
      imagen: req.body.imagen
     };
     Kairos.comparar_imagenes(data.imagen, data.id , (data)=>{
            if (typeof(data.body.Errors) === "undefined") {
              if(data.body.images[0].transaction.confidence> 0.6){
                  res.json({
                  status: 'true',
                   msg: 'reconocimiento existoso'
                  });
              }else{
                 res.json({
                   status: 'false',
                   msg: 'no pertenece a la credencial'
                 });
              }
            }else{
                res.json({
                   status: 'false',
                   msg: data.body.Errors[0].Message
                });
            }
        });
 
};

controller.verificarImagen = (req, res) => {
     //var img='https://ep01.epimg.net/verne/imagenes/2018/03/16/mexico/1521160950_066364_1521240456_noticia_normal.jpg';
     const data = {
      imagen: req.body.imagen
     };
     
     Kairos.detectar_atributo_de_imagen(data.imagen , data=>{
        if (data) {
          res.json({
            status: 'true',
            msg: 'foto con buena calidad'
            });
        }else{
          res.json({
            status: 'false',
            msg: 'foto con baja calidad'
          });
        }
     });
    
};

controller.notificarPedido = (req, res) =>{
   const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query('select * from solicitud where id_cliente=? and estado="aceptado" and notificar="no"', [id], (err, data) =>{
          console.log(data);
          if (err) {
             res.json(err);
          }else{

           if (Object.entries(data).length === 0) {
              res.json({
              status: 'false',
              msg: data
              });
           }else{
              //console.log(data[0].id);
              actualizarNotificacion(req,res,data[0].id,respuesta =>{
                if (respuesta) {
                 res.json({
                 status: 'true',
                 msg: data
                 });
                }
              });
           }
           
          }
    });
   });
};

actualizarNotificacion = (req, res,id,callback) => {
   console.log(id);
   req.getConnection((err, conn) => {
    conn.query("update solicitud set notificar='si' where id = ?", [id], (err, data) =>{
       if (err) {
         callback(false);
       }else{
        callback(true);
       }
    });
   });
}


module.exports = controller


