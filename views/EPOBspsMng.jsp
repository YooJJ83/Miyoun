<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>지표관리</title>
<%@include file="/WEB-INF/view/knou/core/component/jqGrid.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="knou" uri="/WEB-INF/tld/knou.tld"%>

<script src="/js/core/jquery.equalheights.js" type="text/javascript"></script>
<script type="text/javascript">
	
$(function() {	
	
	function bspsSave(flag, yosa, areCd, bspsCd, bspsCn, dvCd, alltMnActi){
		this.flag = flag;
		this.yosa = yosa;
		this.areCd = areCd;
		this.bspsCd = bspsCd;
		this.bspsCn = bspsCn;
		this.dvCd = dvCd;
		this.alltMnActi = alltMnActi;
	}

	function getObject(flag, yosa, areCd, bspsCd, bspsCn, dvCd, alltMnActi){
		return new bspsSave(flag, yosa, areCd, bspsCd, bspsCn, dvCd, alltMnActi);
	}

	function bspsDel(yosa, areCd, bspsCd) {
		this.yosa = yosa;
	    this.areCd = areCd;
	    this.bspsCd = bspsCd;
	}

	function getObjectDel(yosa, areCd, bspsCd) {
	    return new bspsDel(yosa, areCd, bspsCd);
	}
		
	var lastsel = 0;
	
	$("#jqgrid").jqGrid({
		mType : 'GET',	
		datatype : "json",
		colNames:['','학년도','영역','지표번호','지표명','구분' ,'배점 및 주요활동'],	// grid 컬럼명 설정
		colModel:[ 	// 각 컬럼의 타입 설정
				{name : 'flag', 	index : 'flag', 	hidden:true},
				{name : 'yosa',		index : 'yosa',		align : 'center', editable : false,  width:  50},
				{name : 'areCd',	index : 'areCd',	align : 'center', editable : true,  width:  80, formatter : 'select', edittype : 'select',	
					editoptions : { value : {'1':'교육영역','2':'연구영역','3':'학생지도영역'}}
				},
				{name : 'bspsCd',	index : 'bspsCd', 	hidden:true},
		  		{name : 'bspsCn',	index : 'bspsCn',	editable:true, width:  240},
		  		{name : 'dvCd',	index : 'dvCd',	align : 'center', editable : true,  width:  80, formatter : 'select', edittype : 'select',	
					editoptions : { value : {'1':'공통','2':'선택'}}
				},
				{name : 'alltMnActi',	index : 'alltMnActi',	editable : true,  width:  240, edittype : 'textarea',	
					editoptions : { rows : "3", cols : "35"}
				}	  		
		],
		multiselect:true,	// 멀티셀렉트 여부
		height: 280,		// dynamic resizing
		width : 768,
		rowNum: 10,		// 한 화면에 표시되는 data 갯수
		jsonReader: {	// AJAX 결과값을 JSON 형식으로 이용하기 위해 필요한 설정
			repeatitems : false
		},
		autowidth: false,
		scrollOffset:0,
		shrinkToFit:false,//수평 스크롤 생성 가능(기본값-true : 없음)
		onSelectRow : function(id) {
			 if (id && id != lastsel) {				
				$('#jqgrid').jqGrid('editRow', id, true);
				lastsel = id;
			} 
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
			// 그리드가 전부 그려진 후에 총 건수를 표시
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
			lastsel = 0;
		},
		editUrl : ''
	});
	
	//조회버튼 클릭
	$('#btn_search').click(function(){
		
		var page = 1;
        var lastpage = 0;   
		var yosa = $("#yosa").val();
		var areCd = $("#areCd").val();
		var url = "/portal/epo/studgdc/retrieveBspsList.data?yosa="+yosa+"&areCd="+areCd;
		$("#jqgrid").jqGrid("setGridParam", {url:url});	 		
        $("#jqgrid").trigger("reloadGrid");        
	});
	
	//추가버튼 클릭
	$('#btn_add').click(function(){
		
		var datarow = {
			flag : "I",
			yosa :  $("#yosa").val(),
			areCd : $("#areCd").val(),
			dvCd : "2"
		};
		$("#jqgrid").jqGrid('addRowData',parseInt($("#jqgrid").jqGrid('getGridParam','records')) + 1, datarow);		
		$("#jqgrid").setColProp('bspsCn',{editable : true});
		$("#jqgrid").setColProp('alltMnActi',{editable : true});
		$("#jqgrid").setColProp('dvCd',{editable : true});
		grdSetSelection('jqgrid',parseInt($("#jqgrid").jqGrid('getGridParam', 'records')),true);
		$('#jqgrid').jqGrid('editRow', parseInt($("#jqgrid").jqGrid('getGridParam','records')), true);       
	});
	
	//저장버튼 클릭
	$('#btn_save').click(function(){
		
		$.knouDialog.confirm('알림','추가 및 변경 내용을 저장합니다.<br>'+'<spring:message code="10003"/>',function(isTrue) {
			if(isTrue){
				var gridData = new Array();
				var len = 0;
				var gr = $('#jqgrid').jqGrid('getGridParam','selarrrow');
				if (gr.length > 0) {
					for (var i = 0; i < gr.length; i++) {
						$("#jqgrid").jqGrid('saveRow', gr[i], false,'clientArray');
						var ret = $('#jqgrid').jqGrid('getRowData', gr[i]);
						gridData[len] = getObject(ret.flag, ret.yosa, ret.areCd, ret.bspsCd, ret.bspsCn, ret.dvCd, ret.alltMnActi);
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
					  url: "/portal/epo/studgdc/modifyBspsList.data",
					  data: 'gridData='+gridDataJSON,
					  dataType: "json",
					  success : function(data) {
							$.knouDialog.alert('알림','<spring:message code="10004"/>');   
							$("#msgBox").text('<spring:message code="10004"/>');
							jQuery("#jqgrid").trigger('reloadGrid');  
					  }
				});
			}
			$("#btn_search").click();
		});
		return false;       
	});
	
	//삭제버튼 클릭
	$('#btn_delete').click(function(){
		
		$.knouDialog.confirm('알림','<spring:message code="10008"/>',function(isTrue) {
			if(isTrue){
				var gridData = new Array();
				var len = 0;
				var gr = $('#jqgrid').jqGrid('getGridParam','selarrrow');
				if (gr.length > 0) {									
					for (var i = 0; i < gr.length; i++) {
						$("#jqgrid").jqGrid('saveRow', gr[i], false,'clientArray');
						var ret = $('#jqgrid').jqGrid('getRowData', gr[i]);
						gridData[len] = getObjectDel(ret.yosa, ret.areCd, ret.bspsCd);
						len++;
					}
				} else {
					$("#msgBox").text('<spring:message code="10011"/>');
					$.knouDialog.alert('알림','<spring:message code="10011"/>');
					return false;
				}
				var gridDataJSON = JSON.stringify(gridData);
				$.ajax({
					  type: 'POST',
					  url: "/portal/epo/studgdc/deleteBspsList.data",
					  data: 'gridData='+gridDataJSON,
					  dataType: "json",
					  success : function(data) {
							$.knouDialog.alert('알림','<spring:message code="10010"/>');   
							$("#msgBox").text('<spring:message code="10010"/>');
							jQuery("#jqgrid").trigger('reloadGrid');  
					  }
				});
			}
			$("#btn_search").click();
		});
		return false;      
	});
});

</script>

<body class="main">
	<div id="stage">	
		<!-- Header -->
		<div id="header">
			<h1 class="title">지표관리</h1>
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
								<span class="text">영역</span>
							</th>
							<th style="background-color:white;">
								<span class="field">
									<select id="areCd" name="areCd" class="selectbox" title="영역">												
										<option value="" >전체</option>
										<option value="1" >교육영역</option>
										<option value="2" >연구영역</option>
										<option value="3" >학생지도영역</option>																					  										  						  
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
			</div>
		</div>		
		<!-- Contents Container -->
		<div id="container">			
			<div class="ui-section">
				<div class="ui-section-header">
					<h2 class="title">지표관리</h2>
					<ul class="action">
						<li>
							<span class="button"><input type="image" id="btn_add" name="btn_add" alt="추가" title="추가" src="/images/core/btn/btn-add.gif" /></span>
						</li>						
						<li>
							<span class="button"><input type="image" id="btn_save" name="btn_save" alt="저장" title="저장" src="/images/core/btn/btn-save.gif" /></span>
						</li>
						<li>
							<span class="button"><input type="image" id="btn_delete" name="btn_delete" alt="삭제" title="삭제" src="/images/core/btn/btn-delete.gif" /></span>
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
