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
 * 최초작성일 : 2018.10.01.
 * 최종변경일 : 2018.
 * 목적 : 교육연구학생지도 관리자 권한 관리
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

	function actiPldcAprv(yosa, areCd, sklstfNo, aprvYn) {
		this.yosa = yosa;
		this.areCd = areCd;		
		this.sklstfNo = sklstfNo;
		this.aprvYn = aprvYn;	
	}
	 
	function getObject(yosa, areCd, sklstfNo, aprvYn) {
		return new actiPldcAprv(yosa, areCd, sklstfNo, aprvYn);
	}
	
	function sendAprv(aprvYn){
		var gridData = new Array();
		var len = 0;
		
		var gr = $("#jqgrid").jqGrid('getGridParam','selarrrow');
		if (gr.length > 0) {
			for (var i = 0; i < gr.length; i++) {	
				$("#jqgrid").jqGrid("editRow", gr[i],true);       					//areCd코드값을 가져오기 위해 수정상태로 변경         
                var areCd = $("#"+gr[i]+"_areCd").val();                			//areCd 코드값 가져오기										
				$("#jqgrid").jqGrid('saveRow', gr[i], false,'clientArray');						
				var ret = $("#jqgrid").jqGrid('getRowData', gr[i]);
				gridData[len] = getObject(ret.yosa, areCd, ret.sklstfNo, aprvYn);
				len++;
			}					
		} else {
			$("#msgBox").text('<spring:message code="TE116"/>');
			$.knouDialog.alert('알림','<spring:message code="TE116"/>');
			return false;
		}
		var gridDataJSON = JSON.stringify(gridData);
		$.ajax({
			type: 'POST',
			url: "/portal/epo/studgdc/modifyAprvList.data",
			data: 'gridData='+gridDataJSON,
			dataType: "json",
			success : function(data) {
				if(data.result.result == 'true'){
						$.knouDialog.alert('알림','<spring:message code="10004"/>');   
						$("#msgBox").text('<spring:message code="10004"/>');
						$('#btn_query').click();
				}else{
					$.knouDialog.alert('알림',data.result.resultMessage);
				}
			}
		});
	}
	
	function sendAprvAll(aprvYn){
		
		var yosa = $('#yosa').val();
		var areCd = $('#areCd').val();
		
		$.ajax({
			type: 'POST',
			url: "/portal/epo/studgdc/modifyAprvAll.data?yosa="+yosa+"&areCd="+areCd+"&aprvYn="+aprvYn,
			data: 'gridData=',
			dataType: "json",
			success : function(data) {
				if(data.result.result == 'true'){
						$.knouDialog.alert('알림','<spring:message code="10004"/>');   
						$("#msgBox").text('<spring:message code="10004"/>');
						$('#btn_query').click();
				}else{
					$.knouDialog.alert('알림',data.result.resultMessage);
				}
			}
		});
	}
	
	
	$( function() {				
		
		$("#jqgrid").jqGrid({
			datatype : "json",
			mtype : "post",
			colNames : [ '','학년도','영역','부서명','사번', '이름','승인여부'],
			colModel : [
				{name : 'flag',	   index : 'flag',    align : 'center', editable : false,  hidden : true},
				{name :	'yosa',    index : 'yosa',    align : 'center', editable : false,  width:  100},
				{name : 'areCd',   index : 'areCd',   align : 'center', editable : true,   width:  100, formatter : 'select', edittype : 'select',	
					editoptions : { value : {'1':'교육영역','2':'연구영역','3':'학생지도영역'}}
				},
				{name : 'deptNm',  index : 'deptNm',  align : 'center', editable : false,  width:  260},
				{name : 'sklstfNo',index : 'sklstfNo',align : 'center', editable : false,  hidden : true},
				{name : 'sklstfNm',index : 'sklstfNm',align : 'center', editable : false,  width:  80},
				{name : 'aprvYn',  index : 'aprvYn',  align : 'center', editable : false,  width:  160, formatter : 'select', edittype : 'select',	
					editoptions : { value : {'Y':'승인','N':'미승인'}}
				}
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
			onCellSelect : function(rowid, iCol, cellContent,e) {
				// 그리드 아이디 지정
				var grdId = "jqgrid";
				var mSelArrow = $("#" + grdId).jqGrid('getGridParam','selarrrow');
				var selRow = jQuery.inArray(rowid, mSelArrow);
				if(iCol != 0) {
					$("#jqg_"+grdId+"_" + rowid).attr("checked", true);
					if(selRow == -1) {
						mSelArrow.push(rowid);
					} 
					
				} else {
					if(selRow == -1) {
						mSelArrow.push(rowid);
						$("#jqg_"+grdId+"_" + rowid).attr("checked",true);
					} else {
						$("#jqg_"+grdId+"_" + rowid).attr("checked",false);
						mSelArrow.splice(selRow, 1);
                        e = mSelArrow[0];
                        mSelArrow.selrow = (e == undefined) ? null : e;
					}					
				}
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
			}										
		});	
		
		$('#btn_aprv').click(function(){			                        
			if($('#btn_blkpc').is(":checked") == true){
				sendAprvAll('Y');
			}else{
				sendAprv('Y');				
			}
		});
		
		$('#btn_cancel').click(function(){
			if($('#btn_blkpc').is(":checked") == true){
				sendAprvAll('N');
			}else{
				sendAprv('N');
			}
		});
		
		$('#btn_query').click(function(){
			var yosa = $('#yosa').val();
			var areCd = $('#areCd').val();
			var sklstfNo = $('#sklstfNo').val();
			var aprvYn = $('#aprvYn').val();
			var deptCode = $('#deptCode').val();
			var url = "/portal/epo/studgdc/retrieveAprvList.data?yosa="+yosa+"&areCd="+areCd+"&sklstfNo="+sklstfNo+"&aprvYn="+aprvYn;
			$("#jqgrid").jqGrid("setGridParam", {url:url});	       
			$("#jqgrid").trigger("reloadGrid");			
		});

	});
	
	
</script>
<body class="main">
	<div id="stage">
			<!-- Header -->
		<div id="header">
			<h1 class="title">활동계획서승인관리</h1>
			<%-- <knou:location menuId="309304"/> --%>
			<div class="query">					
				<table cellpadding="0" cellspacing="0"  summary="table infomation" class="query-table">
					<tbody>
						<tr>
							<th width="50">
								<span class="text">학년도</span>
							</th>
							<th style="background-color:white;">
								<span class="field">
									<select id="yosa" name="yosa" class="selectbox" title="학년도">
										<option value="2018" >2018</option>													
										<option value="2019" >2019</option>
																														  										  						  
									</select>
								</span>
							</th>
							<th width="50">
								<span class="text">지표구분</span>
							</th>
							<th style="background-color:white;">
								<span class="field">
									<select id="areCd" name="areCd" class="selectbox" title="영역구분">	
										<option value=""  >전체</option>
										<option value="1" >교육</option>
										<option value="2" >연구</option>
									  	<option value="3" >학생지도</option>										  						  
									</select>
								</span>
							</th>
							<th width="50">
								<span class="text">계획서처리상태</span>
							</th>
							<th style="background-color:white;">
								<span class="field">
									<select id="aprvYn" name=""aprvYn"" class="selectbox" title="승인여부">
									  <option value="" >전체</option>	
									  <option value="Y" >승인</option>
									  <option value="N" >미승인</option>										  								  						  
									</select>
								</span>
							</th>	
						</tr>
						<tr>
							<th width="50">
								<span class="text">부서명</span>
							</th>
							<th style="background-color:white;">
								<span class="field">
									<select id="deptCode" name="deptCode" class="selectbox" title="지표구분">
										<option value="" >전체</option>	
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
									<input type="text" name="sklstfNo" id="sklstfNo" value="" readonly/>
									<input type="image" id="btn_search" title="조회" alt="조회" src="/images/core/btn/btn-search.gif" />
									<input type="text" name="sklstfNm" id="sklstfNm" value="" readonly/>
								</span>
							</th>																	
							<td class="action" colspan="2">
								<span class="button">
									<input type="image" id="btn_query" title="조회" alt="조회" src="/images/core/btn/btn-query.gif" />
								</span>
							</td>
						</tr>
					</tbody>
				</table>									
			</div>
		</div>
	
		<!-- Contents Container -->
		<div id="container">			
			<div class="ui-section">
				<div class="ui-section-header">
					<h2 class="title">활동계획서승인관리</h2>
					<ul class="action">
						<li>
							<span class="button"><input type="checkbox" id="btn_blkpc" name="btn_blkpc" alt="전체선택" title="전체선택"/>일괄처리</span>
						</li>						
						<li>
							<span class="button"><input type="image" id="btn_aprv" name="btn_aprv" alt="승인" title="승인" src="/images/core/btn/btn-aprv.gif" /></span>
						</li>
						<li>
							<span class="button"><input type="image" id="btn_cancel" name="btn_cancel" alt="취소" title="취소" src="/images/core/btn/btn-cancel.gif" /></span>
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
