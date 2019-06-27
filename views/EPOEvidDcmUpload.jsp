<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="knou.portal.epo.user.vo.EPOIntgUserInfoVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="knou" uri="/WEB-INF/tld/knou.tld"%>
<%@include file="/WEB-INF/view/knou/core/component/jqGrid.jsp"%>
<%--
 * 최초작성자 : 유재준
 * 최초작성일 : 2018.10.26.
 * 최종변경일 : 
 * 목적 : 교육연구학생지도 증빙서류 업로드
 * 저작권 : 한국방송통신대학교
--%>
<!-- 파일 업로드 Include -->
<link href="/css/core/file-select-custom.css" rel="stylesheet" type="text/css" />
<link href="/css/core/ui.jquery.multifile.custom.css" rel="stylesheet" type="text/css" />
<script src="/js/core/multiFile/jquery.form.js" type="text/javascript" language="javascript"></script>
<script src="/js/core/multiFile/jquery.MetaData.js" type="text/javascript" language="javascript"></script>
<script src="/js/core/multiFile/jquery.MultiFile.js" type="text/javascript" language="javascript"></script>
<script src="/js/core/multiFile/jquery.blockUI.js" type="text/javascript" language="javascript"></script>

<script type="text/javascript">


//jquery dom ready
$(function(){
		   	 
	//if(${resultstat} == 'I'){
		$('#actiDc').val(opener.popActiDc);
		$('#hgrkBspsCd').val(opener.popHgrkBspsCd);
		$('#bspsNo').val(opener.popBspsNo);
		$('#bspsNm').html(opener.popBspsNm);
		$('#yosa').val(opener.popYosa); 
	//}else{
		
	//}
	
	/**
   	 * 목적 : 파일업로드 시 확장자 필터
   	 */
	$('#T7').MultiFile({ 
		list: '#T7-list'
		,accept:'hwp|JPG|jpeg|GIF|gif|doc|ppt|pdf'
		/* ,max: 1 */
	});

	$("#btn_close").click(function() {		    
        window.close();
	});
	
	$('#btn_subm').click(saveform=function(){
		/* alert($("#T7-list").html());
		
		if($("#T7-list").html().indexOf(",")!= -1){
			$.knouDialog.alert('알림', '쉼표빼');
		}
		return false;  */
		
		
		
		if($("#T7-list").html()==""){
			$.knouDialog.alert('알림', '파일을 첨부하여 주시기 바랍니다.');
			return false;
		}
		
		if($("#T7-list").html().indexOf(",")!=-1){
			var str = $("#T7-list").html().replace(/,/gi,".");
			$("#T7-list").html(str);
		}
		
    	$.knouDialog.confirm('알림','실적증빙자료를 제출하시겠습니까',function(isTrue) {
			if(isTrue){
				$('#reg_form').attr('action', '/portal/epo/studgdc/submEvidDcmUpload.do');
				$('#reg_form').submit();
			}
    	});
	
    	return false;
   });
});

</script>
<body class="window-popup">
	<div id="stage">
		<div id="header">
			<h1 class="title">증빙서류등록(팝업)</h1>
			<%-- <knou:location menuId="402611"/> --%>
			<div class="query">
				<form id="reg_form"  method="post" enctype="multipart/form-data">
					<table cellpadding="0" cellspacing="0" summary="table infomation" class="query-table">
						<tbody>
							<tr>
								<th width='50'>
									<span class="text">학년도</span>
								</th>
								<td>																	
									<span class="field">
										<input type="text" name="yosa" id="yosa" value="" disabled="disabled"/>
									</span>
								</td>
							</tr>
							<tr>
								<th width='50'>
									<span class="text">활동명</span>
								</th>
								<td>																	
									<span class="field">
										<select id="actiDc" name="actiDc" class="selectbox" title="활동명" disabled="disabled">												
											<option value="1" >교육</option>
											<option value="2" >연구</option>
											<option value="3" >학생지도</option>																					  										  						  
										</select>
									</span>
								</td>
							</tr>
							<tr>
								<th width='50'>
									<span class="text">영역</span>
								</th>
								<td>								
									<span class="field">										
										<select id="hgrkBspsCd" name="hgrkBspsCd" class="selectbox" title="영역" disabled="disabled">												
											<option value="1001" >공통</option>
											<option value="1002" >선택</option>																																  										  						  
										</select>
									</span>
								</td>	
							</tr>
							<tr>						
								<th width='50'>
									<span class="text">지표</span>
								</th>
								<td>	
									<input type="hidden" id="bspsNo" name="bspsNo" class="selectbox" title="영역" disabled="disabled">							
									<span class="field" id=bspsNm >
									</span>
								</td>
							</tr>
							<tr>
								<th width="50">
									<span class="text">첨부파일</span>
								</th>
								<td>
	     						<span class="file">
									<input type="file" name="file" id="T7" value="" class="file-select" title="첨부파일" style="cursor:hand"/>
	            				</span>
	            				<br>
				                   <p class="fileTxt"> 확장자 file_name.hwp, .doc, .ppt 파일만 첨부가 가능합니다.</p>		
	
				                   <div id="T7-list"></div>													
								</td>
							</tr>				
						</tbody>					
					</table>		
					
					<p align="right">
						<input type="image" id="btn_subm" name="btn_submit" alt="제출" title="제출" src="/images/core/btn/btn-subm.gif" />
						<input type="image" id="btn_close" name="btn_close" alt="닫기" title="닫기" src="/images/core/btn/btn-close.gif" />
					</p>	
				</form>	
			</div>
			
		</div>						
	</div>
</body>	