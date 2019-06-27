<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/view/knou/core/component/validation.jsp"%>
	
<title>지표번호 중복확인</title>

<script language="javascript">if(document.URL.indexOf('knou.ac.kr')!=-1) document.domain='knou.ac.kr';</script>
	<script type="text/javascript"> 
		$(function() {
			
			var result = "${result}";

			if (result == "true") {
				$('input[name=useBspsNo]').val('${vo.bspsNo}');
				$("#btn_use").show();
			} else {
				$("#btn_use").hide();
			}
			
			if (result != "") {
				$("#msgBox").css("color","red");
				$("#msgBox").text("${vo.bspsNo}는  ${resultMessage}");
			} 
			
			/**
			 * 목적 : ID중복확인
			 * 매개변수 : 없음 
			 * 반환값 : 없음
			 * 개정이력 : 없음
			 */
			$('#btn_dupChck').click(function() {//'중복확인'
				var bspsNo = $('input[name=bspsNo]').val();
				if (validateBspsNo(bspsNo)) {
					$.ajax({	// 그리드의 한 row를 선택했을 때 AJAX를 이용하여 선택한 지표정보를 가져와서 아래 입력화면에 출력한다.
						type: 'POST',
						url: '/portal/epo/user/confirmBspsDupChck.data',
						data: 'bspsNo='+bspsNo,
						dataType: "json",
						success: function(data){
							var bspsNo = data.vo.bspsNo;
							$('input[name=bspsNo]').val('');
							
							if(data.result=='true'){	//사용 가능한 지표번호
								$('input[name=useBspsNo]').val(bspsNo);
								$("#btn_use").show();
							} else {	//이미 등록된 지표번호
								$('input[name=useBspsNo]').val('');
								$("#btn_use").hide();
							}
		
							$("#msgBox").text(bspsNo + "는 " + data.resultMessage);
						}
					});
				}
			});
	
			/**
			 * 목적 : 사용하기
			 * 매개변수 : 없음 
			 * 반환값 : 없음
			 * 개정이력 : 없음
			 */		
			$("#btn_use").click(function(){
				var bspsNo = $('input[name=useBspsNo]').val();
		   		// 부모창의 함수를 호출하여 입력값 세팅
		   		try {
			   		// IE/6
		   			window.opener.returnBspsNo(bspsNo);
		   			self.close();	
		   		} catch(ex)
		   		{
			   		// FF/Chrome
		   			opener.returnBspsNo(bspsNo);
		   			self.close();	
		   		}
			});

			/**
			 * 목적 : 닫기
			 * 매개변수 : 없음 
			 * 반환값 : 없음
			 * 개정이력 : 없음
			 */			
	   		$('#btn_close').click(function() {//'닫기'
    			self.close();
			});

	   	  	/**
	   		 * 목적 : 지표번호 유효성 검사 수행
	   		 * 매개변수 : 없음 
	   		 * 반환값 : 없음
	   		 * 개정이력 : 없음
	   		 */ 
	   		var validateBspsNo = function(uBspsNo) {
	   			if(!$.knouValidate.required($.trim(uBspsNo))) {
	   				//지표번호를 입력하세요.
	   				$("#msgBox").text("<spring:message code='TE646'/>");
	   				$("#msgBox").css("color","red");
   					$("#bspsNo").focus();
	   				return false;
	   			}

	   			var pattern = /\D/gi;
	   			if( pattern.test(uBspsNo) == true){
	   				//숫자만 입력할수 있습니다.
	   				$("#msgBox").text("<spring:message code='E5910'/>");
	   				$("#msgBox").css("color","red");
	   				$("#bspsNo").focus();
	   				return false;
	   			}
	   			
	   			return true;
	   			
	   		}	 		
		});	
	</script>
<body class="window-popup">

	<div id="stage">
		<!-- Header -->
		<div id="header">
			<h1 class="title">지표번호 중복확인</h1>
			
			<div class="query">
			<form id="search_form" onsubmit="return false;">
				<input type="hidden" id="useBspsNo" name="useBspsNo" value="">
				<table cellpadding="0" cellspacing="0" summary="table infomation" class="query-table">
					<tbody>
						<tr>
							<th>
								<span class="text">지표번호</span>
							</th>
							<td style="text-align:left">
								<input type="text" class="single-line" title="지표번호" name="bspsNo" id="bspsNo" value="" maxlength="15" style="ime-mode:disabled"/>
								<span class="button"><input type="image" id="btn_dupChck" name="btn_dupChck" title="중복확인" alt="중복확인" src="/images/core/btn/btn-query.gif" /></span>
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
				<div class="ui-section-content">
           			<ul class="infomation">
           				<li class="f_left" id="msgBox"></li>
           			</ul>
				</div>
			</div>
		</div>
		<div id="footer">
			<div class="action">
				<input type="image" id="btn_use" alt="사용하기" title="사용하기" src="/images/core/btn/btn-use.gif" />
            	<input type="image" id="btn_close" alt="닫기" title="닫기" src="/images/core/btn/btn-close.gif" />
			</div>
		</div>
	</div>
</body>
