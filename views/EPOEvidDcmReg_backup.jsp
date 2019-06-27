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

	$( function() {		
		
		$("#btn_submit").click(function(){
			$.knouDialog.confirm('알림','<spring:message code="10003"/>',function(isTrue) {
				if(isTrue){
					var sendData = [];
										
				}
			});   
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
										<input type="hidden" name="stsuptType" id="stsuptType" value="actiPldc"/>
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
					<div class="query">	
						<table cellpadding="0" cellspacing="0" summary="table infomation" class="editor-table"  id="grid1">
							<tbody name='dataBody'>
								<tr>
									<th style="text-align:center" width="60">활동명</th>
									<th style="text-align:center" width="60">영역</th>
									<th style="text-align:center" width="50">지표</th>
									<th style="text-align:center" width="50">회(건)</th>
									<th style="text-align:center" width="200">배점 및 주요활동</th>
									<th style="text-align:center" width="50">점수</th>
									<th style="text-align:center" width="50">제출여부</th>
									<th style="text-align:center" width="50">파일선택</th>
									<th style="text-align:center" width="140">첨부파일</th>									
								</tr>							
								<tr> 
									<td style="text-align:center">교육</td>
									<td style="text-align:center">공통(100)</td>
	                                <td style="text-align:center">강의</td>
	                                <td style="text-align:center">20</td>
	                                <td style="text-align:center">100점</td> 
	                                <td style="text-align:center">100</td>	                                
	                                <td style="text-align:center; color:blue;"><a href='#' onclick='fnDtl()'>Y<a></td>
	                                <td style="text-align:center">
	                                	<span class="file">
											<input type="file" name="file" id="T7" value="" class="file-select" title="첨부파일" style="cursor:hand"/>
            							</span>
            						</td>
	                                <td style="text-align:center"></td>
								</tr>
								<tr> 
									<td style="text-align:center">학생지도</td>
									<td style="text-align:center">선택</td>
	                                <td style="text-align:center">학생 행사 및 활동 지도</td>
	                                <td style="text-align:center">15</td>
	                                <td>순회지도 활동, 학과발전 사업 등
										<br> 학생회장 선거 및 이/취임식
										<br> 대표자 연수 특강
										<br> 대동제(축제) 및 체전
										<br> 수련회, 답사, MT 임원LT, 경진대회 등
										<br> 대학원 학술관련 학생지도
										<br> 학습 취약계층 상담 및 지원</td> 
	                                <td style="text-align:center">100</td>	                                
	                                <td style="text-align:center; color:blue;"></td>
	                                <td>
	                             		<span class="file">
											<input type="file" name="file" id="T7" value="" class="file-select" title="첨부파일" style="cursor:hand"/>
            							</span>
									</td>
	                                <td style="text-align:center"><div id="T7-list"></div></td>
								</tr>							
							</tbody>									
						</table>
					</div>
					
				</div>				
			</div>			
		</div>				
	</div>
</body>
