<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

<title>Products</title>

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

						<table id="productListTable"
							class="table table-striped table-borderd">
							<thead>
								<tr>
									<th>Name</th>
									<th>Brand</th>
									<th>Price</th>
									<th>Qty. Available</th>
									<th></th>
								</tr>
							</thead>

							<tfoot>
								<tr>
									<th>Name</th>
									<th>Brand</th>
									<th>Price</th>
									<th>Qty. Available</th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- HTML code for delete confirmation  -->
	<!-- Modal HTML -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					<div class="icon-box">
						<i class="material-icons">&#xE5CD;</i>
					</div>
					<h4 class="modal-title">Are you sure?</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<p>Do you really want to delete these records? This process
						cannot be undone.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-danger" id="delete">Delete</button>
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
		var $table = $('#productListTable');
		if ($table.length) {
			$table
					.DataTable({
						lengthMenu : [
								[ 3, 5, 10, -1 ],
								[ '3 Records', '5 Records', '10 Records', 'ALL' ] ],
						pageLength : 5,
						ajax : {
							url : window.contextRoot
									+ '/json/data/all/products',
							dataSrc : ''
						},
						columns : [
								{
									data : 'name',
								},
								{
									data : 'brand'
								},
								{
									data : 'unitPrice',
									mRender : function(data, type, row) {
										return '&#8377; ' + data
									}
								},
								{
									data : 'quantity'
								},
								{
									data : 'id',
									orderable : false,
									mRender : function(data, type, row) {
										return '<form action="/dataTable/resources/css/modal-style.css" method="GET"><button class="btn btn-primary" onclick="editRow(this,'
												+ data
												+ ')"><span class="glyphicon glyphicon-edit"></span></button>'
												+ '&nbsp;&nbsp;<button type="submit" class="btn btn-danger" onclick="deleteRow(event, this,'
												+ data
												+ ')"><span class="glyphicon glyphicon-remove-circle"></span></button></form>'
									}
								} ]
					});
		};

		function deleteRow(event, elt, data) {
			var $form = $(elt).closest('form');
			console.log($form);
			event.preventDefault();
			$("#myModal").modal('show').one('click', '#delete', function(e) {
				console.log('delete');
				$("#myModal").modal('hide');
				console.log('delete2');
				$form.trigger('submit');
			});
		};

		function editRow(elt, data) {
			alert(data);
		};
	</script>
</body>
</html>