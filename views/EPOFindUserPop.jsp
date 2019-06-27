<!DOCTYPE html>
<html lang=ko>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="format-detection" content="telephone=no,address=no,email=no">
    <meta property="og:url" content="">
    <meta property="og:type" content="website">
    <meta property="og:title" content="권한관리">
    <meta property="og:image" content=""><!-- 카카오톡으로 url을 보낼 때 같이 보이는 이미지가 있는 경로 -->
    <meta property="og:description" content="교육연구학생지도 권한관리">

    <meta name="description" content="교육연구학생지도 권한관리">
    <meta name="keywords" content="교육연구학생지도 권한관리">

    <title>교육연구학생지도 권한관리</title>

    <link rel="stylesheet" href="../css/desktop.css" />
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.min.js"></script>
    <script type="text/javascript">
			var sklstfNo = '';
			var deptCode = '';
			var deptNm = '';
			var sklstfNm = '';
			function returnUsidInfo(){
	    	// 부모창의 함수를 호출하여 입력값 세팅
	    	opener.returnUsidInfo(sklstfNo, sklstfNm, deptCode, deptNm);
				self.close();
			}

			function close() {//'닫기'
				self.close();
			}

			function radioClick(value){
		    	// 선택한 ID값 셋팅
				var valArray = value.split(":");
				sklstfNo = valArray[0];
				sklstfNm = valArray[1];
				deptCode = valArray[2];
				deptNm = valArray[3];
			}

			function radioButton(cellvalue, options, rowObject){// formatter에 설정한 콜백함수를 통해서 호출되며, 여기서 라디오버튼 생성
				var valueStr = "value='" + rowObject.sklstfNo + ":" + rowObject.sklstfNm + ":" + rowObject.deptCode+ ":" + rowObject.deptNm;

				var strHTML = "<input type='radio' name='radio_id' onclick='radioClick(this.value)' " + valueStr + "'>";
				return strHTML;
			}
		</script>
	</head>
	<body class="window-popup">
		<div id="stage">
			<!-- Header -->
			<div id="header">
				<h1 class="title">조직도</h1>
			</div>

			<!-- Contents Container -->
			<div id="container">
				<div class="ui-section">
					<div class="ui-section-header">
						<h2 class="title">대상자 선택</h2>
						<ul class="action">
						</ul>
					</div>
					<div id="dept_tree" class="ui-section-side" style="overflow:auto;height:300px"></div>
					<div class="ui-section-side-content" >
	           			<ul class="infomation">
	           				<li id="total"></li>
	           				<li class="notify" id="msgBox"></li>
	           			</ul>
		        		<table id="jqgrid" cellpadding="0" cellspacing="0" summary="목록"></table>
					</div>
					<div class="ui-section-footer">
					</div>
				</div>
			</div>
			<br><br><br><br><br>
			<!--  footer -->
			<div id="footer">
				<div class="action">
					<input type="image" id="btn_confirm" title="확인" src="/images/core/btn/btn-confirm.gif" />
	            	<input type="image" id="btn_close" title="닫기" src="/images/core/btn/btn-close.gif" />
				</div>
			</div>
		</div>
	</body>
</html>
