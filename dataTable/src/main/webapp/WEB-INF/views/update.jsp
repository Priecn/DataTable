<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<spring:url var="css" value="/resources/css" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Update Products</title>

<script type="text/javascript">
	window.contextRoot = "${contextRoot}"
</script>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- DataTable -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="${css}/jquery-ui.min.css">
<!-- Style for modal -->
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${css}/modal-style.css">
</head>

<body>
	<div class="wrapper">
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<%-- <sf:form method="POST" modelAttribute="product"
							action="/dataTable/update/2/product" id="update-product">
							<div class="form-group">
								<label>Product Code</label>
								<sf:input path="code" type="text" id="code" class="form-control" />
								<sf:errors path="code" />
							</div>
							<div class="form-group">
								<label>Product Name</label>
								<sf:input path="name" type="text" id="name" class="form-control" />
								<sf:errors path="name" />
							</div>
							<div class="form-group">
								<label>Product Brand</label>
								<sf:input path="brand" type="text" id="brand"
									class="form-control" />
								<sf:errors path="brand" />
							</div>
							<div class="form-group">
								<label>Product Unit Price</label>
								<sf:input path="unitPrice" type="text" id="price"
									class="form-control" />
								<sf:errors path="unitPrice" />
							</div>
							<div class="form-group">
								<label>Quantity</label>
								<sf:input path="quantity" type="text" id="quantity"
									class="form-control" />
								<sf:errors path="quantity" />
							</div>

							<sf:button type="submit" class="btn btn-primary">
								<span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;Update
						</sf:button>
						</sf:form> --%>
						<h2>Product Update</h2>
						<form action="" name="registration">
							<div class="form-group">
								<label>Product Code</label>
								<input type="text" name="code" id="code" class="form-control" />
							</div>
							<div class="form-group">
								<label>Product Name</label>
								<input type="text" name="name" id="name" class="form-control" />
							</div>
							<div class="form-group">
								<label>Product Brand</label>
								<input type="text" name="brand" id="brand"
									class="form-control" />
							</div>
							<div class="form-group">
								<label>Product Unit Price</label>
								<input type="text" id="price" name="price"
									class="form-control" />
							</div>
							<div class="form-group">
								<label>Quantity</label>
								<input type="text" id="quantity" name="quantity"
									class="form-control" />
							</div>

							<button type="submit" class="btn btn-primary">
								<span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;Update
						</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$("form[name='registration']")
									.validate(
											{
												// Specify validation rules
												rules : {
													// The key name on the left side is the name attribute
													// of an input field. Validation rules are defined
													// on the right side
													code : "required",
													name : "required",
													brand : "required",
													price : {
														required : true,
														range : [1, 5000]
														
													},
													quantity: {
														required : true,
														range : [1, 50]
													}
												},
												// Specify validation error messages
												messages : {
													code : "please enter code",
													name : "please enter name",
													brand : "please enter brand",
													price : {
														required : "please enter price",
														range : "price should be in range 1 to 5000"
														
													},
													quantity: {
														required : "please enter quantity",
														range : "quantity should be in range 1 to 50"
													}
												},
												// Make sure the form is submitted to the destination defined
												// in the "action" attribute of the form when valid
												submitHandler : function(form) {
													form.submit();
												}
											});
						});
	</script>
</body>
</html>