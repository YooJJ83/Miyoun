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
 * 최초작성일 : 2018.10.17.
 * 최종변경일 : 2018.
 * 목적 : 교육연구학생지도 보고서 출력
 * 저작권 : 한국방송통신대학교
--%> 
<script type="text/javascript">
	
	
	$( function() {			
		
	});
	
	
</script>
<body class="main">
	<div id="stage">
			<!-- Header -->
		<div id="header">
			<h1 class="title">보고서출력</h1>
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
					<h2 class="title">보고서출력</h2>
					<ul class="action">
						<li>
							<span class="button"><input type="image" id="btn_print" name="btn_print" alt="출력" title="출력" src="/images/core/btn/btn-prt.gif" /></span>
						</li>
					</ul>					
				</div>				
				<div class="ui-section-content">
					<div class="query">
						<table cellpadding="0" cellspacing="0" summary="table infomation" class="editor-table"  id="grid2">
							<tbody>
								<tr>
									<th style="text-align:center" width="60">구분</th>
									<td style="text-align:center">
										<span class="field">
											<select id="reportDc" name="reportDc" class="selectbox" title="보고서구분" alt="보고서구분">	
											  <option value="1">활동계획서 총괄표(전체)</option>
											  <option value="2">활동계획서 총괄표(부서)</option>
											  <option value="3">활동계획서(부서전체)</option>
											  <option value="4">활동계획서(개인)</option>
											  <option value="5">실적보고서 총괄표(전체)</option>
											  <option value="6">실적보고서 총괄표(부서)</option>
											  <option value="7">실적보고서(부서전체)</option>
											  <option value="8">실적보고서(개인)</option>										  										  						  
											</select>
										</span>
									</td>
									<th style="text-align:center" width="50">부서</th>
									<td style="text-align:center">
										<span class="field">
											<select id="reportDc" name="reportDc" class="selectbox" title="보고서구분" alt="보고서구분">
												<option value="1">행정지원과</option>	
												<option value="1">행정지원과</option>
												<option value="2">재정지원과</option>
												<option value="3">기획평가과</option>
												<option value="4">정보전산원</option>
												<option value="5">디지털미디어센터</option>											  										  										  						  
											</select>
										</span>
									</td>
									<th style="text-align:center">사용자</th>
									<td style="text-align:center">
										<span class="field">
											<select id="reportDc" name="reportDc" class="selectbox" title="보고서구분" alt="보고서구분">	
											  <option value="1">유재준</option>
											  <option value="2">안수봉</option>											  										  										  						  
											</select>
										</span>
									</td>
								</tr>
							</tbody>
						</table>		
					</div>
				</div>
				<div class="ui-section-footer">
 
				</div>			
			</div>			
		</div>		
		<div id="footer"></div>		
	</div>
</body>
