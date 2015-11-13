<?php
$action = "/oauth2/Authorize?response_type=".$response_type."&client_id=".$client_id."&redirect_uri=".$redirect_uri."&state=".$state."&scope=".$scope;
?>

<body>
<div style="text-align:center;">
 	<form method="post">
      	<div class="oauth_content" node-type="commonlogin">
        	<p class="oauth_main_info"> 授权  <a href="http://homeway.me"  target="_blank" class="app_name">homeway 云计算平台</a> 访问你的xxx帐号，并同时登录</p>
			<input name="authorized" value="yes" hidden>
			<button>submit</button>
			<!--这里做登陆检查：未登录要求登陆，已登陆直接授权-->
		</div>
    </form>
    <p>提示：为保障帐号安全，请认准本页URL地址必须以 https://homeway.me 开头</p>
    	
   	</div>
</body>
</html>

