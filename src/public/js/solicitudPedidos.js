/*=============================================
ACTUALIZAR NOTIFICACIONES
=============================================*/
var cantidadNotificacion=0;
$(".actualizarNotificaciones").click(this.notificacion2())

function notificacion2(){
  var datos = new FormData();
  datos.append("estado", "enviado" );

    $.ajax({
       url:"/solicitudTotal",
       method: "POST",
      data: datos,
      cache: false,
        contentType: false,
        processData: false,
        success: function(respuesta){
            console.log(respuesta[0].cantidad);     
            $(".sumaCesta").html(respuesta[0].cantidad);
              cantidadNotificacion=respuesta[0].cantidad; 
         }

    })
}


function notificacion(){
  var datos = new FormData();
  datos.append("estado", "enviado" );

    $.ajax({
       url:"/solicitudTotal",
       method: "POST",
      data: datos,
      cache: false,
        contentType: false,
        processData: false,
        success: function(respuesta){
            console.log(respuesta[0].cantidad);     
            $(".sumaCesta").html(respuesta[0].cantidad);
            notificar(respuesta[0].cantidad);
         }

    })
}

 var myVar = setInterval(notificacion, 4000);
  /*
  function time(){
    setInterval(this.notificacion, 4000);
    }
*/
document.addEventListener("DOMContentLoaded",function(){
  if (!Notification) {
        alert("no acepta notificacion");
         return;
  } 
  if(Notification.permission !== "granted"){
   Notification.requestPermission();
  }
});
    function notificar(cantidad){
       if (cantidadNotificacion<cantidad) {
        cantidadNotificacion=cantidad;
            if (Notification.permission !== "granted") {
              Notification.requestPermission();
            }else{
              var notificacion = new Notification("titulo de mi notificacion,",
              {
                icon:"https://blog.aulaformativa.com/wp-content/uploads/2017/02/principales-usos-de-los-iconos-diseno-web-explicar-beneficios-servicios.jpg",
                body:"contenido de la notificacion"
              }
              );
            }
       }
    }