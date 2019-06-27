<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="knou" uri="/WEB-INF/tld/knou.tld"%>
<%@ include file="/WEB-INF/view/knou/core/component/jqGrid.jsp"%>
<%@ include file="/WEB-INF/view/knou/core/component/jsTree.jsp"%>

<!-- 파일 업로드 Include -->
<link href="/css/core/file-select-custom.css" rel="stylesheet" type="text/css" />
<link href="/css/core/ui.jquery.multifile.custom.css" rel="stylesheet" type="text/css" />
<script src="/js/core/multiFile/jquery.form.js" type="text/javascript" language="javascript"></script>
<script src="/js/core/multiFile/jquery.MetaData.js" type="text/javascript" language="javascript"></script>
<script src="/js/core/multiFile/jquery.MultiFile.js" type="text/javascript" language="javascript"></script>
<script src="/js/core/multiFile/jquery.blockUI.js" type="text/javascript" language="javascript"></script>

<%--
 * 최초작성자 : 유재준
 * 최초작성일 : 2018.09.07.
 * 최종변경일 : 2018.
 * 목적 : 교육연구학생지도 증빙서류등록
 * 저작권 : 한국방송통신대학교
--%> 
<script type="text/javascript">
var popActiDc = "";
var popHgrkBspsCd = "";
var popBspsNo = "";
var popBspsNm = "";
var popYosa = "";

function callUploadPop(idx){
	popYosa = $('#yosa').val();
	popActiDc = $('#jqgrid').jqGrid('getRowData', idx).actiDc;
	popHgrkBspsCd = $('#jqgrid').jqGrid('getRowData', idx).hgrkBspsCd;
	popBspsNo = $('#jqgrid').jqGrid('getRowData', idx).bspsNo;
	popBspsNm = $('#jqgrid').jqGrid('getRowData', idx).bspsNm;
	
	var wWidth = 500;
	var wHight = 550;
	var wX = (window.screen.width - wWidth) / 2;
	var wY = (window.screen.height - wHight) / 2;
		
	url = "/portal/epo/studgdc/initEvidDcmUpload.do";			
	window.open(url, 'evidDcmUpload', 'width=500, height=550, toolbar=no, menubar=no, location=0, scrollbars=no, resizable=no, left='+ wX + ', top='+ wY);	

}
	$( function() {
		  
		$("#jqgrid").jqGrid({
			datatype : "json",
			mtype : "post",
			colNames : [ '','활동명','영역','지표코드','지표명','제출서류','증빙파일<br>업로드'],
			colModel : [
				{name : 'flag',	      index : 'flag',       align : 'center', editable : false,  hidden : true},
				{name :	'actiDc',     index : 'actiDc',     align : 'center', editable : false,  width:  80, 
					formatter : 'select', edittype : 'select',	
					editoptions : { value : {'1':'교육', '2':'연구', '3':'학생지도'}}
				},
				{name : 'hgrkBspsCd', index : 'hgrkBspsCd', align : 'center', editable : false,  width:  120, 
					formatter : 'select', edittype : 'select',	
					editoptions : { value : {'1001':'공통', '1002':'선택'}}
				},
				{name :	'bspsNo',     index : 'bspsNo',     align : 'center', editable : false,  hidden : true},
				{name :	'bspsNm',     index : 'bspsNm',     align : 'center', editable : false,  width:  260 },
				{name : 'submFileNm', index : 'submFileNm', align : 'center', editable : false,  width:  200 },
				{name : 'btn_upload', index : 'btn_upload', align : 'center', editable : false,  width:  80 }				
			],  
			multiselect : false, //왼쪽의 체크박스
			autowidth : false, 
			rowNum : 10,
			shrinkToFit : false,//수평 스크롤 생성 가능(기본값-true : 없음)
			width : 768,
			height : 280, 
			scrollOffset:0, 
			jsonReader : {
				repeatitems : false
			},
			loadComplete : function() {		
				
				var ids = $("#jqgrid").getDataIDs();

            	for ( var i = 0; i < ids.length; i++) {					
					var ret = $('#jqgrid').jqGrid('getRowData', ids[i]);				    
					btn = "<input onclick='callUploadPop(" +   ids[i]   + ")' type='image' title='파일업로드' link src='/images/core/btn/btn-uld.gif' />";               
                    $("#jqgrid").setRowData(ids[i], { btn_upload : btn });	                
				}
				
				var records = $("#jqgrid0").getGridParam("records");
				
				$('#total').text('[ 건수 : ' + records + ' 건 ]');
				if( records==0) {
					$("#msgBox").text('<spring:message code="E5430"/>');
				} else {
					$("#msgBox").text("");
				}

				var lastpage = $('#jqgrid0').getGridParam("lastpage");
				var page = $('#jqgrid0').getGridParam("page");
				PageClick( $('#jqgrid0'), $("#pager"), page, lastpage );	
				lastsel=0;
			},
										
		});	
		var sendTgtIdx = 0;
		
		$("#btn_submit").click(function(){
			$("#jqgrid").jqGrid('addRowData',++sendTgtIdx,{});
			
			if(sendTgtIdx ==1){
            	$("#jqgrid").setRowData(sendTgtIdx, {actiDc:'1'});
            	$("#jqgrid").setRowData(sendTgtIdx, {hgrkBspsCd:'1001'});
            	$("#jqgrid").setRowData(sendTgtIdx, {bspsNo:'1001001'});
            	$("#jqgrid").setRowData(sendTgtIdx, {bspsNm:'강의'});
            	$("#jqgrid").setRowData(sendTgtIdx, {submFileNm:''});            	            	
            }else{
            	$("#jqgrid").setRowData(sendTgtIdx, {actiDc:'3'});
            	$("#jqgrid").setRowData(sendTgtIdx, {hgrkBspsCd:'1002'});
            	$("#jqgrid").setRowData(sendTgtIdx, {bspsNo:'3002003'});
            	$("#jqgrid").setRowData(sendTgtIdx, {bspsNm:'동아리/스터디 지도'});
            	
            	var input = "<a href='/comm/downloadFile.do?fileId=20181029142535TqLK7G'>파일테스트.hwp<a>";            	
            	$("#jqgrid").setRowData(sendTgtIdx, {submFileNm:input});
            	
			/* $.knouDialog.confirm('알림','<spring:message code="10003"/>',function(isTrue) {
				if(isTrue){
					var sendData = [];
										
				}*/
			}  
            btn = "<input onclick='callUploadPop(" +   sendTgtIdx   + ")' type='image' title='파일업로드' link src='/images/core/btn/btn-uld.gif' />";               
            $("#jqgrid").setRowData(sendTgtIdx, { btn_upload : btn });	      
		});		
	});	
	
</script>
<body class="main">
	<div id="stage">
		<!-- Header -->
		<div id="header">
			<h1 class="title">증빙서류등록</h1>
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
								<td>
									<span class="field">
										<input type="hidden" name="studgdcType" id="studgdcType" value="actiPldc"/>
									</span>
								</td>																
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
					<h2 class="title">실적증빙자료등록</h2>					
					<ul class="action">
						<li>
							<span class="button"><input type="image" id="btn_submit" name="btn_submit" alt="제출" title="제출" src="/images/core/btn/btn-subm.gif" /></span>
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
			</div>			
		</div>				
	</div>
</body>
