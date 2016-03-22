<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>客户端安装</title>
<meta content="minimum-scale=1.0, width=device-width, height=device-height, maximum-scale=3, user-scalable=no" name="viewport"/>
<meta name="generator" content="editplus"/>
<link href="${localUrl}/assets/global/css/download/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${localUrl}/assets/global/css/download/knd_jspDown.css">
<script src="${localUrl}/assets/global/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
<style type="text/css">
    <!--
    .cid_wrap{
        display: none;
    }
    -->
</style>
<script type="text/javascript">

var isAndroid=(/android/gi).test(navigator.appVersion),isIphone=(/iphone/gi).test(navigator.appVersion),isIpad=(/ipad/gi).test(navigator.appVersion);
var url="${localUrl}", userId, weixin="", weixin1="#mp.weixin.qq.com";
/**
 *  版本下载
 */
function executeDownload(vid,type){
        if(type==1){
            var addr='${iphoneAddress}';
            if(addr){
                setTimeout(function(){
                    window.open("itms-services://?action=download-manifest&url="+addr,"_self");
                },500);
            }else{
                alert('该版本暂未发布');
                return false;
            }
        }else if(type==2){
            var addr='${ipadAddress}';
            if(addr){
                setTimeout(function(){
                    window.open("itms-services://?action=download-manifest&url="+addr,"_self");
                },500);
            }else{
                alert('该版本暂未发布');
                return false;
            }
        }else if(type==3){
            var addr='${androidPhoneAddress}';
            if(addr){
                setTimeout(function(){
                    document.location.href=url+addr+weixin;
                },500);
            }else{
                alert('该版本暂未发布');
                return false;
            }
        }else{ }
        if(vid){
            downloadVersionInfo(vid);
        }
}
$(function(){
    hideDiv('pop-div');
    if(isIpad||isIphone||isAndroid){
        if(is_weixin()){
            showGuide();
        }else{
            if(startDownload_check()){
                $("#id_wrap").addClass('cid_wrap');
                popupDiv('pop-div');
            }else{
                $("#id_wrap").addClass('cid_wrap');
                alert('该版本暂未发布');
                return false;
            }
        }
    }else{
        folWrap();
    }
});
/**
 *  开始下载
 */
function executeDownload_check(vid,type){
    var bool=true;
    if(type==1){
        var addr='${iphoneAddress}';
        if(addr){
            bool=true;
        }else{
            bool=false;
        }
    }else if(type==2){
        var addr='${ipadAddress}';
        if(addr){
            bool=true;
        }else{
            bool=false;
        }
    }else if(type==3){
        var addr='${androidPhoneAddress}';
        if(addr){
            bool=true;
        }else{
            bool=false;
        }
    }
    return bool;
}

/**
 *  下载判断
 */
function startDownload_check(){
    var bool=true;
    if(isIphone){
        bool=executeDownload_check('${iphoneId}',1);
    }else if(isIpad){
        bool=executeDownload_check('${ipadId}',2);
    }else if(isAndroid){
        bool=executeDownload_check('${androidId}',3);
    }
    return  bool;
}

/**
 * 判断当前浏览器是否为微信内核
 */
function is_weixin(){
    var ua=navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i)=="micromessenger"){
        return true;
    }else{
        return false;
    }
}

/**
 *  显示信息开关
 */
function showGuide(){
    if(isIphone||isIpad){
        var html=$("#ios_install_guide").html();
        $("#id_wrap").addClass('cid_wrap');
        $("#container").html(html);
    }else if(isAndroid){
        var html=$("#android_install_guide").html();
        $("#id_wrap").addClass('cid_wrap');
        $("#container").html(html);
    }else{
        folWrap();
    }
}

/**
 *  显示div信息
 */
function popupDiv(div_id,verid,type){
    $('#downtype').val(type);
    $('#verid').val(verid);
    $('#errorMsg').hide();
    var div_obj=$("#"+div_id);
    var x=navigator;
    var w=window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth;
    var h=window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight;
    var windowWidth=document.documentElement.clientWidth;
    var windowHeight=document.documentElement.clientHeight;
    var popupHeight=div_obj.height();
    var popupWidth=div_obj.width();
    $("<div id='mask_body'></div>").appendTo("body");
    $("#mask_body").css({ "opacity":"0.5","height":windowHeight,"width":(windowWidth)});
    div_obj.css({"position":"absolute"}).animate({left:w/2-popupWidth/2,
        top:h/2-popupHeight/2,opacity:"show" },"slow");
}

/**
 *  隐藏div
 */
function hideDiv(div_id){
    $("#mask_body").remove();
    $("#"+div_id).animate({left:0,top:0,opacity:"hide" },"slow");
}

/**
 *  获取版本id
 */
function getVersionId(type){
    if(type==1){
        return '${iphoneId}';
    }else if(type==2){
        return '${ipadId}';
    }else if(type==3){
        return '${androidId}';
    }else{
    }
}
/**
 *  登录验证接口
 */
function loginDown(){
    $('#errorMsg').html('');
    var phoneNum=$('#phoneNum').val(), codeNum=$('#codeNum').val();
    if(''==codeNum||null==codeNum||''==codeNum||null==codeNum){
        $('#errorMsg').css({"display":"block"});
        $('#errorMsg').html('手机号码,验证码不能为空');
        return false;
    }
    var webUrl=url+"/jd/download?random="+Math.random();
    var loginSuccess=false,jsonData="{\"phoneNum\":\""+phoneNum+"\",\"xtype\":\"checkCodeInfo\",\"codeNum\":\""+codeNum+"\"}";
    $.ajax(webUrl,{
        type:"POST",
        cache:false,
        data:{"jsonparm":jsonData},
        async:true,
        success:function(msg){
            if('200'==msg.resCode){
                hideDiv('pop-div');
                loginSuccess=true;
                startDownload();
            }else{
                loginSuccess=false;
                $('#errorMsg').css({"display":"block"});
                $('#errorMsg').html(msg.msg);
            }
        },
        error:function(msg){
            loginSuccess=false;
            $('#errorMsg').css({"display":"block"});
            $('#errorMsg').html("网络错误！");
        }

    });
}
/**
 *  调用版本下载信息
 */
function startDownload(){
    if(isIphone){
        $("#id_wrap").addClass('cid_wrap');
        hideDiv('pop-div_id');
        executeDownload('${iphoneId}',1);
    }else if(isIpad){
        $("#id_wrap").addClass('cid_wrap');
        hideDiv('pop-div_id');
        executeDownload('${ipadId}',2);
    }else if(isAndroid){
        $("#id_wrap").addClass('cid_wrap');
        hideDiv('pop-div_id');
        executeDownload('${androidId}',3);
    }else{
        folWrap();
    }
}
/**
 *  获取验证码信息
 */
function getMsgCode(){
    var phoneNum=$('#phoneNum').val(), result=/^1[3|5|8][0-9]\d{8}$/;
    if(''==phoneNum||null==phoneNum){
        $('#errorMsg').css({"display":"block"});
        $('#errorMsg').html('手机号码不能为空');
        return false;
    }
    if(!result.test(phoneNum)){
        $('#errorMsg').css({"display":"block"});
        $('#errorMsg').html('手机只能以13,15,18开头且长度为11位数字');
        return false;
    }
    $('#errorMsg').html('');
    var jsonData="{\"phoneNum\":\""+phoneNum+"\",\"xtype\":\"sendCodeNum\"}";
    $.ajax({
        url:url+"/jd/download?random="+Math.random(),
        type:'POST',
        data:{"jsonparm":jsonData},
        dataType:"json",
        traditional:true,
        success:function(msg){
            if('200'==msg.resCode){
                $('#errorMsg').css({"display":"block"});
                $('#errorMsg').html('验证码发送成功');
            }else{
                $('#errorMsg').css({"display":"block"});
                $('#errorMsg').html(msg.msg);
            }
        },
        error:function(msg){
            $('#errorMsg').css({"display":"block"});
            $('#errorMsg').html("网络错误！");
        }
      });
}
/**
 * 二维码扫描
 */

function folWrap(){
}
/**
 *  统计版本下载量信息
 */
function downloadVersionInfo(vid){
    var jsonData="{\"versionId\":\""+vid+"\",\"xtype\":\"downVersionInfo\",\"channelStatus\":\""+GetRequest('toform',1)+"\",\"phoneNum\":\""+GetRequest('phone',2)+"\"}";
    $.ajax({
        url:url+"/jd/download?random="+Math.random(),
        type:'POST',
        data:{"jsonparm":jsonData},
        dataType:"json",
        traditional:true,
        success:function(data){   }
    });
}
/**
 *  获取下载渠道信息
 */
function GetRequest(name,tip){
    var str = "";
    try{
        str=getQueryString(name);
    }catch(e){
        if(1==tip||'1'==tip){
            str='weixin';
        }else{
            str='';
        }
    }
    if(1==tip||'1'==tip){
        if(null != str && '' != str){
            var weixin=str.indexOf("weixin")!= -1,
                    appstore=str.indexOf("appstore")!= -1;
            if(weixin){
                str = 'weixin'
            }else if(appstore){
                str = 'appstore'
            }else{
                str = 'qrcodeImage'
            }
        }
    }
    return str;
}
/**
 *  获取URL中参数的值
 */
function getQueryString(name){
    var reg=new RegExp("(^|&)"+name+"=([^&]*)(&|$)","i");
    var r=window.location.search.substr(1).match(reg);
    if(r!=null) return unescape(r[2]);
    return "";
}
</script>
</head>
<body>
<div class="header">
${appTitle}
</div>

<div id="container" style="margin: 0 auto; text-align: center; padding: 15px;">
</div>
<div id="ios_install_guide" style="display:none;">
    <div id="ios_install_guide_content">
        <div class="step_desc header_step">两步轻松安装:</div>
        <div class="step_desc">请点击右上角"按钮图标"</div>
        <div class="img1"></div>
        <div class="step_desc">在菜单中选择"在Safari中打开"</div>
        <div class="img2"></div>
        <div class="step_desc footer_step">在弹出框中选择"安装"即成功</div>
    </div>
</div>

<div id="android_install_guide" style="display:none;">
    <div id="android_install_guide_content">
        <div class="step_desc header_step">两步轻松安装:</div>
        <div class="step_desc">请点击右上角"菜单图标"</div>
        <div class="img1"></div>
        <div class="step_desc">在菜单中选择"在浏览器中打开"</div>
        <div class="img2"></div>
        <div class="step_desc footer_step">在弹出框中选择"安装"即成功</div>
    </div>
</div>


<div id="pop-div" style="width: 98%; position: absolute;border-radius: 5px;z-index: 30000; left: 0px; top: 50px; display: block;background: #fff;" class="pop-box">
    <h4 class="ui-title">手机号码验证 <a href="#" onclick="getMsgCode();" style="float:right;text-decoration: none;color: blue;"><span>点击获取验证码</span></a></h4>
    <input type="hidden" id="downtype"></input>
    <input type="hidden" id="verid"/>

    <div style="display:none;color:red;text-align: center;" id="errorMsg"></div>
    <div class="pop-box-body" style="margin:10px;">
        <p><label>手机号码</label><input type="text" id="phoneNum" class="ui-input" value=""/></p>

        <p><label>验证码&nbsp;&nbsp;</label><input type="text" id="codeNum" class="ui-input" value=""/></p>
    </div>
    <div class="buttonPanel" style="text-align: center;margin-bottom: 10px;">
        <a class="ui-button" id="done" onclick="return loginDown();">确认</a>
    </div>
</div>
<div id="id_wrap">
    <div id="pop-div_id" style="width: 100%; text-align:center; position: absolute;border-radius: 5px;z-index: 30000; left: 0px; top: 50px; display: block;background: #fff;" class="pop-box">
        <h4 class="ui-title">二维码</h4>

        <div class="wrap" style="margin-top:25px;">
            <img id="qrcodeImageUrl" src='data:image/gif;base64,${qrcodeimg}' width="200px" height="200px">
        </div>
    </div>
</div>

<br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/>
<center style="font-size:13px; margin-left:10px;">${companyName}
</center>
</body>
</html>
