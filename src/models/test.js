var Kairos = require('./TestKairos');

// Comprobamos que las instancias funcionan correctamente
//console.log(kairos instanceof Kairos);      // devuelve true

//console.log(Kairos.detectar_atributo_de_imagen('https://www.abc.es/media/estilo/2017/02/08/cara-kwm-U202521250342CmC-620x650@abc.jpg'))
let imagen = 'https://www.abc.es/media/estilo/2017/02/08/cara-kwm-U202521250342CmC-620x650@abc.jpg'
        Kairos.comparar_imagenes(imagen,63,(data)=>{
        	console.log(data.body.images[0].transaction.confidence)       
        })


/*Kairos.listaGaleria(e=>{
	console.log(e.body)
})*/
/*
Kairos.temasGaleria(e=>{
	console.log(e.body)
})*/
