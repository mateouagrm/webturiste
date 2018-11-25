$(document).ready(function(){
   $("#input1").mouseover(function(event){
      $("#dlabel").addClass("focused");
   });
   $("#input1").mouseout(function(event){
	var d =	$("#input1").val().length
	   	if (d==0) {
			$("#dlabel").removeClass("focused");	   		
	   	}
   	
   	
      
   });
});