const controller = {};

//var Kairos = require('kairos-api');
var Kairos = require('./Kairos/Kairos');
var client = new Kairos('8f58662e', '6dd8c10088b528b5de683ba616845b69');

/*======================================================
METODO PARA DETECTAR SI ES UNA IMAGEN VALIDA PARA KAIRO
DEVUELVE ATRIBUTOS DE UNA IMAGEN
======================================================*/
controller.detectar_atributo_de_imagen = (imagen,callback)=> {
	var params = {
  		image: imagen
	};	
	console.log(params)
	client.detect(params)
	.then((data)=>{
		if (typeof(data.body.Errors) === "undefined") {
			callback(true);
		}else{
			callback(false);
		}
	})
	.catch((e)=>{
	callback(e);
})
}
/*======================================================
METODO PARA REGISTRAR UNA IMAGEN EN KAIRO
======================================================*/
controller.registrar_imagen = (imagen,subject_id,callback)=> {
	var params = {
	  image: imagen,
	  subject_id: subject_id.toString(),
	  gallery_name: 'users'
	};	
	console.log(params)
	client.enroll(params)
	.then((data)=>{
		callback(data);
	})
	.catch((e)=>{
	callback(e);
})
}

/*======================================================
METODO PARA COMPARAR 2 IMAGENES
======================================================*/
controller.comparar_imagenes = (imagen,subject_id,callback)=> {
	var params = {
	  image: imagen,
	  subject_id: subject_id.toString(),
	  gallery_name: 'users'
	};	
	console.log(params)
	client.verify(params)
	.then((data)=>{
		callback(data);
	})
	.catch((e)=>{
	callback(e);
})
}

/*======================================================
METODO PARA OBTENER LISTA DE GALERIA
======================================================*/
controller.listaGaleria = (callback)=> {
	client.galleryListAll()
	.then((data)=>{
		callback(data)
	})
	.catch((e)=>{
		callback(e)
	})	
}
/*======================================================
METODO PARA VER LOS TEMAS DE 1 GALERIA
======================================================*/
controller.temasGaleria = (callback)=> {
	var params = {
	  gallery_name: 'users'
	};
	client.galleryView(params)
	.then((data)=>{
		callback(data)
	})
	.catch((e)=>{
		callback(e)
	})	
}





/*
var Kairos = require('kairos-api');
var client = new Kairos('8f58662e', '6dd8c10088b528b5de683ba616845b69');

client.galleryListAll()
.then((s)=>{
	console.log(s)
})
.catch((e)=>{
	console.log(e)
})

*/
/*

var params = {
  image: 'http://media.kairos.com/kairos-elizabeth.jpg',
  subject_id: 'subtest1',
  gallery_name: 'gallerytest1',
  selector: 'SETPOSE'
};

client.enroll(params)
client.recognize(params)
client.detect(params)
client.galleryListAll()
client.galleryView(params)
client.galleryRemove(params)
client.galleryRemoveSubject(params)
*/
module.exports = controller