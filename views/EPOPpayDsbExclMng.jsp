<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="knou" uri="/WEB-INF/tld/knou.tld"%>
<%@ include file="/WEB-INF/view/knou/core/component/jqGrid.jsp"%>
<%@ include file="/WEB-INF/view/knou/core/component/jsTree.jsp"%>
<%--
 * 최초작성자 : 유재준
 * 최초작성일 : 2018.10.15.
 * 최종변경일 : 2018.
 * 목적 : 교육연구학생지도 지급금액반영처리
 * 저작권 : 한국방송통신대학교
--%> 


<script type="text/javascript">

	$( function() {

		var sendTgtIdx = 0;		
		$("#btn_save").click(function(){			
		
			$("#jqgrid").jqGrid('addRowData',++sendTgtIdx,{});	

			var dsbExcl = "<select id=\"tgtDc\" name=\"tgtDc\" class=\"selectbox\" title=\"선급금지급제외자여부\">"+				
			'<option value="Y" >Y</option>'+
			'<option value="N" >N</option>'+													  										  						  
			'</select>';
			var search = "<input type=\"image\" align='right' name='btn_search"+ sendTgtIdx +"' title=\"보내기\" src=\"/images/core/btn/btn-search.gif\" onclick=\"fnSrchPnn('"+sendTgtIdx+"','#jqgrid')\"/>";
                  
            if(sendTgtIdx ==1){
            	$("#jqgrid").setRowData(sendTgtIdx, {seq:'1'});    
            	$("#jqgrid").setRowData(sendTgtIdx, {yosa:'2019'});            	
            	$("#jqgrid").setRowData(sendTgtIdx, {dpnm:'정보전산원'});
            	$("#jqgrid").setRowData(sendTgtIdx, {pnn:'정재화'});
            	$("#jqgrid").setRowData(sendTgtIdx, {tgtDc:'교원'});
            	$("#jqgrid").setRowData(sendTgtIdx, {dsbExclYn:'N'});
            	$("#jqgrid").setRowData(sendTgtIdx, {planSubmYn:'Y'});
            }else{  
            	$("#jqgrid").setRowData(sendTgtIdx, {seq:'2'});
            	$("#jqgrid").setRowData(sendTgtIdx, {yosa:'2019'});
            	$("#jqgrid").setRowData(sendTgtIdx, {dpnm:'정보전산원'});
            	$("#jqgrid").setRowData(sendTgtIdx, {pnn:'유재준'});
            	$("#jqgrid").setRowData(sendTgtIdx, {tgtDc:'직원'});
            	$("#jqgrid").setRowData(sendTgtIdx, {dsbExclYn:dsbExcl});
            	$("#jqgrid").setRowData(sendTgtIdx, {planSubmYn:'Y'});
            	
            }		
            $('#total').text('[ 건수 : 2 건 ]');
			
			return true;
			
			$.knouDialog.confirm('알림','<spring:message code="10003"/>',function(isTrue) {
				if(isTrue){
					var sendData = [];
					var checkbox = $("#grid input[name=cdNo]:checked");
					
					if(checkbox.length == 0 ){
						$.knouDialog.alert('알림',"입력한 값이 없어 실적보고서를 제출할 수 없습니다.");
						return false;
					}					
					
					checkbox.each(function(i){
						var tr = checkbox.parent().parent().eq(i);
						var td = tr.children();
						var span = td.children();
						var input = span.children();
						
						var cdNo = span.eq(0).val();
						var count = input.eq(0).val();
						var score = input.eq(1).val() 
						
						sendData.push(getObject(cdNo, count, score));				 
					});	
					var gridDataJSON = JSON.stringify(sendData);
					var bspsNo = $("#bspsNo").val();					
					$.ajax({
						  type: 'POST',
						  url: "/portal/epo/studgdc/insertAcrsRepo.data?bspsNo="+bspsNo,
						  data: 'gridData='+gridDataJSON,
						  dataType: "json",
						  success : function(data) {
								$.knouDialog.alert('알림','<spring:message code="10004"/>');  //저장되었습니다.   
								$("#msgBox").text('<spring:message code="10004"/>');
								jQuery("#jqgrid").trigger('reloadGrid');  
						  }
					});
				}
			});    
		});	
		
		$("#jqgrid").jqGrid({
			datatype : "json", 
			mtype : "post", 
			colNames : [ '','순번','학년도','부서명','성명','대상자<BR>구분','계획서제출<BR>여부','선급금지급<BR>제외자여부'],
			colModel : [
				{name : 'flag',	    index : 'flag',     align : 'center', editable : false,  hidden : true},
				{name : 'seq',	    index : 'seq',      align : 'center', editable : false,  width:  60},
				{name :	'yosa',     index : 'yosa',     align : 'center', editable : false,  width:  80   },
				{name : 'dpnm', 	index : 'dpnm', 	align : 'center', editable : false,  width:  200  },
				{name : 'pnn', 	  	index : 'pnn', 		align : 'center', editable : false,  width:  80  },
				{name : 'tgtDc',  	index : 'tgtDc',	align : 'center', editable : false,  width:  60  },
				{name : 'planSubmYn',index : 'planSubmYn',align : 'center', editable : false,  width:  100  },
				{name : 'dsbExclYn',index : 'dsbExclYn',align : 'center', editable : false,  width:  100  }				
			],  
			multiselect : true, //왼쪽의 체크박스  
			autowidth : false, 
			rowNum : 10,
			shrinkToFit:false,//수평 스크롤 생성 가능(기본값-true : 없음)
			width : 768,
			height : 280, 
			scrollOffset:0, 
			jsonReader : {
				repeatitems : false
			},				 			
			loadComplete : function() {				
				var records = $("#jqgrid").getGridParam("records");
				
				$('#total').text('[ 건수 : ' + records + ' 건 ]');
				
				if( records==0) {
					$("#msgBox").text('<spring:message code="E5430"/>');
				} else {
					$("#msgBox").text("");
				}

				var lastpage = $('#jqgrid').getGridParam("lastpage");
				var page = $('#jqgrid').getGridParam("page");
				PageClick( $('#jqgrid'), $("#pager"), page, lastpage );	
				lastsel=0;
			},
			editurl : ''							
		});
	});
	
	
</script>
<body class="main">
	<div id="stage">
			<!-- Header -->
		<div id="header">
			<h1 class="title">선급금지급제외자 관리</h1>
			<%-- <knou:location menuId="309304"/> --%>
			<div class="query">	
				<form>			
					<table cellpadding="0" cellspacing="0"  summary="table infomation" class="query-table">
						<tbody>
							<tr>
								<th width="50">
									<span class="text">학년도</span>
								</th>
								<th style="background-color:white;">
									<span class="field">
										<select id="yosa" name="yosa" class="selectbox" title="학년도">	
										  <option value="2019" <c:if test="${yosa == 2019}">selected</c:if>>2019</option>
										  <option value="2018" <c:if test="${yosa == 2018}">selected</c:if>>2018</option>										  										  						  
										</select>
									</span>
								</th>								
								<th width="50">
									<span class="text">부서명</span>
								</th>
								<th style="background-color:white;">
									<span class="field">
										<select id="bspsNo" name="bspsNo" class="selectbox" title="지표구분">
											<option value="" >행정지원과</option>	
										  	<option value="1" >행정지원과</option>
										  	<option value="2" >학사운영과</option>
										  	<option value="3" >정보전산원</option>										  						  
										</select>
									</span>
								</th>	
								<th width="50">
									<span class="text">이름</span>
								</th>
								<th style="background-color:white;">
									<span class="field">
										<input type="hidden" name="userTpId" id="userTpId" value="" />										
										<input type="text" name="pnn" id="pnn" value="" readonly/>
										<input type="image" id="btn_search" title="조회" alt="조회" src="/images/core/btn/btn-search.gif" />
									</span>
								</th>									
								<td class="action">
									<span class="button">
										<input type="image" id="btn_search" title="조회" alt="조회" src="/images/core/btn/btn-query.gif" />
									</span>
								</td>
							</tr>
						</tbody>
					</table>	
				</form>							
			</div>
		</div>
	
		<!-- Contents Container -->
		<div id="container">			
			<div class="ui-section">
				<div class="ui-section-header">
					<h2 class="title">선급금지급제외자 관리</h2>
					<ul class="action">
						<li>
							<span class="button"><input type="image" id="btn_save" name="btn_save" alt="저장" title="저장" src="/images/core/btn/btn-save.gif" /></span>
						</li>						
					</ul>					
				</div>				
				<div class="ui-section-content">
           			<ul class="infomation">
           				<li class="f_left" id="total">[ 건수 : 0 건 ]</li>
           				<li id="msgBox" class="notify"></li>           				
           			</ul>
	        		<table id="jqgrid" summary="table infomation">	        			
	        		</table>      
				</div>
				<div class="ui-section-footer">
					<div id="pager" class="pager"></div> 
				</div>				
			</div>			
		</div>		
		<div id="footer"></div>		
	</div>
</body>
