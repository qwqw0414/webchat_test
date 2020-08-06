<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- ===================== Basic Setting ===================== -->
<script>

	function loadMemberList(){
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/selectAllMember",
			data:{
					
				},
			type:"GET",
			dataType:"json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success:data=>{
				console.log(data);
				let html="";
				html+="<div id='memberList'>";
				html+="<table class='table table-hover'>";
				html+="<thead>";
				html+="<tr>";
				html+="<th scope='col'>번호</th>";
				html+="<th scope='col'>아이디</th>";
				html+="<th scope='col'>이름</th>";
				html+="<th scope='col'>가입일</th>";
				html+="</tr>";
				html+="</thead>";
				html+="<tbody>";
					for(var i=0; i<data.length; i++){
						html += "<tr>";
						html += "<td scope='row'>"+(i+1)+"</td>";
						html += "<td>"+data[i].MEMBER_ID+"</td>";
						html += "<td>"+data[i].MEMBER_NAME+"</td>"
						html += "<td>"+data[i].REG_DATE+"</td>"
						html += "</tr>";
						}//end of loop
				html+="</tbody>";
				html+="</table>";
				html+="</div>";

				$("#member-list-tbl").html(html)
			},//end of success
			 error : (x,s,e) =>{
			        console.log("실패!!",x,s,e);
			      },//end of error
	
		});//end of ajax
	};//end of function 


loadMemberList();

</script>


<div id="memberList">

<h1>회원목록</h1>
<br /><br />


<div id="member-list-tbl">

</div>
	
	
	



</div>
<!-- ===================== Basic Setting ===================== -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />