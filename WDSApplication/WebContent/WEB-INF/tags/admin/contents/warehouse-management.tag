<%@tag description="User management" pageEncoding="UTF-8" %>
<a href=""><strong><i
		class="glyphicon glyphicon-user"></i>Warehouse management</strong></a>
	<hr>
	<div class="row">
		<div class="col-md-12">
				<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary btn-add table-action">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add new warehouse
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
				                <label for="txtLocation" class="col-sm-2 control-label">Location</label>
				                <div class="col-xs-4">
				                  <textarea class="form-control" name="txtLocation"></textarea>
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
			saveUrl: App.contextPath + "/json/warehouse/save",
			deleteUrl: App.contextPath + "/json/warehouse/delete",
			findUrl: App.contextPath + "/json/warehouse/find",
			listUrl : App.contextPath + "/json/warehouse/list",
			showAddForm: function() {
				$("#dataModelTitle").html("Add warehouse");
				$("input[name=txtId]").val("-1");
   				$("input[name=txtName]").val("");
   				$("textarea[name=txtLocation]").val("");
				$("#dataModelID").hide();
				$("#dataModal").modal("show");
			},
			showEditForm: function(obj) {
				$("#dataModelTitle").html("Edit warehouse");
				$("input[name=txtId]").val(obj.id);
				$("input[name=txtId]").prop("disabled", "disabled");
   				$("input[name=txtName]").val(obj.name);
   				$("textarea[name=txtLocation]").val(obj.location);
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
	       	        	location: $("textarea[name=txtLocation]").val()
	       	        	
				};
				return obj;
			},
			processData: function(data) {
				if (data.length == 0) return data;
				var i;
				for (i = 0; i < data.length; i++) {
							
				}
				return data;
			},
			name : "Warehouse",
			columns : [
				{data: "id", title: "ID"},
				{data: "name", title: "Name"},
				{data: "location", title: "Location"},
				{data: "command", title: ""}
			]
		}
	</script>
