<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
<link href="${pageContext.request.contextPath}/resources/css/reply.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
    //3. 댓글 수정
    $("#btnReplyUpdate").click(function(){
    	 var detailReplytext=$("#detailReplytext").val();
    	 $.ajax({
    	    type:"put",
    	    url:"${path}/reply/update/${vo.rno}",
    	    headers:{
    	    	"Content-type":"application/json"
    	    },
    	    data:JSON.stringify({
    	    	replytext:detailReplytext
    	    }),
    	    dataType:"text",
    	    success:function(result){
    	    	if(result=="success"){
    	    		$("#modifyReply").css("visibility","hidden");
    	    		listReply();
    	    	} 
    	    
    	    }
        		 
    	 });
    	        	
        });
    
    // 4. 댓글 상세화면 닫기
    $("#btnReplyClose").click(function(){
        $("#modifyReply").css("visibility", "hidden");
    });
    
    // 5. 댓글 삭제
    $("#btnReplyDelete").click(function(){
        if(confirm("삭제하시겠습니까?")){
            $.ajax({
                type: "delete",
                url: "${path}/reply/delete/${vo.rno}",
                success: function(result){
                    if(result == "success"){
                        alert("삭제되었습니다.");
                        $("#modifyReply").css("visibility",
                        		"hidden");
                        listReply();
                    }
                }
            });     
          }    
     });
</script>
</head>
<body>
    <span>NO.[${vo.rno}]</span><br>
    <textarea id="detailReplytext" rows="5" cols="100">${vo.replytext}</textarea>
    <div style="text-align: center;">
        <!-- 본인 댓글만 수정, 삭제가 가능하도록 처리 -->
        <c:if test="${sessionScope.userId == vo.replyer}">
            <button type="button" id="btnReplyUpdate" >수정</button>
            <button type="button" id="btnReplyDelete" >삭제</button>
        </c:if>
        <button type="button" id="btnReplyClose" >닫기</button>
    </div>
</body>
</html>
