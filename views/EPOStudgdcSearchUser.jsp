<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/view/knou/core/component/jqGrid.jsp"%>
<%--
 * 최초작성자 : 조성일
 * 최초작성일 : 2018.11.20
 * 최종변경일 :
 * 목적 : 인사정보 검색 팝업
 * 개정이력 : 없음
 * 저작권 : 한국방송통신대학교  
--%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>인사정보 검색 팝업</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<script type="text/javascript">

	var lastsel=0;
	
	function fn_RadioClick(rowid){	
		lastsel=rowid;
	};
	
	$(function(){
		
		if('${searchPsblYn}'=="N"){
			self.close();
		}
		
		$("#jqgrid").jqGrid({
			mType : 'GET',
			datatype : "json",
			colNames:['','교직원번호','성명','부서코드','부서명','직급명','재직상태'],	// grid 컬럼명 설정
			colModel:[
			  		{name:'rdo',index:'rdo', width:40, align:"center"},
					{name:'sklstfNo',index:'sklstfNo',editable:false},
			  		{name:'sklstfNm',index:'sklstfNm',editable:false}, 
			  		{name:'deptCode',index:'deptCode',editable:false, hidden:true},
			  		{name:'deptNm',index:'deptNm',editable:false},
			  		{name:'clsfNm',index:'clsfNm',editable:false},
			  		{name:'hffcSttusCodeNm',index:'hffcSttusCodeNm',editable:false}
			],
			multiselect: false,
			rowNum: 10,
			jsonReader: {
				repeatitems : false
			},
			autowidth: true,
			
			loadComplete : function() {
				var ids = jQuery("#jqgrid").getDataIDs();
				for ( var i = 0; i < ids.length; i++) {
					radio = "<input type=\"radio\" title=\"선택\" name=\"rdo\" onClick='fn_RadioClick("+ids[i]+")'/>";
					jQuery("#jqgrid").setRowData(ids[i], {rdo : radio});
				}

				var records = $("#jqgrid").getGridParam("records");
				$('#total').text('[ 건수 : ' + records + ' 건 ]');
				
				var lastpage = $('#jqgrid').getGridParam("lastpage");
				var page = $('#jqgrid').getGridParam("page");
				PageClick( $('#jqgrid'), $("#pager"), page, lastpage );
			}
		});
		
		/*
		*조회버튼 클릭시
		*/
		$('#btn_search').click(function(){
			var sklstfNm = encodeURIComponent($("#sklstfNm").val()); 
			var deptNm = encodeURIComponent($("#deptNm").val());
			
			$("#jqgrid").jqGrid('setGridParam',{
				url:'/portal/epo/studgdc/retrieveStudgdcSearchUserList.data',
				postData : {sklstfNm:sklstfNm,deptNm:deptNm},
				page:1,
				search:true
			}).trigger("reloadGrid"); 
			lastsel=0;
		});

		
		/*
		* 선택버튼 클릭시  팝업창을 닫으면서 부모창의 학생정보설정 함수에 값을 보내준다.
		*/
		$('#btn_select').click(function(){			
			if(lastsel!=0)
			{
				var ret = jQuery('#jqgrid').jqGrid('getRowData', lastsel);
				opener.fn_SetUserInfo(ret.sklstfNo,ret.sklstfNm,ret.deptCode,ret.deptNm);
			}
			self.close();
		});
		
		/*
		* 취소버튼 클릭시 팝업창을 닫으면서 부모창에 초기화 함수를 호출한다.
		*/
		$('#btn_cancel').click(function(){
			opener.fn_Reset();
			self.close();
		});

		/*
		* 닫기버튼 클릭시 팝업창을 닫는 기능만 한다.
		*/
		$('#btn_close').click(function(){
			self.close();
		});
		
	});

</script>

</head>

<body class="window-popup">
	<div id="stage">
	
		<!-- Header -->
		<div id="header">
		
			<h1 class="title">인사정보검색팝업</h1>
			<ul class="quick-nav">
				<li class="root">
				교육연구학생지도 실적등록
				</li>
				<li class="selected">
				인사정보검색팝업
				</li>
			</ul>

			<div class="query">
				<table cellpadding="0" cellspacing="0" summary="table infomation" class="query-table">
					<tbody>
						<tr>
							<th width="50">
								<span class="text">성명</span>
							</th>
							<td>
								<input type="text" id="sklstfNm" name="sklstfNm" title="성명" size="20" class="single-line" value=""/>
							</td>
							<th width="50">
								<span class="text">부서명</span>
							</th>
							<td>
								<input type="text" id="deptNm" name="deptNm" title="부서명" size="20" class="single-line" value=""/>								
							</td>
							<td align="right">
								<input type="image" id="btn_search" name="btn_search" title="조회" alt="조회" src="/images/core/btn/btn-query.gif" />							
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
					<h2 class="title">안사정보</h2>
					<ul class="action">
						<li>
							<span class="button"><input type="image" id="btn_select" name="btn_select" title="선택" alt="선택" src="/images/core/btn/btn-select.gif" /></span>
						</li>
						<li>
							<span class="button"><input type="image" id="btn_cancel" name="btn_cancel" title="취소" alt="취소" src="/images/core/btn/btn-cancel.gif" /></span>
						</li>
						<li>
							<span class="button"><input type="image" id="btn_close" name="btn_close" title="닫기" alt="닫기" src="/images/core/btn/btn-close.gif" /></span>
						</li>
					</ul>
				</div>
				<div class="ui-section-content">
           			<ul class="infomation">
           				<li id="total"></li>
           				<li class="notify"></li>
           			</ul>
	        		<table id="jqgrid" cellpadding="0" cellspacing="0" summary="table infomation" class="list-table">
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
</html>