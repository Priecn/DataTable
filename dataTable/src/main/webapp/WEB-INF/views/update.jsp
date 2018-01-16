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
						<sf:form method="POST" modelAttribute="product"
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
						</sf:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>