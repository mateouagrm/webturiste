
$('#agregarVehiculo').on("click", function(){
	$(".seleccionarConductor").html("");
	 $.get("/obtenerConductor", function(conductor){
        conductor.forEach(funcionForEach);
        function funcionForEach(item, index){
	        $(".seleccionarConductor").append(
    			'<option value="'+item["id"]+'">'+item["nombre"]+" - "+ item["id"] +'</option>'
    		)
	    }
      });
})
