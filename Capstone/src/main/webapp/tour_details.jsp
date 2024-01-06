<%@page import="DAO.DestinationDAO"%>
<%@page import="entity.Destination"%>
<%@page import="DAO.TourDAO"%>
<%@page import="entity.Tour"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String tourIdString = request.getParameter("tourId");
int tourId = Integer.parseInt(tourIdString);
TourDAO tourDAO = new TourDAO();
pageContext.setAttribute("tour", tourDAO.getTourById(tourId));

DestinationDAO destination = new DestinationDAO();
String destinationIdString = request.getParameter("destinationId");

if (destinationIdString != null) {
	int destinationId = Integer.parseInt(destinationIdString);
	pageContext.setAttribute("toursByState", tourDAO.getToursByDestination(destinationId));

} else {
	pageContext.setAttribute("popularTours", tourDAO.getPopularTours());
}

pageContext.setAttribute("destinations", destination.getAllStates());
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
							<i class="fa fa-phone-alt mr-2"></i>+64 345 6789
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





	<!-- Packages Start -->
	<div class="container-fluid py-5">
		<div class="container pt-5 pb-3">
			<div class="text-center mb-3 pb-3">

				<h1>${tour.name}</h1>
			</div>
			<div class="row">

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
							<a class="h6 text-decoration-none" href="">${tour.name}</a>
							<div class="border-top mt-4 pt-4">
								<div class="d-flex justify-content-between">
									<h6 class="m-0">
										<i class="fa fa-star text-primary mr-2"></i>${tour.rating} <small>(${tour.numOfRate})</small>
									</h6>
									<h5 class="m-0">
										<span class="small-text">from</span> <span class="normal-text">$${tour.price}</span>
									</h5>
								</div>
							</div>
						</div>
					</div>
				</div>


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
							<div class="col-lg-3 col-md-4 col-sm-6 pb-2">
								<div class="team-item bg-white mb-4">
									<div class="team-img position-relative overflow-hidden">
										<img class="img-fluid w-100" src="img/team-1.jpg" alt="">
										<div class="team-social">
											<a class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-twitter"></i></a> <a
												class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-facebook-f"></i></a> <a
												class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-instagram"></i></a> <a
												class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-linkedin-in"></i></a>
										</div>
									</div>
									<div class="text-center py-4">
										<h5 class="text-truncate">Guide Name</h5>
										<p class="m-0">Designation</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-4 col-sm-6 pb-2">
								<div class="team-item bg-white mb-4">
									<div class="team-img position-relative overflow-hidden">
										<img class="img-fluid w-100" src="img/team-2.jpg" alt="">
										<div class="team-social">
											<a class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-twitter"></i></a> <a
												class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-facebook-f"></i></a> <a
												class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-instagram"></i></a> <a
												class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-linkedin-in"></i></a>
										</div>
									</div>
									<div class="text-center py-4">
										<h5 class="text-truncate">Guide Name</h5>
										<p class="m-0">Designation</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-4 col-sm-6 pb-2">
								<div class="team-item bg-white mb-4">
									<div class="team-img position-relative overflow-hidden">
										<img class="img-fluid w-100" src="img/team-3.jpg" alt="">
										<div class="team-social">
											<a class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-twitter"></i></a> <a
												class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-facebook-f"></i></a> <a
												class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-instagram"></i></a> <a
												class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-linkedin-in"></i></a>
										</div>
									</div>
									<div class="text-center py-4">
										<h5 class="text-truncate">Guide Name</h5>
										<p class="m-0">Designation</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-4 col-sm-6 pb-2">
								<div class="team-item bg-white mb-4">
									<div class="team-img position-relative overflow-hidden">
										<img class="img-fluid w-100" src="img/team-4.jpg" alt="">
										<div class="team-social">
											<a class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-twitter"></i></a> <a
												class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-facebook-f"></i></a> <a
												class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-instagram"></i></a> <a
												class="btn btn-outline-primary btn-square" href=""><i
												class="fab fa-linkedin-in"></i></a>
										</div>
									</div>
									<div class="text-center py-4">
										<h5 class="text-truncate">Guide Name</h5>
										<p class="m-0">Designation</p>
									</div>
								</div>
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
							<div class="text-center pb-4">
								<img class="img-fluid mx-auto" src="img/testimonial-1.jpg"
									style="width: 100px; height: 100px;">
								<div class="testimonial-text bg-white p-4 mt-n5">
									<p class="mt-5">Dolor et eos labore, stet justo sed est
										sed. Diam sed sed dolor stet amet eirmod eos labore diam</p>
									<h5 class="text-truncate">Client Name</h5>
									<span>Profession</span>
								</div>
							</div>
							<div class="text-center">
								<img class="img-fluid mx-auto" src="img/testimonial-2.jpg"
									style="width: 100px; height: 100px;">
								<div class="testimonial-text bg-white p-4 mt-n5">
									<p class="mt-5">Dolor et eos labore, stet justo sed est
										sed. Diam sed sed dolor stet amet eirmod eos labore diam</p>
									<h5 class="text-truncate">Client Name</h5>
									<span>Profession</span>
								</div>
							</div>
							<div class="text-center">
								<img class="img-fluid mx-auto" src="img/testimonial-3.jpg"
									style="width: 100px; height: 100px;">
								<div class="testimonial-text bg-white p-4 mt-n5">
									<p class="mt-5">Dolor et eos labore, stet justo sed est
										sed. Diam sed sed dolor stet amet eirmod eos labore diam</p>
									<h5 class="text-truncate">Client Name</h5>
									<span>Profession</span>
								</div>
							</div>
							<div class="text-center">
								<img class="img-fluid mx-auto" src="img/testimonial-4.jpg"
									style="width: 100px; height: 100px;">
								<div class="testimonial-text bg-white p-4 mt-n5">
									<p class="mt-5">Dolor et eos labore, stet justo sed est
										sed. Diam sed sed dolor stet amet eirmod eos labore diam</p>
									<h5 class="text-truncate">Client Name</h5>
									<span>Profession</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Testimonial End -->


				<!-- Blog Start -->
				<div class="container-fluid py-5">
					<div class="container pt-5 pb-3">
						<div class="text-center mb-3 pb-3">
							<h6 class="text-primary text-uppercase"
								style="letter-spacing: 5px;">Our Blog</h6>
							<h1>Latest From Our Blog</h1>
						</div>
						<div class="row pb-3">
							<div class="col-lg-4 col-md-6 mb-4 pb-2">
								<div class="blog-item">
									<div class="position-relative">
										<img class="img-fluid w-100" src="img/blog-1.jpg" alt="">
										<div class="blog-date">
											<h6 class="font-weight-bold mb-n1">01</h6>
											<small class="text-white text-uppercase">Jan</small>
										</div>
									</div>
									<div class="bg-white p-4">
										<div class="d-flex mb-2">
											<a class="text-primary text-uppercase text-decoration-none"
												href="">Admin</a> <span class="text-primary px-2">|</span> <a
												class="text-primary text-uppercase text-decoration-none"
												href="">Tours & Travel</a>
										</div>
										<a class="h5 m-0 text-decoration-none" href="">Dolor justo
											sea kasd lorem clita justo diam amet</a>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 mb-4 pb-2">
								<div class="blog-item">
									<div class="position-relative">
										<img class="img-fluid w-100" src="img/blog-2.jpg" alt="">
										<div class="blog-date">
											<h6 class="font-weight-bold mb-n1">01</h6>
											<small class="text-white text-uppercase">Jan</small>
										</div>
									</div>
									<div class="bg-white p-4">
										<div class="d-flex mb-2">
											<a class="text-primary text-uppercase text-decoration-none"
												href="">Admin</a> <span class="text-primary px-2">|</span> <a
												class="text-primary text-uppercase text-decoration-none"
												href="">Tours & Travel</a>
										</div>
										<a class="h5 m-0 text-decoration-none" href="">Dolor justo
											sea kasd lorem clita justo diam amet</a>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 mb-4 pb-2">
								<div class="blog-item">
									<div class="position-relative">
										<img class="img-fluid w-100" src="img/blog-3.jpg" alt="">
										<div class="blog-date">
											<h6 class="font-weight-bold mb-n1">01</h6>
											<small class="text-white text-uppercase">Jan</small>
										</div>
									</div>
									<div class="bg-white p-4">
										<div class="d-flex mb-2">
											<a class="text-primary text-uppercase text-decoration-none"
												href="">Admin</a> <span class="text-primary px-2">|</span> <a
												class="text-primary text-uppercase text-decoration-none"
												href="">Tours & Travel</a>
										</div>
										<a class="h5 m-0 text-decoration-none" href="">Dolor justo
											sea kasd lorem clita justo diam amet</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Blog End -->


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
							<p>Sed ipsum clita tempor ipsum ipsum amet sit ipsum lorem
								amet labore rebum lorem ipsum dolor. No sed vero lorem dolor
								dolor</p>
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
									class="fa fa-angle-right mr-2"></i>About</a> <a
									class="text-white-50 mb-2" href="#"><i
									class="fa fa-angle-right mr-2"></i>Destination</a> <a
									class="text-white-50 mb-2" href="#"><i
									class="fa fa-angle-right mr-2"></i>Services</a> <a
									class="text-white-50 mb-2" href="#"><i
									class="fa fa-angle-right mr-2"></i>Packages</a> <a
									class="text-white-50 mb-2" href="#"><i
									class="fa fa-angle-right mr-2"></i>Guides</a> <a
									class="text-white-50 mb-2" href="#"><i
									class="fa fa-angle-right mr-2"></i>Testimonial</a> <a
									class="text-white-50" href="#"><i
									class="fa fa-angle-right mr-2"></i>Blog</a>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 mb-5">
							<h5 class="text-white text-uppercase mb-4"
								style="letter-spacing: 5px;">Usefull Links</h5>
							<div class="d-flex flex-column justify-content-start">
								<a class="text-white-50 mb-2" href="#"><i
									class="fa fa-angle-right mr-2"></i>About</a> <a
									class="text-white-50 mb-2" href="#"><i
									class="fa fa-angle-right mr-2"></i>Destination</a> <a
									class="text-white-50 mb-2" href="#"><i
									class="fa fa-angle-right mr-2"></i>Services</a> <a
									class="text-white-50 mb-2" href="#"><i
									class="fa fa-angle-right mr-2"></i>Packages</a> <a
									class="text-white-50 mb-2" href="#"><i
									class="fa fa-angle-right mr-2"></i>Guides</a> <a
									class="text-white-50 mb-2" href="#"><i
									class="fa fa-angle-right mr-2"></i>Testimonial</a> <a
									class="text-white-50" href="#"><i
									class="fa fa-angle-right mr-2"></i>Blog</a>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 mb-5">
							<h5 class="text-white text-uppercase mb-4"
								style="letter-spacing: 5px;">Contact Us</h5>
							<p>
								<i class="fa fa-map-marker-alt mr-2"></i>123 Street, New York,
								USA
							</p>
							<p>
								<i class="fa fa-phone-alt mr-2"></i>+012 345 67890
							</p>
							<p>
								<i class="fa fa-envelope mr-2"></i>info@example.com
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
							<p class="m-0 text-white-50">
								Copyright &copy; <a href="#">Domain</a>. All Rights Reserved.</a>
							</p>
						</div>
						<div class="col-lg-6 text-center text-md-right">
							<p class="m-0 text-white-50">
								Designed by <a href="https://htmlcodex.com">HTML Codex</a>
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