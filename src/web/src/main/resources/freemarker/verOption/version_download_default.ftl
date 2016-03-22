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

<div id="id_wrap">
    <div id="pop-div_id" style="width: 100%; text-align:center; position: absolute;border-radius: 5px;z-index: 30000; left: 0px; top: 50px; display: block;background: #fff;" class="pop-box">
        <h4 class="ui-title">二维码</h4>
        <div class="wrap" style="margin-top:25px;">
            <img id="qrcodeImageUrl" src='data:image/gif;base64,${qrcodeimg}' width="300px" height="300px">
        </div>
    </div>
</div>

<br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/>
<center style="font-size:13px; margin-left:10px;">${companyName}
</center>

</body>
<script type="text/javascript">
    var isAndroid=(/android/gi).test(navigator.appVersion), isIphone=(/iphone/gi).test(navigator.appVersion),isIpad=(/ipad/gi).test(navigator.appVersion);
    var url="${localUrl}", weixin="";
    /**
     * 具体下载信息
     * */
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
        }else{
        }
        /**
         *  统计版本下载量信息
         */
        if(vid){
            downloadVersionInfo(vid);
        }
    }
    /**
     * 获取ID
     * */
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

    jQuery(function($){
        if(is_weixin()){
            showGuide();
        }else{
            startDownload();
        }
    });
    /**
     * 判断是否是微信浏览器
     * */
    function is_weixin(){
        var ua=navigator.userAgent.toLowerCase();
        if(ua.match(/MicroMessenger/i)=="micromessenger"){
            return true;
        }else{
            return false;
        }
    }
    /**
     * 下载信息
     * */
    function startDownload(){
        if(isIphone){
            $("#id_wrap").addClass('cid_wrap');
            executeDownload('${iphoneId}',1);
        }else if(isIpad){
            $("#id_wrap").addClass('cid_wrap');
            executeDownload('${ipadId}',2);
        }else if(isAndroid){
            $("#id_wrap").addClass('cid_wrap');
            executeDownload('${androidId}',3);
        }else{
            folWrap();
        }
    }
    /**
     * 显示提示页面
     * */
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
</html>
