/*=============================================
CARRUSEL
=============================================*/

$(".flexslider").flexslider({

	animation: "slide",
    controlNav: true,
    animationLoop: false,
    slideshow: false,
    itemWidth: 100,
    itemMargin: 5

});
$(".flexslider ul li img").click(function(){

	var capturaIndice = $(this).attr("value");

	$(".infoproducto figure.visor img").hide();

	$("#lupa"+capturaIndice).show();
})


