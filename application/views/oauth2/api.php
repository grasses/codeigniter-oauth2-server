<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>夏日小草</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="As we do,as you know.">
    <meta property="og:type" content="website">
    <meta property="og:title" content="夏日小草">
    <meta property="og:url" content="http://homeway.me">
    <meta property="og:site_name" content="夏日小草">
    <meta property="og:description" content="As we do,as you know.">
    <meta name="twitter:title" content="夏日小草">
    <link rel="publisher" href="homeway">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <br><br>
        <form class="form-inline">
            <h1>0x01.Access Token获取的四种途径</h1><br><br>

            <div class="form-group">
                <label for="Credentials"><h3>第一种：用户口令（Resource Owner Password Credentials）:</h3><br>
                    <div>发送的数据：<code>{ grant_type: "password", username: "user", password: "pass", client_id: 'testclient', client_secret:'testpass', scope:'userinfo cloud file node' }</code></div><br>
                    <div>收到的数据：<code id="return-PasswordCredentials"></code></div><br>
                </label><br>
                <a id="btn-PasswordCredentials" class="btn btn-success">Get PasswordCredentials</a><br>
            </div>
            <br><br>

            <div class="form-group">
                <label for="ClientCredentials"><h3>第二种：应用授权（Client Credentials）:</h3><br>
                    <div>发送的数据：<code>{client_id: 'testclient', client_secret:'testpass', grant_type:'client_credentials', scope:'userinfo cloud file node'}</code></div><br>
                    <div>收到的数据：<code id="return-ClientCredentials"></code></div><br>
                </label><br>
                <a id="btn-ClientCredentials" class="btn btn-success">Get ClientCredentials</a>
            </div>
            <br><br>

            <div class="form-group">
                <label for="authorize">
                    <h3>第三种：授权码通过code获取access_token（Authorization Code）:</h3>
                    <div>发送的数据：<code>{code: "Authorize 跳转后得到的code", client_id: 'testclient', client_secret:'testpass', password:'testpass', grant_type: 'authorization_code', scope:'user pass'}</code></div><br>
                    <div>收到的数据：<code id="return-Authorize"></code></div><br>
                    <div>code参数 请通过`<a target="_blank" href="/oauth2/authorize?response_type=code&client_id=testclient&redirect_uri=http://homeway.me/&state=xyz&scope=">/oauth2/authorize?response_type=code&client_id=testclient&redirect_uri=http://homeway.me/&state=xxx&scope=</a>`跳转后取得。</div><br>
                </label><br>
                <input type="text" class="form-control" id="authorize-code" placeholder="Authorize code">
                <a id="btn-authorize" class="btn btn-success">Get Authorize Access Token</a>
            </div>

            <br><br>
            <div class="form-group">
                <label for="authorize">
                    <h3>第四种：隐式授权流程（Implicit Grant）:</h3><br>
                    <div>（Authorization Code）简化版，直接回调Access Token</div><br>
                </label>
            </div>

            <br><br><br>
            <h1>0x02.Access Token 管理与应用</h1>
            <br><br><br>

            <div class="form-group">
                <label for="refresh-token">
                    <h3>Refresh Token刷新Access Token</h3><br>
                    <div>发送的数据：<code>{refresh_token: "Refresh Token", client_id: 'testclient', client_secret:'testpass', grant_type:'refresh_token', scope:'userinfo node file'}</code></div>
                    <div>收到的数据：<code id="return-refresh-token"></code></div><br>
                </label><br>
                <input type="text" class="form-control refresh-token" id="old_token" placeholder="旧的Refresh Token">
                <a id="btn-refresh" class="btn btn-success">From Refresh Token Get Access Token</a>
            </div>
            <br><br><br><br>

            <div class="form-group">
                <label for="resource">
                    <h3>From Access Token get Resource</h3><br>
                    <div>发送的数据：<code>{ access_token: "从上面获取到的Access Token"}</code></div><br>
                    <div>收到的数据：<code id="return-resource"></code></div><br>
                </label><br>
                <input type="text" class="form-control token" id="resource" placeholder="Resource">
                <a id="btn-resource" class="btn btn-success">Get Resource</a>
                <a id="btn-resource-limit" class="btn btn-success">Get Resource With Scope Error</a>
            </div>
            <br><br>
        </form>
    </div>
</div>

<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#btn-refresh").click(function (e){
        var data = {refresh_token: $("#old_token").val(), client_id: 'testclient', client_secret:'testpass', grant_type:'refresh_token', scope:'userinfo node file'};
        
        $.post('/oauth2/RefreshToken', data, function (d){
            console.log("Get Toke => ", d);
            $('#return-refresh-token').html(JSON.stringify(d));
        });
    }); 

    $('#btn-authorize').click(function (e){
        var data = {code: $("#authorize-code").val(), client_id: 'testclient', client_secret:'testpass', redirect_uri:"http://homeway.me/", grant_type: 'authorization_code', scope:'userinfo'};
        $.post('/oauth2/authorize/token', data, function (d){
            $(".refresh-token").val(d.refresh_token);
            console.log("Get Authorize Access Token => ", d);
            $('#return-Authorize').html(JSON.stringify(d));
        },"json");
    });

    $('#btn-resource').click(function (e){
        var data = { access_token: $("#resource").val()};
        
        $.post('/oauth2/resource', data, function (d){
            console.log("Get Authorize => ", d);
            $('#return-resource').html(JSON.stringify(d));
        },"json");      
    });

    $('#btn-resource-limit').click(function (e){
        var data = { access_token: $("#resource").val()};
        
        $.post('/oauth2/resource/limit', data, function (d){
            console.log("Get Authorize => ", d);
            $('#return-resource').html(JSON.stringify(d));
        },"json");      
    });

    $('#btn-PasswordCredentials').click(function (e){
        var data = { grant_type: "password", username: "user", password: "pass", client_id: 'testclient', client_secret:'testpass', scope:'userinfo cloud file node' };
        $.post('/oauth2/PasswordCredentials', data, function (d){
            console.log("Get Access Token from client credentials => ", d);
            $(".refresh-token").val(d.refresh_token);
            $(".token").val(d.access_token);
            $('#return-PasswordCredentials').html(JSON.stringify(d));
        },"json");
    });

    $("#btn-ClientCredentials").click(function (e){
        var data = {client_id: 'testclient', client_secret:'testpass', grant_type:'client_credentials', scope:'userinfo cloud file node'};
        $.post('/oauth2/ClientCredentials', data, function (d){
            //d = d.JSON.parse(d);
            console.log("Get Access Token from password credentials => ", d);
            $(".token").val(d.access_token);
            $('#return-ClientCredentials').html(JSON.stringify(d));
        }, "json");
    });
});
</script>

