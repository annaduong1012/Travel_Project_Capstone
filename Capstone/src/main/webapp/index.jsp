<%@page import="DAO.CustomerDAO"%>
<%@page import="DAO.TourGuideDAO"%>
<%@page import="entity.TourGuide"%>
<%@page import="DAO.DestinationDAO"%>
<%@page import="DAO.TourDAO"%>
<%@page import="entity.Tour"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String destinationIdString = request.getParameter("destinationId");
TourDAO tourDAO = new TourDAO();
DestinationDAO destination = new DestinationDAO();

if (destinationIdString != null) {
	int destinationId = Integer.parseInt(destinationIdString);
	pageContext.setAttribute("toursByState", tourDAO.getToursByDestination(destinationId));

} else {
	pageContext.setAttribute("popularTours", tourDAO.getPopularTours());
}

pageContext.setAttribute("destinations", destination.getAllStates());

//get tour guide details
TourGuideDAO tourGuideDAO = new TourGuideDAO();
pageContext.setAttribute("tourGuideDetails", TourGuideDAO.getTourGuide());

//get testimonial details
CustomerDAO testimonial = new CustomerDAO();
pageContext.setAttribute("testimonialDetails", CustomerDAO.getFeedback());
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>TRAVELER - Free Travel Website Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/style.css" rel="stylesheet">

<style>
h3 {
	text-align: center;
	margin-bottom: 50px;
}

.small-text {
	font-size: 10px;
}

.normal-text {
	font-size: 16px; /* Adjust the size as needed */
}
</style>
</head>

<body>
	<!-- Topbar Start -->
	<div class="container-fluid bg-light pt-3 d-none d-lg-block">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
					<div class="d-inline-flex align-items-center">
						<p>
							<i class="fa fa-envelope mr-2"></i>info@traveler.com
						</p>
						<p class="text-body px-3">|</p>
						<p>
							<i class="fa fa-phone-alt mr-2"></i>+61 345 6789
						</p>
					</div>
				</div>
				<div class="col-lg-6 text-center text-lg-right">
					<div class="d-inline-flex align-items-center">
						<a class="text-primary px-3" href=""> <i
							class="fab fa-facebook-f"></i>
						</a> <a class="text-primary px-3" href=""> <i
							class="fab fa-twitter"></i>
						</a> <a class="text-primary px-3" href=""> <i
							class="fab fa-linkedin-in"></i>
						</a> <a class="text-primary px-3" href=""> <i
							class="fab fa-instagram"></i>
						</a> <a class="text-primary pl-3" href=""> <i
							class="fab fa-youtube"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Topbar End -->


	<!-- Navbar Start -->
	<div class="container-fluid position-relative nav-bar p-0">
		<div class="container-lg position-relative p-0 px-lg-3"
			style="z-index: 9;">
			<nav
				class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
				<a href="" class="navbar-brand">
					<h1 class="m-0 text-primary">
						<span class="text-dark">TRAVEL</span>ER
					</h1>
				</a>
				<button type="button" class="navbar-toggler" data-toggle="collapse"
					data-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-between px-3"
					id="navbarCollapse">
					<div class="navbar-nav ml-auto py-0">
						<a href="index.jsp" class="nav-item nav-link active">Home</a> <a
							href="about.jsp" class="nav-item nav-link">About</a> <a
							href="service.jsp" class="nav-item nav-link">Services</a> <a
							href="package.jsp" class="nav-item nav-link">Tour Packages</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-toggle="dropdown">Destinations</a>
							<div class="dropdown-menu border-0 rounded-0 m-0">
								<c:forEach items="${destinations}" var="destination">
									<a href="tour_by_dest.jsp?destinationId=${destination.id}"
										class="dropdown-item">${destination.state}</a>
								</c:forEach>
							</div>
						</div>
						<a href="contact.jsp" class="nav-item nav-link">Contact</a>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- Navbar End -->


	<!-- Carousel Start -->
	<div class="container-fluid p-0">
		<div id="header-carousel" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="w-100" src="img/carousel-1.jpg" alt="Image">
					<div
						class="carousel-caption d-flex flex-column align-items-center justify-content-center">
						<div class="p-3" style="max-width: 900px;">
							<h4 class="text-white text-uppercase mb-md-3">Tours & Travel</h4>
							<h1 class="display-3 text-white mb-md-4">Let's Discover The
								World Together</h1>
							<a href="" class="btn btn-primary py-md-3 px-md-5 mt-2">Book
								Now</a>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="w-100" src="img/carousel-2.jpg" alt="Image">
					<div
						class="carousel-caption d-flex flex-column align-items-center justify-content-center">
						<div class="p-3" style="max-width: 900px;">
							<h4 class="text-white text-uppercase mb-md-3">Tours & Travel</h4>
							<h1 class="display-3 text-white mb-md-4">Discover Amazing
								Places With Us</h1>
							<a href="" class="btn btn-primary py-md-3 px-md-5 mt-2">Book
								Now</a>
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#header-carousel"
				data-slide="prev">
				<div class="btn btn-dark" style="width: 45px; height: 45px;">
					<span class="carousel-control-prev-icon mb-n2"></span>
				</div>
			</a> <a class="carousel-control-next" href="#header-carousel"
				data-slide="next">
				<div class="btn btn-dark" style="width: 45px; height: 45px;">
					<span class="carousel-control-next-icon mb-n2"></span>
				</div>
			</a>
		</div>
	</div>
	<!-- Carousel End -->


	<!-- Booking Start -->
	<div class="container-fluid booking mt-5 pb-5">
		<div class="container pb-5">
			<div class="bg-light shadow" style="padding: 30px;">
				<div class="row align-items-center" style="min-height: 60px;">
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-3">
								<div class="mb-3 mb-md-0">
									<select class="custom-select px-4" style="height: 47px;">
										<option selected>Destination</option>
										<option value="1">Destination 1</option>
										<option value="2">Destination 1</option>
										<option value="3">Destination 1</option>
									</select>
								</div>
							</div>
							<div class="col-md-3">
								<div class="mb-3 mb-md-0">
									<div class="date" id="date1" data-target-input="nearest">
										<input type="text"
											class="form-control p-4 datetimepicker-input"
											placeholder="Depart Date" data-target="#date1"
											data-toggle="datetimepicker" />
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="mb-3 mb-md-0">
									<div class="date" id="date2" data-target-input="nearest">
										<input type="text"
											class="form-control p-4 datetimepicker-input"
											placeholder="Return Date" data-target="#date2"
											data-toggle="datetimepicker" />
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="mb-3 mb-md-0">
									<select class="custom-select px-4" style="height: 47px;">
										<option selected>Duration</option>
										<option value="1">Duration 1</option>
										<option value="2">Duration 1</option>
										<option value="3">Duration 1</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<button class="btn btn-primary btn-block" type="submit"
							style="height: 47px; margin-top: -2px;">Submit</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Booking End -->



	<!-- Feature Start -->
	<h3>Why book with Traveler?</h3>
	<div class="container-fluid pb-5">
		<div class="container pb-5">
			<div class="row">
				<div class="col-md-4">
					<div class="d-flex mb-4 mb-lg-0">
						<div
							class="d-flex flex-shrink-0 align-items-center justify-content-center bg-primary mr-3"
							style="height: 100px; width: 100px;">
							<i class="fa fa-2x fa-money-check-alt text-white"></i>
						</div>
						<div class="d-flex flex-column">
							<h5 class="">Competitive Pricing</h5>
							<p class="m-0">Best value experiences with a price guarantee.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="d-flex mb-4 mb-lg-0">
						<div
							class="d-flex flex-shrink-0 align-items-center justify-content-center bg-primary mr-3"
							style="height: 100px; width: 100px;">
							<i class="fa fa-2x fa-award text-white"></i>
						</div>
						<div class="d-flex flex-column">
							<h5 class="">Best Services</h5>
							<p class="m-0">24/7 of support via phone or live chat.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="d-flex mb-4 mb-lg-0">
						<div
							class="d-flex flex-shrink-0 align-items-center justify-content-center bg-primary mr-3"
							style="height: 100px; width: 100px;">
							<i class="fa fa-2x fa-globe text-white"></i>
						</div>
						<div class="d-flex flex-column">
							<h5 class="">Trusted reviews</h5>
							<p class="m-0">4.3 stars from 240,000+ Worldwide reviews.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Feature End -->

	<!-- Packages Start -->
	<div class="container-fluid py-5">
		<div class="container pt-5 pb-3">
			<div class="text-center mb-3 pb-3">

				<h1>Popular Tours</h1>
			</div>
			<div class="row">
				<c:forEach items="${popularTours}" var="tour">
					<div class="col-sm-6 col-md-4 col-lg-3">
						<div class="package-item bg-white mb-2">

							<div
								class="new position-absolute top-0 start-0 translate-middle bg-primary text-white px-2 py-1">
								<span>Best Seller</span>
							</div>
							<img class="img-fluid" src="img/${tour.imgName}" alt="">
							<div class="p-4">
								<div class="d-flex justify-content-between mb-3">
									<small class="m-0"><i
										class="fa fa-map-marker-alt text-primary mr-2"></i>${tour.city}</small>

								</div>
								<a class="h6 text-decoration-none"
									href="tour_details.jsp?tourId=${tour.id}">${tour.name}</a>
								<div class="border-top mt-4 pt-4">
									<div class="d-flex justify-content-between">
										<h6 class="m-0">
											<i class="fa fa-star text-primary mr-2"></i>${tour.rating} <small>(${tour.numOfRate})</small>
										</h6>
										<h5 class="m-0">
											<span class="small-text">from</span> <span
												class="normal-text">$${tour.price}</span>
										</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

				<!-- Packages End -->




				<!-- Destination Start -->
				<div class="container-fluid py-5">
					<div class="container pt-5 pb-3">
						<div class="text-center mb-3 pb-3">
							<h6 class="text-primary text-uppercase"
								style="letter-spacing: 5px;">Destination</h6>
							<h1>Explore Top Destination</h1>
						</div>
						<div class="row">
							<div class="col-lg-4 col-md-6 mb-4">
								<div
									class="destination-item position-relative overflow-hidden mb-2">
									<img class="img-fluid" src="img/destination-1.jpg" alt="">
									<a class="destination-overlay text-white text-decoration-none"
										href="">
										<h5 class="text-white">United States</h5> <span>100
											Cities</span>
									</a>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<div
									class="destination-item position-relative overflow-hidden mb-2">
									<img class="img-fluid" src="img/destination-2.jpg" alt="">
									<a class="destination-overlay text-white text-decoration-none"
										href="">
										<h5 class="text-white">United Kingdom</h5> <span>100
											Cities</span>
									</a>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<div
									class="destination-item position-relative overflow-hidden mb-2">
									<img class="img-fluid" src="img/destination-3.jpg" alt="">
									<a class="destination-overlay text-white text-decoration-none"
										href="">
										<h5 class="text-white">Australia</h5> <span>100 Cities</span>
									</a>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<div
									class="destination-item position-relative overflow-hidden mb-2">
									<img class="img-fluid" src="img/destination-4.jpg" alt="">
									<a class="destination-overlay text-white text-decoration-none"
										href="">
										<h5 class="text-white">India</h5> <span>100 Cities</span>
									</a>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<div
									class="destination-item position-relative overflow-hidden mb-2">
									<img class="img-fluid" src="img/destination-5.jpg" alt="">
									<a class="destination-overlay text-white text-decoration-none"
										href="">
										<h5 class="text-white">South Africa</h5> <span>100
											Cities</span>
									</a>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<div
									class="destination-item position-relative overflow-hidden mb-2">
									<img class="img-fluid" src="img/destination-6.jpg" alt="">
									<a class="destination-overlay text-white text-decoration-none"
										href="">
										<h5 class="text-white">Indonesia</h5> <span>100 Cities</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Destination Start -->


				<!-- Service Start -->
				<div class="container-fluid py-5">
					<div class="container pt-5 pb-3">
						<div class="text-center mb-3 pb-3">
							<h6 class="text-primary text-uppercase"
								style="letter-spacing: 5px;">Services</h6>
							<h1>Tours & Travel Services</h1>
						</div>
						<div class="row">
							<div class="col-lg-4 col-md-6 mb-4">
								<div class="service-item bg-white text-center mb-2 py-5 px-4">
									<i class="fa fa-2x fa-route mx-auto mb-4"></i>
									<h5 class="mb-2">Travel Guide</h5>
									<p class="m-0">Justo sit justo eos amet tempor amet clita
										amet ipsum eos elitr. Amet lorem est amet labore</p>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<div class="service-item bg-white text-center mb-2 py-5 px-4">
									<i class="fa fa-2x fa-ticket-alt mx-auto mb-4"></i>
									<h5 class="mb-2">Ticket Booking</h5>
									<p class="m-0">Justo sit justo eos amet tempor amet clita
										amet ipsum eos elitr. Amet lorem est amet labore</p>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<div class="service-item bg-white text-center mb-2 py-5 px-4">
									<i class="fa fa-2x fa-hotel mx-auto mb-4"></i>
									<h5 class="mb-2">Hotel Booking</h5>
									<p class="m-0">Justo sit justo eos amet tempor amet clita
										amet ipsum eos elitr. Amet lorem est amet labore</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Service End -->



				<!-- Registration Start -->
				<div class="container-fluid bg-registration py-5"
					style="margin: 90px 0;">
					<div class="container py-5">
						<div class="row align-items-center">
							<div class="col-lg-7 mb-5 mb-lg-0">
								<div class="mb-4">
									<h6 class="text-primary text-uppercase"
										style="letter-spacing: 5px;">Mega Offer</h6>
									<h1 class="text-white">
										<span class="text-primary">30% OFF</span> For Honeymoon
									</h1>
								</div>
								<p class="text-white">Invidunt lorem justo sanctus clita.
									Erat lorem labore ea, justo dolor lorem ipsum ut sed eos, ipsum
									et dolor kasd sit ea justo. Erat justo sed sed diam. Ea et erat
									ut sed diam sea ipsum est dolor</p>
								<ul class="list-inline text-white m-0">
									<li class="py-2"><i class="fa fa-check text-primary mr-3"></i>Labore
										eos amet dolor amet diam</li>
									<li class="py-2"><i class="fa fa-check text-primary mr-3"></i>Etsea
										et sit dolor amet ipsum</li>
									<li class="py-2"><i class="fa fa-check text-primary mr-3"></i>Diam
										dolor diam elitripsum vero.</li>
								</ul>
							</div>
							<div class="col-lg-5">
								<div class="card border-0">
									<div class="card-header bg-primary text-center p-4">
										<h1 class="text-white m-0">Sign Up Now</h1>
									</div>
									<div class="card-body rounded-bottom bg-white p-5">
										<form>
											<div class="form-group">
												<input type="text" class="form-control p-4"
													placeholder="Your name" required="required" />
											</div>
											<div class="form-group">
												<input type="email" class="form-control p-4"
													placeholder="Your email" required="required" />
											</div>
											<div class="form-group">
												<select class="custom-select px-4" style="height: 47px;">
													<option selected>Select a destination</option>
													<option value="1">destination 1</option>
													<option value="2">destination 1</option>
													<option value="3">destination 1</option>
												</select>
											</div>
											<div>
												<button class="btn btn-primary btn-block py-3" type="submit">Sign
													Up Now</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Registration End -->


				<!-- Team Start -->
				<div class="container-fluid py-5">
					<div class="container pt-5 pb-3">
						<div class="text-center mb-3 pb-3">
							<h6 class="text-primary text-uppercase"
								style="letter-spacing: 5px;">Guides</h6>
							<h1>Our Travel Guides</h1>
						</div>
						<div class="row">
							<c:forEach items="${tourGuideDetails}" var="tourGuide">
								<div class="col-lg-3 col-md-4 col-sm-6 pb-2">
									<div class="team-item bg-white mb-4">
										<div class="team-img position-relative overflow-hidden">
											<img class="img-fluid w-100" src="img/${tourGuide.imgName}"
												alt="">
										</div>
										<div class="text-center py-4">
											<h5 class="text-truncate">${tourGuide.guideName}</h5>
											<p class="m-0">${tourGuide.location}</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!-- Team End -->


			<!-- Testimonial Start -->
			<div class="container-fluid py-5">
				<div class="container py-5">
					<div class="text-center mb-3 pb-3">
						<h6 class="text-primary text-uppercase"
							style="letter-spacing: 5px;">Testimonial</h6>
						<h1>What Say Our Clients</h1>
					</div>
					<div class="owl-carousel testimonial-carousel">
						<c:forEach items="${testimonialDetails}" var="testimonial">
							<div class="text-center">
								<img class="img-fluid mx-auto" src="img/${testimonial.imgName}"
									style="width: 100px; height: 100px;">
								<div class="testimonial-text bg-white p-4 mt-n5">
									<p class="mt-5">${testimonial.feedback}</p>
									<h5 class="text-truncate">${testimonial.firstName}</h5>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- Testimonial End -->

			<!-- Footer Start -->
			<div
				class="container-fluid bg-dark text-white-50 py-5 px-sm-3 px-lg-5"
				style="margin-top: 90px;">
				<div class="row pt-5">
					<div class="col-lg-3 col-md-6 mb-5">
						<a href="" class="navbar-brand">
							<h1 class="text-primary">
								<span class="text-white">TRAVEL</span>ER
							</h1>
						</a>
						<p>Embark on a journey with Traveler: where exploration meets
							comfort in historic streets and exotic coastlines. Craft your
							adventure with us!</p>
						<h6 class="text-white text-uppercase mt-4 mb-3"
							style="letter-spacing: 5px;">Follow Us</h6>
						<div class="d-flex justify-content-start">
							<a class="btn btn-outline-primary btn-square mr-2" href="#"><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-outline-primary btn-square mr-2" href="#"><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-outline-primary btn-square mr-2" href="#"><i
								class="fab fa-linkedin-in"></i></a> <a
								class="btn btn-outline-primary btn-square" href="#"><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 mb-5">
						<h5 class="text-white text-uppercase mb-4"
							style="letter-spacing: 5px;">Our Services</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-white-50 mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Destination</a> <a
								class="text-white-50 mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Services</a> <a
								class="text-white-50 mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Packages</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 mb-5">
						<h5 class="text-white text-uppercase mb-4"
							style="letter-spacing: 5px;">Usefull Links</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-white-50 mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>About</a> <a
								class="text-white-50 mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Guides</a> <a
								class="text-white-50 mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Testimonial</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 mb-5">
						<h5 class="text-white text-uppercase mb-4"
							style="letter-spacing: 5px;">Contact Us</h5>
						<p>
							<i class="fa fa-map-marker-alt mr-2"></i>123 Street, Australia
						</p>
						<p>
							<i class="fa fa-phone-alt mr-2"></i>+61 345 67890
						</p>
						<p>
							<i class="fa fa-envelope mr-2"></i>info@traveler.com
						</p>
						<h6 class="text-white text-uppercase mt-4 mb-3"
							style="letter-spacing: 5px;">Newsletter</h6>
						<div class="w-100">
							<div class="input-group">
								<input type="text" class="form-control border-light"
									style="padding: 25px;" placeholder="Your Email">
								<div class="input-group-append">
									<button class="btn btn-primary px-3">Sign Up</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div
				class="container-fluid bg-dark text-white border-top py-4 px-sm-3 px-md-5"
				style="border-color: rgba(256, 256, 256, .1) !important;">
				<div class="row">
					<div class="col-lg-6 text-center text-md-left mb-3 mb-md-0">
						<p class="m-0 text-white-50">Project by A&U</p>
					</div>
					<div class="col-lg-6 text-center text-md-right">
						<p class="m-0 text-white-50">
							Template Designed by <a href="https://htmlcodex.com">HTML
								Codex</a>
						</p>
					</div>
				</div>
			</div>
			<!-- Footer End -->


			<!-- Back to Top -->
			<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
				class="fa fa-angle-double-up"></i></a>


			<!-- JavaScript Libraries -->
			<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
			<script src="lib/easing/easing.min.js"></script>
			<script src="lib/owlcarousel/owl.carousel.min.js"></script>
			<script src="lib/tempusdominus/js/moment.min.js"></script>
			<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
			<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

			<!-- Contact Javascript File -->
			<script src="mail/jqBootstrapValidation.min.js"></script>
			<script src="mail/contact.js"></script>

			<!-- Template Javascript -->
			<script src="js/main.js"></script>
</body>

</html>