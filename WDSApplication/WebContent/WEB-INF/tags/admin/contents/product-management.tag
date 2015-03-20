<%@tag description="User management" pageEncoding="UTF-8" %>
<a href=""><strong>Product management</strong></a>
	<hr>
	<div class="row">
		<div class="col-md-12">
				<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary btn-add table-action">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add new product
			</button>
			 <div class="table-responsive" id="tableContainer">
			</div>
		</div>
	</div>
<!-- Modal -->
<div class="modal fade" id="dataModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="dataModelTitle"></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" id="dataModelForm">
					<div class="form-group" id="dataModelID" style="display: none">
						<label for="txtId" class="col-sm-2 control-label">ID</label>
						<div class="col-xs-4">
							<input type="text" class="form-control" name="txtId" value="-1" />
						</div>
					</div>
					<div class="form-group">
								<label for="txtName" class="col-sm-2 control-label">Name</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtName"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtCategory" class="col-sm-2 control-label">Category</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtCategory"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtDescription" class="col-sm-2 control-label">Description</label>
				                <div class="col-xs-4">
				                  <textarea class="form-control" name="txtDescription"></textarea>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtWeight" class="col-sm-2 control-label">Weight</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtWeight"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtPrice" class="col-sm-2 control-label">Price</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtPrice"/>
				                </div>
				              </div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary btn-save"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Save</button>
			</div>
		</div>
	</div>
</div>
	<script>
		var TableData = {
			saveUrl: App.contextPath + "/json/product/save",
			deleteUrl: App.contextPath + "/json/product/delete",
			findUrl: App.contextPath + "/json/product/find",
			listUrl : App.contextPath + "/json/product/list",
			showAddForm: function() {
				$("#dataModelTitle").html("Add product");
				$("input[name=txtId]").val("-1");
   				$("input[name=txtName]").val("");
   				$("input[name=txtCategory]").val("");
   				$("textarea[name=txtDescription]").val("");
   				$("input[name=txtPrice]").val("");
   				$("input[name=txtWeight]").val("");
				$("#dataModelID").hide();
				$("#dataModal").modal("show");
			},
			showEditForm: function(obj) {
				$("#dataModelTitle").html("Edit product");
				$("input[name=txtId]").val(obj.id);
				$("input[name=txtId]").prop("disabled", "disabled");
   				$("input[name=txtName]").val(obj.name);
   				$("input[name=txtCategory]").val(obj.category);
   				$("textarea[name=txtDescription]").val(obj.description);
   				$("input[name=txtWeight]").val(obj.weight);
   				$("input[name=txtPrice]").val(obj.price);
				$("#dataModelID").show();
				$("#dataModal").modal("show");
			},
			checkForm: function() {
				return true;	
			},
			prepareObject: function() {
				var obj = {
						id : $("input[name=txtId]").val(),
	       	        	name : $("input[name=txtName]").val(),
	       	        	category: $("input[name=txtCategory]").val(),
	       	        	description: $("textarea[name=txtDescription]").val(),
	       	        	weight: parseInt($("input[name=txtWeight]").val()),
	       	        	price: parseInt($("input[name=txtPrice]").val())
	       	        	
				};
				return obj;
			},
			processData: function(data) {
				if (data.length == 0) return data;
				var i;
				for (i = 0; i < data.length; i++) {
					data[i].detail = '<a class="table-action btn btn-primary btn-xs" href="' + App.contextPath + '/admin/product-detail.jsp?id='+ data[i].id + '">View detail</a>';
				}
				return data;
			},
			name : "Product",
			columns : [
				{data: "id", title: "ID"},
				{data: "name", title: "Name"},
				{data: "category", title: "Category"},
				{data: "description", title: "Description"},
				{data: "weight", title: "Weight"},
				{data: "price", title: "Price"},
				{data: "stockLevel", title: "Stock level"},
				{data: "detail", title: ""},
				{data: "command", title: ""}
			]
		}
	</script>
