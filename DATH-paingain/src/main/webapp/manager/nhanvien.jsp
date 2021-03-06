<%@page import="model.PgRolePermission"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="model.PgRoles" %>
<%@ page import="DAO.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="model.PgUsers" %>
<%
	HttpSession sesion = request.getSession();
	PgUsers u = (PgUsers) sesion.getAttribute("login");
	if(u.getPgRoles().getRoleId()!=1){
		response.sendRedirect("/site/layouts/accessdenied.jsp");
	}
	
	PgRolePermission rs = new RolePermissionDAO().getPgRolePermissionByRoleIDModuleID(u.getPgRoles().getRoleId(), 7);
	if(rs.getPerStatus()==1){
		if(rs.getIsRead()== true){
		
%>
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<title>Quản lý tài khoản</title>
		<%@include file="/template/header.jsp"%>
	</head>
	<body >
	<% ArrayList<PgRoles> listRole = (ArrayList<PgRoles>) new RoleDAO().getAllPgRoles(); %>
			<div class="nav-md">
		    <div class="container body">
		      <div class="main_container"> 
		            
		    	<%@include file="/template/navbar.jsp"%>
				
				<%@include file="/template/topnav.jsp"%>
				
				<div class="right_col" role="main">
					<!-- ----------------------------------------------->
					<div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
	              	<h2><strong>Quản lý tài khoản</strong></h2>
	              	<hr/>
	              	<%if(request.getAttribute("msg")==null){ %>
	              		<span></span>
	              	<%} else { %>
	                <span style="color:red"><i><%=request.getAttribute("msg") %></i></span>
	                <%} %>
	                <!-- show table-->
	                <div class="x_panel">
		                  <div class="x_title">
		                    <h2>Danh sách tài khoản</h2>
		                    
		                    <div class="clearfix"></div>
		                  </div>
		                  <div class="x_content">
		                  	<!-- search-->
					        <!-- ========================== -->
					        <div class="container">
				            	<div class="row">
					                <div class="col-sm-12">
					                	<table id= "datatable" class="table table-striped table-bordered dataTable no-footer">
										  <thead>
										  	<tr>
										  		<th>Tên đăng nhập</th>
										  		<th>Tên</th>
										  		<th>Loại tài khoản</th>
										  		<th>Giới tính</th>
										  		<th>Địa chỉ</th>
										  		<th>SĐT</th>
										  		<th>CMND</th>
										  		<th>Email</th>
										  		<th>Ngày tạo</th>
										  		<th>Ngày sửa đổi cuối</th>
										  		<th>Trạng thái</th>
										  		<th>
										  		<% if(rs.getIsInsert()== true){ %>
										  		<a href="#" style="color: white;" data-toggle="modal" data-target="#modal-add"  > <i class="fa fa-plus" ></i> Thêm mới</a></th> 
										  		<%} else {out.print("Action");} %>
										  	</tr>
										  </thead>
										   <tbody>
										<%
											ArrayList<PgUsers> list = (ArrayList<PgUsers>) new UserDAO().getAllPgUsers();
											if(list != null){
											for(PgUsers user : list){
										%>  	
										  <tr>
											<td><%=user.getUserId()%></td>
											<td><%=user.getLastName()+" "+user.getFirstName()%></td>
											<%if (user.getPgRoles()==null){ %>
												<td></td>
											<%} else { %>
												<td><%=user.getPgRoles().getRoleName()%></td>
											<%} %>
											<td><%
											if(user.getSex()==true){
												out.print("Nam");
											}else{
												out.print("Nữ");
											}
											%></td>
											<%if(user.getAddress()==null){ %>
												<td> </td>
											<%} else { %>
												<td><%=user.getAddress()%></td>
											<%}%>
											<td><%=user.getPhoneNumber()%></td>
											<%if(user.getAddress()==null){ %>
												<td></td>
											<%} else { %>
												<td><%=user.getCardId()%></td>
											<%}
											if(user.getEmail()==null){
											%>
												<td></td>
											<%} else { %>
											<td><%=user.getEmail()%></td>
											<% } %>
											<td><%=user.getCreateTime()%></td>
											<%if (user.getModifiedTime()==null){ %>
												<td></td>
											<%} else { %>
												<td><%=user.getModifiedTime()%></td>
											<%} %>
											
												<%if (user.getUserStatus()==1){ %>
													<td>Active</td>
										    	<% }else{ %>
										    		<td>Inactive</td>
										    	<% } %>
											
										    <td>
										    <%
										    if(rs.getIsUpdate()== true){
										    if(user.getPgRoles()==null){ %>
										    	<a href="#" data-toggle="modal" data-target="#modal-edit" class="btn btn-link" onclick="pass_update(<%=user.getRecordId()%>,'<%=user.getUserId()%>','<%=user.getFirstName()%>','<%=user.getLastName()%>','<%=user.getAddress()%>','<%=user.getPhoneNumber()%>','<%=user.getCardId()%>','<%=user.getEmail()%>','<%=user.getUserPassword()%>','<%=user.getCreateTime()%>',<%=user.getSex()%>,<%=user.getUserStatus()%>)" > <i class="fa fa-edit"></i> Sửa</a>										    						    	
										    <%} else { %>
										    	<a href="#" data-toggle="modal" data-target="#modal-edit" class="btn btn-link" onclick="pass_update(<%=user.getRecordId()%>,'<%=user.getUserId()%>','<%=user.getFirstName()%>','<%=user.getLastName()%>','<%=user.getAddress()%>','<%=user.getPhoneNumber()%>','<%=user.getCardId()%>','<%=user.getEmail()%>','<%=user.getUserPassword()%>','<%=user.getCreateTime()%>',<%=user.getSex()%>,<%=user.getUserStatus()%>,'<%=user.getPgRoles().getRoleId()%>')" > <i class="fa fa-edit"></i> Sửa</a>										    	
										    <%} 
										    
										    }%>
										    </td>
										  </tr>
										  <%}
											} %>
										  </tbody>
										</table>
					                </div>
					                <div class="clearfix"></div>
					                
	
							        <div class="ln_solid"></div>
							       
				            </div>

			        		</div>
					        <!-- ========================== -->
					      </div>
	             </div>
				 </div>
              </div>
            </div>
            <!-- Add new modal -->
           <div class="modal fade bs-example-modal-lg" id="modal-add" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-delete">
                    <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">Thêm mới nhân viên: </h4>
                        </div>
                        <form action="/manager/useraction?action=add" method="post">
                        <div class="modal-body">
                     		 <div class='col-sm-12'>
				                   <label >Tên đăng nhập :<div style="color: red" id="mes10"></div></label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" id="usernameid1" class="form-control" name="username" placeholder="Tên đăng nhập" />    
				                        </div>
				                    </div>
				                </div>						
                     		 <div class='col-sm-12'>
				                   <label >Họ nhân viên :<div style="color: red" id="mes1"></div></label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" id="lastnameid1" class="form-control" name="lastname" placeholder="Họ nhân viên" />    
				                        </div>
				                    </div>
				                </div>
                          	 <div class='col-sm-12'>
                          	 
				                   <label >Tên nhân viên :<div style="color:red" id="mes2"></div></label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" id="firstnameid1" class="form-control" name="firstname" placeholder="Tên nhân viên" />
				                            
				                        </div>
				                    </div>
				                </div>
				                
				  			    <div class='col-sm-12'>
				                    <label >Địa chỉ :</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="address" placeholder="Địa chỉ" />
				                            
				                        </div>
				                    </div>
				                </div>              
			                 <div class='col-sm-12'>
				                    <label >Số điện thoại :<div style="color: red;" id="mes3"></div></label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" id="phoneid1" class="form-control" name="phone" placeholder="Số điện thoại" />
				                            
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >CMND :</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="cardid" placeholder="Số CMND" />
				                            
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Email :<div id="mes8" style="color: red;"></div></label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" id="emailid1" class="form-control" name="email" placeholder="Email" />
				                            
				                        </div>
				                    </div>
				                </div>
				              <div class='col-sm-12'>
				                    <label >Mật khẩu :<div style="color: red;" id="mes4"></div></label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="password" id="userpasswordid1" class="form-control" name="userpassword" placeholder="Mật khẩu" />                
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Loại tài khoản :</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                        	<select name="role" class="form-control">
					                        	<%
					                        		if(listRole != null){
					                        		for(PgRoles role:listRole){	     	
					                        	%>
					                        		<option value="<%=role.getRoleId()%>" ><%=role.getRoleName()%></option>
					                        	<% }}else{%>
					                        		<option>Không có dữ liệu</option>
					                        	<%} %>
				                        	</select>
				                        </div>
				                    </div>
				                </div>
				              <div class="form-group">
				                    <label class="control-label" >Giới tính :</label>
				                    <div class="form-group radio">
				                        	<div class="col-sm-6 text-center">
				                            	<input type="radio" name="sex" value="man" checked="checked" />   Nam
				  		                   	</div>
				  		                   	<div class="col-sm-6 text-center">
				  		                    	<input type="radio" name="sex" value="notman"/>     Nữ<br>
				                            </div>			                     
				                    </div>
				                
				               </div>
				              <div class="form-group">				                
				                    <label class="control-label" >Trạng thái:</label>
				                    <div class="form-group radio">
				                        <div class="col-sm-6 text-center">
				                            <input type="radio" name="status" value = "1"checked="checked" />Active
				                         </div>
				                         <div class="col-sm-6 text-center">
				                            <input type="radio" name="status" value="0" />Inactive
				                         </div>	
				                       </div>	                         
				                    </div>
				                </div>        
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          <button type="reset" class="btn btn-info">Reset </button>
                          <button type="submit" class="btn btn-info">Save </button>
                        </div>
                    	</form>
                      </div>
                    </div>
            </div>
			<!--  Add new  modal -->

			<!-- Edit modal -->
            <div class="modal fade bs-example-modal-lg" id="modal-edit" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-delete">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">Chỉnh sửa thông tin nhân viên :</h4>
                        </div>
                        <form action="/manager/useraction?action=edit" method="post">
                        <div class="modal-body">
                        	<div class="hd_id">
                        		<input type="hidden" id="eid" class="form-control" name="recordE" />
                        		<input type="hidden" id="userid" class="form-control" name="idE" />                		
                        	</div>	                        			                
				                <div class='col-sm-12'>
				                   <label >Họ nhân viên :<div style="color: red;" id="mes6"></div></label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" id="lastnameid" class="form-control" name="lastnameE" placeholder="Họ nhân viên" />
				                            
				                        </div>
				                    </div>
				                </div>
				                 <div class='col-sm-12'>
				                   <label >Tên nhân viên :<div style="color: red;" id="mes5"></div></label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" id="firstnameid" class="form-control" name="firstnameE" placeholder="Tên nhân viên" />
				                            
				                        </div>
				                    </div>
				                </div>
				  			    <div class='col-sm-12'>
				                    <label >Địa chỉ :</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" id="addressid" class="form-control" name="addressE" placeholder="Địa chỉ" />
				                            
				                        </div>
				                    </div>
				                </div>              
			                 <div class='col-sm-12'>
				                    <label >Số điện thoại :<div style="color: red;" id="mes7"></div></label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" id="phoneid" class="form-control" name="phoneE" placeholder="Số điện thoại" />
				                            
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >CMND :</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" id="idcardid" class="form-control" name="cardidE" placeholder="Tên tài khoản" />
				                            
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Email :<div id="mes9" style="color: red;"></div></label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" id="emailid" class="form-control" name="emailE" placeholder="Mật khẩu" />
				                            
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Loại tài khoản :</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                        	<select name="roleE" id="roleid" class="form-control">
				                        			<option value=""></option>
					                        	<%
					                        		if(listRole != null){
					                        		for(PgRoles role:listRole){	     	
					                        	%>
					                        		<option value="<%=role.getRoleId()%>" ><%=role.getRoleName()%></option>
					                        	<% }}else{%>
					                        		<option>Không có dữ liệu</option>
					                        	<%} %>
				                        	</select>
				                        </div>
				                    </div>
				                </div>
				              <div class='col-sm-12'>
				                        <div class="form-group" >
				                            <input type="hidden" id="userpasswordid" class="form-control" name="userpasswordE" />                
				                        </div>
				                </div>
				             	 <div class='col-sm-12'>
				                        <div class="form-group" >
				                            <input type="hidden" id="createdateid" class="form-control" name="createdateE" />                
				                        </div>
				                </div>
				                <div class='form-group'>
				                    <label class="control-label">Giới tính :</label>
				                    <div class="form-group radio">
				                        	<div class="col-sm-6 text-center">
				                            	<input id="sexmaleid" type="radio" name="sexE" value="man" />Nam
				  		                   	</div>
				  		                   	<div class="col-sm-6 text-center">
				  		                    	<input id="sexfemaleid" type="radio" name="sexE" value="notman"/>Nữ<br>
				                            </div>			                     
				                    </div>
				                </div>
				               
				              <div class='form-group'>
				                    <label >Trạng thái:</label>
				                    <div class="form-group radio">
				                   		<div class="col-sm-6 text-center">
				                            <input type="radio" name="statusE" value = "1" id="statusEid1" />Active
				                         </div>
				                         <div class="col-sm-6 text-center">
				                            <input type="radio" name="statusE" value="0" id="statusEid2" />Inactive
				                         </div>		
				                    </div>
				                </div>        
			                 
                        </div>
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          <button type="reset" class="btn btn-info">Reset </button>
                          <button type="submit" class="btn btn-info">Save </button>
                          
                        </div>
                    	</form>
                      </div>
                    </div>
            </div>
			<!--  Edit modal -->

        	<script type="text/javascript">
        	var message = "Không được để trống!!!"
			    function pass_update(id,uid,fname,lname,address,phone,idcard,email,up,cdate,sex,status,role) {
			    	document.getElementById("eid").value = id; 
			    	document.getElementById("userid").value = uid; 
			    	document.getElementById("firstnameid").value = fname; 
			    	document.getElementById("lastnameid").value = lname; 
			    	document.getElementById("addressid").value = address;
			    	document.getElementById("phoneid").value = phone;
			    	document.getElementById("idcardid").value = idcard;
			    	document.getElementById("emailid").value = email;
			    	document.getElementById("userpasswordid").value = up;
			    	document.getElementById("createdateid").value = cdate;
			    	document.getElementById("roleid").value = role;
			    	
			    	if(sex == true){
				    	document.getElementById("sexmaleid").checked = true ;
				    	document.getElementById("sexfemaleid").checked = false;
			    	} else {
			    		document.getElementById("sexmaleid").checked = false;
				    	document.getElementById("sexfemaleid").checked = true;
				    }
				    if(status === 1){
				    	document.getElementById("statusEid1").checked = true;
				    	document.getElementById("statusEid2").checked = false; 
				    	
					    } else {
					    	document.getElementById("statusEid1").checked = false; 
					    	document.getElementById("statusEid2").checked = true; 
					    	
						    }
			    };
				document.getElementById("firstnameid1").addEventListener("blur",function(){
					if(this.value ===""){
				    		document.getElementById("mes2").innerHTML = message ;
						}else{
				    		document.getElementById("mes2").innerHTML = null ;
							}
				});
			document.getElementById("lastnameid1").addEventListener("blur",function(){
				if(this.value ===""){
			    		document.getElementById("mes1").innerHTML = message ;
					} else {
			    		document.getElementById("mes1").innerHTML = null ;
						}
			});
					
			document.getElementById("phoneid1").addEventListener("blur",function(){
				var patt = /[0-9]{10,11}/;
			    var result = patt.test(this.value);
				if(this.value ===""){
			    		document.getElementById("mes3").innerHTML = message ;
					} else {
						if(result == false){
						    document.getElementById("mes3").innerHTML = "Định dạng số điện thoại không đúng!!!";
						} else{
						    document.getElementById("mes3").innerHTML = null;
							}
					}
			});
			document.getElementById("userpasswordid1").addEventListener("blur",function(){
				if(this.value ===""){
			    		document.getElementById("mes4").innerHTML = message ;
					} else {
			    		document.getElementById("mes4").innerHTML = null ;
						}
			});

			document.getElementById("firstnameid").addEventListener("blur",function(){
				if(this.value ===""){
			    		document.getElementById("mes5").innerHTML = message ;
					} else {
			    		document.getElementById("mes5").innerHTML = null ;
						}
			});
			document.getElementById("emailid1").addEventListener("blur",function(){
				var patt = /^[a-zA-Z0-9_]+@[a-zA-Z]+/g;
			    var result = patt.test(this.value);
				if(this.value === ""){
					document.getElementById("mes8").innerHTML = null ;
				} else
				if(result == false){
		    		document.getElementById("mes8").innerHTML = "Định dạng email không chính xác!!!";
					} else {
			    		document.getElementById("mes8").innerHTML = null ;
				}
			});
			document.getElementById("emailid").addEventListener("blur",function(){
				var patt = /^[a-zA-Z0-9_]+@[a-zA-Z]+/g;
			    var result = patt.test(this.value);
				if(this.value === ""){
			    		document.getElementById("mes9").innerHTML = null ;						
				} else
				if(result == false){
		    		document.getElementById("mes9").innerHTML = "Định dạng email không chính xác!!!";
					} else {
			    		document.getElementById("mes9").innerHTML = null ;
						}			
			});
			document.getElementById("lastnameid").addEventListener("blur",function(){
				if(this.value ===""){
			    		document.getElementById("mes6").innerHTML = message ;
					} else {
			    		document.getElementById("mes6").innerHTML = null ;
						}
			});
			document.getElementById("phoneid").addEventListener("blur",function(){

			    var patt = /[0-9]{10,11}/;
			    var result = patt.test(this.value);
				if(this.value ===""){
			    		document.getElementById("mes7").innerHTML = message ;
					} else {
						if(result == false){
						    document.getElementById("mes7").innerHTML = "Định dạng số điện thoại không đúng!!!";
						} else{
						    document.getElementById("mes7").innerHTML = null;
							}
						}
			});

			document.getElementById("usernameid1").addEventListener("keyup",function (){
				if(this.value.length==0){
						document.getElementById("mes10").innerHTML = message;
						return;
				}else{
						if (window.XMLHttpRequest) {
							xmlhttp = new XMLHttpRequest();
						} else {
							xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
						}
						xmlhttp.onreadystatechange = function(){
								if(this.readyState == 4 && this.status == 200 ){
										document.getElementById("mes10").innerHTML = this.responseText;
									}
							}
					}
				xmlhttp.open("GET","/manager/useraction?username="+this.value,true);
				xmlhttp.send();
			}); 
			</script>
					<!-- ----------------------------------------------->
			    </div>
			    
			    <%@include file="/template/footer.jsp"%>
				<%@include file="/template/footname.jsp"%>
			
		      </div>
		    </div>
	</body>
</html>
<%} }%>