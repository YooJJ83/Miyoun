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
 * 최초작성일 : 2018.10.05.
 * 최종변경일 : 2018.
 * 목적 : 교육연구학생지도 실적보고서 승인관리
 * 저작권 : 한국방송통신대학교
--%> 
<script type="text/javascript">
	
	//오늘날짜 가져오기
	function fn_today(dc){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1;
		var yyyy = today.getFullYear();
		
		if(dc == "Y"){
			return yyyy;
		}else if(dc =="M"){
			return mm;
		}else{
			return dd;
		}
	}
	
	function elementDatepicker(element) {
		setTimeout(function(){
			$(element).datetimepicker({showOn:"button"});
			},100);
	}
	
	function elementDatepicker_e(element) {		
		setTimeout(function(){
			$(element).datetimepicker_e({showOn:"button"});
			},100);
	}
	
	$( function() {
		var lastsel = 0;
		var selectedTab = 0;
		
		fn_today('');
				
	    $('#tabs').tabs({
			show : function(event, ui){					
				selectedTab = ui.index;
			}
		});
		
		
		$("#jqgrid0").jqGrid({
			datatype : "json",
			mtype : "post",
			colNames : [ '','학년도','업무구분','시작일시','종료일시'],
			colModel : [
				{name : 'flag',	      index : 'flag',       align : 'center', editable : false,  hidden : true},				
				{name :	'yosa',       index : 'yosa',       align : 'center', editable : true,  width:  120 },
				{name : 'bzDc', index : 'bzDc', align : 'center', editable : true,  width:  160, formatter : 'select', edittype : 'select',	
					editoptions : { value : {'0':'선택', '1':'계획입력','2':'실적입력'}}
				},
				{name : 'srtDt',  index : 'srtDt',  align : 'center', editable : true,  width:  200,
					editoptions : {
						size : 13,
						dataInit : elementDatepicker
					}			
				},
				{name : 'endDt',  index : 'endDt',  align : 'center', editable : true,  width:  200,
					editoptions : {
						size : 13,
						dataInit : elementDatepicker_e
					}	
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
			onSelectRow : function(id) {
				 if (id && id != lastsel) {
					$("#jqgrid0").setColProp('yosa',{editable : true});
					$("#jqgrid0").setColProp('bzDc',{editable : true});
					$("#jqgrid0").setColProp('srtDt',{editable : true});
					$("#jqgrid0").setColProp('endDt',{editable : true});					
					$('#jqgrid0').jqGrid('editRow', id, true);
					lastsel = id;
				} 
			},
			onCellSelect : function(rowid, iCol, cellContent,e) {
				// 그리드 아이디 지정
				var grdId = "jqgrid0";
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
		
		$("#jqgrid1").jqGrid({
			datatype : "json",
			mtype : "post",
			colNames : [ '','학년도','업무구분','시작일시','종료일시'],
			colModel : [
				{name : 'flag',	      index : 'flag',       align : 'center', editable : false,  hidden : true},				
				{name :	'yosa',       index : 'yosa',       align : 'center', editable : true,  width:  120 },
				{name : 'bzDc', index : 'bzDc', align : 'center', editable : true,  width:  160, formatter : 'select', edittype : 'select',	
					editoptions : { value : {'0':'선택', '1':'계획입력','2':'실적입력'}}
				},
				{name : 'srtDt',  index : 'srtDt',  align : 'center', editable : true,  width:  200,
					editoptions : {
						size : 13,
						dataInit : elementDatepicker
					}			
				},
				{name : 'endDt',  index : 'endDt',  align : 'center', editable : true,  width:  200,
					editoptions : {
						size : 13,
						dataInit : elementDatepicker_e
					}	
				}
			],
			multiselect : true, //왼쪽의 체크박스
			autowidth : false, 
			rowNum : 10,
			shrinkToFit:false,//수평 스크롤 생성 가능(기본값-true : 없음)
			width : 730,
			height : 280, 
			scrollOffset:0, 
			jsonReader : {
				repeatitems : false
			},
			onSelectRow : function(id) {
				 if (id && id != lastsel) {
					$("#jqgrid1").setColProp('yosa',{editable : true});
					$("#jqgrid1").setColProp('bzDc',{editable : true});
					$("#jqgrid1").setColProp('srtDt',{editable : true});
					$("#jqgrid1").setColProp('endDt',{editable : true});					
					$('#jqgrid1').jqGrid('editRow', id, true);
					lastsel = id;
				} 
			},
			onCellSelect : function(rowid, iCol, cellContent,e) {
				// 그리드 아이디 지정
				var grdId = "jqgrid1";
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
				
				var records = $("#jqgrid1").getGridParam("records");
				
				$('#total').text('[ 건수 : ' + records + ' 건 ]');
				if( records==0) {
					$("#msgBox").text('<spring:message code="E5430"/>');
				} else {
					$("#msgBox").text("");
				}

				var lastpage = $('#jqgrid1').getGridParam("lastpage");
				var page = $('#jqgrid1').getGridParam("page");
				PageClick( $('#jqgrid1'), $("#pager"), page, lastpage );	
				lastsel=0;
			}									
		});	
		var sendTgtIdx = 0;
		
		$('#btn_add').click(function(){			
			
			$("#jqgrid"+selectedTab).jqGrid('addRowData',++sendTgtIdx,{});						
           
           	$("#jqgrid"+selectedTab).setRowData(sendTgtIdx, {yosa:$("#yosa").val()});
           	$("#jqgrid"+selectedTab).setRowData(sendTgtIdx, {bzDc:$("#bzDc").val()});
           	$("#jqgrid"+selectedTab).setRowData(sendTgtIdx, {srtDt:'2018-02-01 00:00:00'});
           	$("#jqgrid"+selectedTab).setRowData(sendTgtIdx, {endDt:'2019-01-31 23:59:59'});           
		});
	});
	
	
</script>
<body class="main">
	<div id="stage">
			<!-- Header -->
		<div id="header">
			<h1 class="title">업무처리기간관리</h1>
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
											<option value="2019" >2019</option>
											<option value="2018" >2018</option>																					  										  						  
										</select>
									</span>
								</th>
								<th width="50">
									<span class="text">업무구분</span>
								</th>
								<th style="background-color:white;">
									<span class="field">
										<select id="bzDc" name="bzDc" class="selectbox" title="업무구분">												
											<option value="0" >전체</option>
											<option value="1" >계획입력</option>
											<option value="2" >실적입력</option>																					  										  						  
										</select>
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
					<h2 class="title">업무처리기간관리</h2>
					<ul class="action">
						<li>
							<span class="button"><input type="image" id="btn_add" name="btn_add" alt="추가" title="추가" src="/images/core/btn/btn-add.gif" /></span>
						</li>						
						<li>
							<span class="button"><input type="image" id="btn_save" name="btn_save" alt="저장" title="저장" src="/images/core/btn/btn-save.gif" /></span>
						</li>
						<li>
							<span class="button"><input type="image" id="btn_delete" name="btn_delete" alt="저장" title="저장" src="/images/core/btn/btn-delete.gif" /></span>
						</li>
					</ul>					
				</div>				
				<div class="ui-section-content">
					<div id="tabs">        			     	        		
						<ul>
							<li>
								<a href="#tabs-1">처리학년도 관리</a>
							</li>
							<li>
								<a href="#tabs-2">입력기간 관리</a>
							</li>							
						</ul>
						<div id="tabs-1">
							<div class="query">	
								<ul class="infomation">
			           				<li class="f_left" id="total">[ 건수 : 0 건 ]</li>
			           				<li id="msgBox" class="notify"></li>           				
			           			</ul>
								<table id="jqgrid0" summary="table infomation">
								</table>	        			
							</div>
						</div>
						<div id="tabs-2">
							<div class="query">	
								<ul class="infomation">
			           				<li class="f_left" id="total">[ 건수 : 0 건 ]</li>
			           				<li id="msgBox" class="notify"></li>           				
			           			</ul>
								<table id="jqgrid1" summary="table infomation">
								</table>	        			
							</div>
						</div>
				</div>
				<div class="ui-section-footer">
					<div id="pager" class="pager"></div> 
				</div>			
			</div>			
		</div>		
		<div id="footer"></div>		
	</div>
</body>
