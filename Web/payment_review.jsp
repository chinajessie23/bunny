<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
   <%@ taglib prefix="s" uri="/struts-tags" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<head>
	<title>Hoticket | Welcome...</title>

	<!-- Meta -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Favicon -->
	<link rel="shortcut icon" href="favicon.ico">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600,700' rel='stylesheet' type='text/css'>
	<!-- CSS Global Compulsory -->
	<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/style.css">

	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
	<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/plugins/flexslider/flexslider.css">  
	<link rel="stylesheet" href="assets/plugins/parallax-slider/css/parallax-slider.css">

	    <!-- CSS Page Style -->    
    <link rel="stylesheet" href="assets/css/pages/page_log_reg_v2.css">    

	<!-- CSS Theme -->    
	<link rel="stylesheet" href="assets/css/theme-colors/dark-red.css">

	<!-- CSS Customization -->
	<link rel="stylesheet" href="assets/css/custom.css">
		<!-- Owl Carousel Assets -->
	<link href="owl-carousel/owl.carousel.css" rel="stylesheet">
	<link href="owl-carousel/owl.theme.css" rel="stylesheet">
		

	<!-- Prettify -->
	<link href="assets/js/google-code-prettify/prettify.css" rel="stylesheet">


</head>	

<body>
<div class="wrapper">
	 <%@ include file="header.jsp" %>
		 <!--/container-->
			<div class="container content">	
		 		<div id = "ticketInfoHeader">
		 			<div class="headline row">
		 				<div class = "col-md-4"><h2>CHECKOUT</h2></div>
		 				<div class = "col-md-6">
		 				<a href="ticketInfo.jsp" class= "btn btn-default disabled">Tickets</a><div class="glyphicon glyphicon-arrow-right"></div>
                        <a href="user_payment.jsp" class= "btn btn-default disabled">Payment</a><div class="glyphicon glyphicon-arrow-right"></div>
		 				<div class= "btn btn-default">Confirmation</div>
		 			    </div>
		 			</div>
		 			<div class="ticketBody row">
                      <div class="row">Theatre Info:</div>
                      <div class="row"><s:property value="#session.showing.theatre.name"/></div>
                      <div class="row"><s:property value="#session.showing.theatre.address"/></div>
                      <div class="row"><s:property value="#session.showing.theatre.city"/>,<s:property value="#session.showing.theatre.state"/>,<s:property value="#session.showing.theatre.zipcode"/></div>
		 			  <br>
		 			  <div class="row">Movie Info:</div>
                      <div class="row"><s:property value="#session.showing.movie.name"/></div>
                      <div class="row"><s:property value="#session.showing.date"/><s:property value="#session.showing.start_time"/></div>
                      <br>
                      <div class="row">Ticket Info:</div>
                      <div class="row">Adult: <s:property value="#session.adult"/> * <s:property value="#session.ticket_price"/></div>
                      <div class="row">Child: <s:property value="#session.child"/> * <s:property value="#session.ticket_price*0.8"/></div>
                      <div class="row">Senior: <s:property value="#session.senior"/> * <s:property value="#session.ticket_price*0.8"/></div>
                      <div class="row">Total price: <s:property value="#session.ticket_price * #session.adult+#session.ticket_price*0.8 * #session.adult+#session.ticket_price * #session.adult*0.8" /></div>
                      <form action = "pconfirm">
                      	<input type="hidden" name="totalprice" value="<s:property value="#session.ticket_price * #session.adult+#session.ticket_price*0.8 * #session.adult+#session.ticket_price * #session.adult*0.8" />">
                      	<button type="submit" onclick="return confirm('Are you sure you want to purchase the ticket?');"
                                                 class="btn btn-info">Purchase</button>
                      </form>
		 			</div>
		 		</div>
		 	</div>	
		<!-- End Content Part -->
	</div><!--/wrapper-->
	<!--end of sign up modal-->
	<%@ include file="footer.jsp" %>


<!-- JS Global Compulsory -->			
<script type="text/javascript" src="assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- JS Implementing Plugins -->
<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="assets/plugins/flexslider/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="assets/plugins/parallax-slider/js/modernizr.js"></script>
<script type="text/javascript" src="assets/plugins/parallax-slider/js/jquery.cslider.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/plugins/parallax-slider.js"></script>


	<script src="owl-carousel/owl.carousel.js"></script>
	   <script src="assets/js/bootstrap-collapse.js"></script>
	<script src="assets/js/bootstrap-transition.js"></script>
	<script src="assets/js/bootstrap-tab.js"></script>

	<script src="assets/js/google-code-prettify/prettify.js"></script>
	  <script src="assets/js/application.js"></script>
<script type="text/javascript">
	//sliders starter
	jQuery(document).ready(function() {
		App.init();
		App.initSliders();      
		ParallaxSlider.initParallaxSlider();
	});
	   $(document).ready(function() {
	   	//owl-demo starter
	  $("#owl-demo").owlCarousel({
		items : 8,
		lazyLoad : true,
	 autoPlay: 2000,
	   stopOnHover: true
	  });
	});
	       
</script>
	<s:if test="#session.loginError== 1"> 
		<script>
		$('#login').modal('show');
		</script>
	</s:if>
		<s:if test="#session.loginError== 1"> 
		<s:set name="loginError" value="2" scope="session" />
		</s:if>
	<s:if test="#session.registerError== 1"> 
		<script>
		$('#signUp').modal('show');
		</script>
	</s:if>
	<s:if test="#session.registerError== 1"> 
		<s:set name="registerError" value="2" scope="session" />
		</s:if>

<!--[if lt IE 9]>
	<script src="assets/plugins/respond.js"></script>
	<script src="assets/plugins/html5shiv.js"></script>
	<script src="assets/js/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>