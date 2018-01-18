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
					<div class="col-xs-9"></div>
					<div class="col-xs-3">
						<button class="btn btn-primary" data-toggle="modal"
							data-target="#add-row-modal">
							<span class="glyphicon glyphicon-plus-sign"></span>&nbsp;&nbsp;Add
						</button>
					</div>
				</div>
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

	<!-- MODALS  -->
	<!-- Delete Modal -->
	<div id="delete-row-modal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					<div class="icon-box">
						<i class="material-icons delete">close</i>
						<!-- &#xE5CD; -->
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
					<form method="post" style="display: inline;" id="delete-product">
						<button type="submit" class="btn btn-danger">
							<span class="glyphicon glyphicon-remove-circle"></span>&nbsp;&nbsp;Delete
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Update Modal -->
	<div id="update-row-modal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					<div class="icon-box">
						<i class="material-icons edit">icon-edit</i>
						<!-- &#xe014; -->
					</div>
					<h4 class="modal-title">Update Product</h4>
					<button type="button" class="close cancel" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form method="POST" id="update-product" name="update-product-form">
						<div class="form-group">
							<label>Product Name</label> <input type="text" name="name"
								id="name" class="form-control" />
						</div>
						<div class="form-group">
							<label>Product Brand</label> <input type="text" name="brand"
								id="brand" class="form-control" />
						</div>
						<div class="form-group">
							<label>Product Unit Price</label> <input type="text" id="price"
								name="price" class="form-control" />
						</div>
						<div class="form-group">
							<label>Quantity</label> <input type="text" id="quantity"
								name="quantity" class="form-control" />
						</div>

						<button type="submit" class="btn btn-primary">
							<span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;Update
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info cancel"
						data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Modal -->
	<div id="add-row-modal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					<div class="icon-box">
						<i class="material-icons add">add</i>
						<!-- &#xe014; -->
					</div>
					<h4 class="modal-title">Add Product</h4>
					<button type="button" class="close cancel" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form method="POST" id="add-product" name="add-product-form">
						<div class="form-group">
							<label>Product Name</label> <input type="text" name="name"
								id="add_name" class="form-control" />
						</div>
						<div class="form-group">
							<label>Product Brand</label> <input type="text" name="brand"
								id="add_brand" class="form-control" />
						</div>
						<div class="form-group">
							<label>Product Unit Price</label> <input type="text"
								id="add_price" name="price" class="form-control" />
						</div>
						<div class="form-group">
							<label>Quantity</label> <input type="text" id="add_quantity"
								name="quantity" class="form-control" />
						</div>

						<button type="submit" class="btn btn-primary">
							<span class="glyphicon glyphicon-plus-sign"></span>&nbsp;&nbsp;Add
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info cancel"
						data-dismiss="modal">Cancel</button>
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
										return '<button class="btn btn-primary update" id='+data+' data-toggle="modal" data-target="#update-row-modal"><span class="glyphicon glyphicon-edit"></span></button>'
												+ '&nbsp;&nbsp;<button class="btn btn-danger delete" id='+data+' data-toggle="modal" data-target="#delete-row-modal"><span class="glyphicon glyphicon-remove-circle"></span></button>'
									}
								} ]
					});
		};

		$(document)
				.ready(
						function() {
							//deleting a product
							$(document).on(
									'click',
									'.delete',
									function() {
										var product_id = $(this).attr('id');
										$('#delete-product').attr(
												'action',
												window.contextRoot + '/delete/'
														+ product_id
														+ '/product');
									});
							$('#delete-product').on(
									'submit',
									function(event) {
										event.preventDefault();
										$.ajax({
											url : $('#delete-product').attr(
													'action'),
											method : 'post',
											success : function() {
												$('#productListTable')
														.DataTable().ajax
														.reload();
											}
										});
										event.stopPropagation();
										$("#delete-row-modal").modal('hide');
									});

							//updating a product

							$(document)
									.on(
											'click',
											'.update',
											function() {
												var product_id = $(this).attr(
														'id');
												$
														.ajax({
															url : window.contextRoot
																	+ '/product/'
																	+ product_id,
															method : 'GET',
															dataType : 'json',
															success : function(
																	data) {
																$('#name')
																		.val(
																				data.name);
																$('#brand')
																		.val(
																				data.brand);
																$('#price')
																		.val(
																				data.unitPrice);
																$('#quantity')
																		.val(
																				data.quantity);

																$(
																		'#update-product')
																		.attr(
																				'action',
																				window.contextRoot
																						+ '/update/'
																						+ product_id
																						+ '/product');
															},
															complete : function() {
																console
																		.log('complete');
															}
														});
											});

							var validateUpdateForm = $(
									"form[name='update-product-form']")
									.validate(
											{
												// Specify validation rules
												rules : {
													// The key name on the left side is the name attribute
													// of an input field. Validation rules are defined
													// on the right side
													name : "required",
													brand : "required",
													price : {
														required : true,
														range : [ 1, 50000 ]

													},
													quantity : {
														required : true,
														range : [ 1, 1000 ]
													}
												},
												// Specify validation error messages
												messages : {
													name : "please enter name",
													brand : "please enter brand",
													price : {
														required : "please enter price",
														range : "price should be in range 1 to 50000"

													},
													quantity : {
														required : "please enter quantity",
														range : "quantity should be in range 1 to 1000"
													}
												},
												// Make sure the form is submitted to the destination defined
												// in the "action" attribute of the form when valid
												submitHandler : function(form) {
													url = $('#update-product')
															.attr('action');
													formData = {
														'name' : $('#name')
																.val(),
														'brand' : $('#brand')
																.val(),
														'unitPrice' : $(
																'#price').val(),
														'quantity' : $(
																'#quantity')
																.val()
													};

													$
															.ajax({
																headers : {
																	'Accept' : 'application/json',
																	'Content-Type' : 'application/json'
																},
																type : 'POST',
																dataType : 'json',
																url : url,
																data : JSON
																		.stringify(formData),
																statusCode : {
																	200 : function() {
																		console
																				.log('success');
																		$(
																				'#productListTable')
																				.DataTable().ajax
																				.reload();
																		$(
																				'#update-row-modal')
																				.modal(
																						'hide');
																	}
																}
															});
												}
											});

							var validatAddForm = $(
									"form[name='add-product-form']")
									.validate(
											{
												// Specify validation rules
												rules : {
													// The key name on the left side is the name attribute
													// of an input field. Validation rules are defined
													// on the right side
													name : "required",
													brand : "required",
													price : {
														required : true,
														range : [ 1, 50000 ]

													},
													quantity : {
														required : true,
														range : [ 1, 1000 ]
													}
												},
												// Specify validation error messages
												messages : {
													name : "please enter name",
													brand : "please enter brand",
													price : {
														required : "please enter price",
														range : "price should be in range 1 to 50000"

													},
													quantity : {
														required : "please enter quantity",
														range : "quantity should be in range 1 to 1000"
													}
												},
												// Make sure the form is submitted to the destination defined
												// in the "action" attribute of the form when valid
												submitHandler : function(form) {
													url = window.contextRoot
															+ '/add/product';
													formData = {
														'name' : $('#add_name')
																.val(),
														'brand' : $(
																'#add_brand')
																.val(),
														'unitPrice' : $(
																'#add_price')
																.val(),
														'quantity' : $(
																'#add_quantity')
																.val()
													};

													$
															.ajax({
																headers : {
																	'Accept' : 'application/json',
																	'Content-Type' : 'application/json'
																},
																type : 'POST',
																dataType : 'json',
																url : url,
																data : JSON
																		.stringify(formData),
																statusCode : {
																	200 : function() {
																		console
																				.log('success');
																		$(
																				'#productListTable')
																				.DataTable().ajax
																				.reload();
																		$(
																				'#add-row-modal')
																				.modal(
																						'hide');
																	}
																}
															});
												}
											});
							$(document).on('click', '.cancel', function(event) {
								event.preventDefault;
								validateUpdateForm.resetForm();
							});

						});
	</script>
</body>
</html>