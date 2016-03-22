<html>
<head>
    <title>布局管理</title>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css">
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/drags/css/layoutit.css"/>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">应用管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="${rc.contextPath}/application/role">角色管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>


<div class="row">
    <div class="col-md-3" style="min-width: 400px;">
        <div class="row">
            <div class="col-md-12" class="page-title">
                <input type="hidden" id="roleId" value="${role.id}"/>

                <h3 class="page-title">当前角色
                    <small>${role.name}</small>
                </h3>
            </div>
        </div>
        <div class="demo ui-sortable iphone row" style="padding-bottom: 200px;" style="min-height: 650px;">
            <!-- 高度必须为100%,不然设置为固定高度时,当占位超过时不会接受拖动落地 -->
            <div id="myModules" class="myModule">

            </div>

        </div>
    </div>

    <div class="col-md-7" style="margin-top: 80px;">
        <div class="row" style="margin-bottom: 20px;">
            <div class="col-md-9">
                <button class="btn green" onclick="save();">
                    <i class="icon-add"></i>
                    <span>保存</span>
                </button>
                <button class="btn gray backPage" onclick="javascript:window.location.href='${rc.contextPath}/application/role';">
                    <i class="icon-back"></i>
                    <span>返回</span>
                </button>
                <a href="#" title="功能只能拖入模块中，如果工作区没有任何模块，拖入功能之前请先拖入模块。拖动时，将拖动的对象拖入目标位置(出现虚线框)时放开鼠标，即拖动成功。"><img src="${rc.contextPath}/assets/global/img/help.png"></a>
                <!-- <button class="btn blue" onclick="addElm();">
                    增加模块<i class="fa fa-plus"></i>
                </button> -->
            </div>

        </div>
        <div class="sidebar-nav row" style="max-width: 700px">
            <ul class="nav-tabs nav" id="myTab"
                    style="margin-bottom: -5px; padding-bottom: 0px;">
                <li class="active">
                    <a href="#tabsFuncs">功能</a>
                </li>
                <li>
                    <a href="#tabsModules">模块</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active " id="tabsFuncs">
                    <div class="row search-form-default">
                        <div class="col-md-11">
                            <form class="form-inline" action="#">
                                <div class="input-group">
                                    <div class="input-control">
                                        <input id="searchText" type="text" placeholder="Search..." style="width: 100%" class="form-control">
                                    </div>
                                    <span class="input-group-btn">
                                        <button type="button" class="btn green" id="selectFunction">
                                            Search &nbsp; <i class="m-icon-swapright m-icon-white"></i>
                                        </button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="allFunctions" class="row" style="margin-left: 5px;margin-right: 0">

                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <table id="funcPageBar" class="col-md-10"
                                style="text-align: center;">
                            <tr>
                                <td class="form-inline" style="text-align: center;">
                                    <div class="pagination" id="funcPager"
                                            style="font-size: 18px; text-align: center; vertical-align: middle;"></div>
                                    <span style="margin-top: 0px; size: 12px; color: #8a8a8a">跳转到</span>
                                    <input type="text" id="toPage"
                                            style="font-size: 18px; width: 50px; height: 30px;"
                                            class="input-inline page_input"
                                            onkeyup="if(isNaN(value))execCommand('undo');if(event.keyCode==32)execCommand('undo');"
                                            onafterpaste="if(isNaN(value))execCommand('undo'));if(event.keyCode==32)execCommand('undo');">
                                    <button style="width: 40px; height: 30px;" id="gotoPage"
                                            class="btn">
                                        GO
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="tab-pane" id="tabsModules">
                    <!-- 必须加上row样式,不然高度为1px,不能显示边框 -->
                    <div id="allModules" class="row"
                            style="margin-left: 5px;margin-right: 0;padding-bottom: 5px;">

                    </div>
                    <div class="row">
                        <table id="modulePageBar" class="col-md-8"
                                style="text-align: center; width: 100%;">
                            <tr>
                                <td class="form-inline">
                                    <div class="pagination" id="modulePager"
                                            style="font-size: 18px; text-align: center; vertical-align: middle;"></div>
                                    <span style="margin-top: 0px; size: 12px; color: #8a8a8a">跳转到</span>
                                    <input type="text" id="toMPage"
                                            style="font-size: 18px; width: 50px; height: 30px;"
                                            class="input-inline page_input"
                                            onkeyup="if(isNaN(value))execCommand('undo');if(event.keyCode==32)execCommand('undo');"
                                            onafterpaste="if(isNaN(value))execCommand('undo'));if(event.keyCode==32)execCommand('undo');">
                                    <button style="width: 40px; height: 30px;" id="gotoMPage"
                                            class="btn">
                                        GO
                                    </button>
                                </td>
                            </tr>
                        </table>
                        <div class="col-md-2"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
<content tag="script">
<script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>
<script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/lang/summernote-zh-CN.js" type="text/javascript"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/drags/jquery-ui.min.js"></script>
<script src="${rc.contextPath}/assets/drags/bootstrap-paginator.js"></script>
<script src="${rc.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js"></script>
<script type="text/javascript">
//添加模块
function addElm(){
    bootbox.alert("弹出框添加保存后查询数据库然后添加进来");
}
var roleId=$("#roleId").val();
var item=null;
//删除节点
function removeElm(){
    $(".lyrow").delegate(".m_remove","click",function(e){
        e.preventDefault();
        item=$(this).parent().parent();
        //将删除的模块添加到所有模块中去
        var mid=item[0].id;
        //获取模块ＩＤ，查询数据库，重新加载，因为模块内的功能可能发生了改变
        //获取当前角色的模块信息
        Metronic.startPageLoading();
        $.ajax({
            url:'${rc.contextPath}/application/function/find-one-resource',
            type:'POST',
            data:{"id":mid},
            dataType:"json",
            traditional:true,
            success:function(data){
                if(data){
                    var moduleInf=data;
                    var img=moduleInf.icon;
                    if(img==undefined||img==null||img==''){
                        img="/assets/drags/assets/drags/img/default.jpg";
                    }
                    var name=checkLen(moduleInf.name,11);
                    /**动态节点**/
                    var str="<div  class=\'lyrow ui-draggable prelyrow mlyrow\'>"+"<div class=\'preview\'>"+"<div class=\'module-handle\'>"+"<img src=\'${rc.contextPath}"+img+"\'/>"+"<p style=\'text-align:center;\' title=\'"+moduleInf.name+"\'>"+name+"</p>"+"<p style=\'display:none\'>"+moduleInf.id+"</p>"+"</div>"+"</div>"+"<div id=\'"+moduleInf.id+"\' class=\'view\'>"+"<div class='row-header'>"+"<img  src=\'${rc.contextPath}/assets/drags/img/ic_title.png\'/>"+"<span style='padding:5px;'>"+moduleInf.name+"</span>"+"<a href=\'#\' class=\'m_remove\'>"+"<img src=\'${rc.contextPath}/assets/drags/img/ic_delete.png\'/>"+"</a>"+"</div>"+"<img src=\'${rc.contextPath}/assets/drags/img/bg_right.jpg\' style='height:30px; margin:0;width:40%;'/>"+"<div class=\'row clearfix\' style='top:-15px'>"+"<div id=\'content_"+moduleInf.id+"\' class=\'col-md-12 column ui-sortable accordion-inner\' style=\'min-height: 80px;height:100%;\'>";
                    //获取角色ID，模块ID(opts.id),查询该模块下所有功能
                    $.ajax({
                        url:'${rc.contextPath}/application/module/find-func-by-mid',
                        type:'POST',
                        data:{"rid":roleId,"mid":moduleInf.id},
                        dataType:"json",
                        traditional:true,
                        success:function(msg){
                            if(msg){
                                item.parent().remove();
                                var list=msg;
                                /**动态节点，开始**/
                                $.each(list,function(j,functionInf){
                                    var funcTitle=checkLen(functionInf.name);
                                    var funcVersion=functionInf.version;
                                    if(funcVersion=='undefind'||funcVersion==null||funcVersion==""){
                                        funcVersion=1.0;
                                    }
                                    var drag="<div class=\'box box-element ui-draggable  dd-handle\'  style=\'display: block;\'>"+"<div class=\'views\' >"+"<img class=\'icon-title\' src=\'${rc.contextPath}"+img+"\'/>"+"<a href=\'#\'  class=\'remove\'>"+"<img src=\'${rc.contextPath}/assets/drags/img/ic_delete.png\'/>"+"</a>"+"</div>"+"<p style=\'text-align:center;\' title=\'"+functionInf.name+"("+funcVersion+")"+"\'>"+funcTitle+"</p>"+"<p style=\'display:none\'>"+functionInf.id+"</p>"+"</div>";
                                    document.getElementById("content_"+moduleInf.id).innerHTML+=drag;
                                });
                                Metronic.stopPageLoading();
                            }
                        }});
                    str+="</div>"+"</div>"+"</div>"+"</div>";
                    document.getElementById("allModules").innerHTML+=str;
                    //column里面仅仅接受box类型的拖拽
                    $(".demo .column").sortable({
                        connectWith:".box",
                        opacity:.35
                    });
                    //拖动行的时候
                    $(".sidebar-nav .lyrow").draggable({
                        connectToSortable:".demo .myModule",
                        helper:"original",//original
                        revert:"invalid",
                        cursor:"move"
                    });
                    //拖动成功的回调函数
                    $("#myModules").droppable({
                        drop:function(event,ui){
                            ui.draggable.removeClass('prelyrow');
                            ui.helper.removeClass('prelyrow');
                            ui.draggable.removeClass('ui-draggable-dragging');
                            ui.draggable.removeAttr('style');
                            //移动到角色的应用中去以后，存在两个问题，角色移动不到该模块中，该模块内部不能移动
                            $(".lyrow").unbind("click");
                            $(".column").unbind("click");
                            //重新注册事件
                            removeElm();
                            //使模块内部能移动
                            $(".demo .column").sortable({
                                connectWith:".box",
                                opacity:.35
                            });
                        }
                    });
                }
            }
        });
    });
    $(".column").delegate(".remove","click",function(e){
            e.preventDefault();
            $(this).parent().parent().remove();
        });
}
/*************
 **保存
 */
function save(){
    //扫描模板，保存模板，再保存功能
    Metronic.startPageLoading()
    //模板ID集合，按顺序
    var arrMID=new Array();
    //模块的排序
    var arrMSort=new Array();
    //二维数组，模板下的功能集合，顺序与模板ID集合对应
    var arrAllFID=new Array();
    //二维数组，模板下的功能顺序的集合，顺便与模板ID集合对应
    var arrFSort=new Array();
    //随机整数，用来排序
    var sortNum=0;
    var mSort=RndNum();
    for(var i=0; i<element_child_nodes_length("myModules"); i++){
        sortNum=RndNum();
        arrMID[i]=$("#myModules")[0].children[i].children[1].id;
        arrMSort[i]=mSort+i;
        //获取模板下的功能ID
        var id="content_"+arrMID[i];
        var arrFID=new Array();
        var arrSort=new Array();
        for(var j=0; j<element_child_nodes_length(id); j++){
            arrFID[j]=$("#"+id).find('div').find('p').eq(2*j+1).html();
            arrSort[j]=sortNum+j;
        }
        arrAllFID[i]=arrFID;
        arrFSort[i]=arrSort;
    }
    var dragModuleFunctionDTO={};
    dragModuleFunctionDTO.rid=roleId;
    dragModuleFunctionDTO.arrMID=arrMID;
    dragModuleFunctionDTO.arrMSort=arrMSort;
    dragModuleFunctionDTO.arrAllFID=arrAllFID;
    dragModuleFunctionDTO.arrFSort=arrFSort;
    $.ajax({
        url:"${rc.contextPath}/application/role/drag-save",
        type:'POST',
       // data:{"rid":roleId,"arrMID":arrMID,"arrMSort":arrMSort,"arrAllFID":arrAllFID,"arrFSort":arrFSort},
        data:dragModuleFunctionDTO,
        dataType:"json",
        traditional:true,
        success:function(msg){
            Metronic.stopPageLoading();
            bootbox.alert(msg.info);
        }
    });
}
//获取三维随机整数
function RndNum(){
    var rnd="";
    for(var i=0; i<3; i++){
        rnd+=Math.floor(Math.random()*10);
    }
    return rnd;
}
/**处理不同浏览器取得childNodes数目不同结束**/
function element_child_nodes_length(element_id){
    var child_length=0;
    if(document.getElementById(element_id)){
        //注意 这里的$(element_id)是jQuery通过元素id获取元素的方法
        var l=document.getElementById(element_id).childNodes.length;
        for(var i=0; i<l; i++){
            if(document.getElementById(element_id).childNodes[i].nodeName=="#text"){
            }else{
                child_length+=1;
            }
        }
    }
    return child_length;
}
/***********检查字段长度*****************/
function checkLen(str,len){
    var max_index=9;
    if(len){
        max_index=len;
    }
    // 包含「Opera」文字列
    if(navigator.userAgent.indexOf("Opera")!= -1){
    }
    // 包含「MSIE」文字列
    else if(navigator.userAgent.indexOf("MSIE")!= -1){
        //IE
        max_index=8;
    }
    // 包含「Firefox」文字列
    else if(navigator.userAgent.indexOf("Firefox")!= -1){
    }
    // 包含「Netscape」文字列
    else if(navigator.userAgent.indexOf("Netscape")!= -1){
    }
    // 包含「Safari」文字列
    else if(navigator.userAgent.indexOf("Safari")!= -1){
    }
    var len=0;
    var tmp=str.split("");
    var value="";
    for(var i=0; i<tmp.length; i++){
        if(tmp[i].charCodeAt(0)<299){
            len++;
        }else{
            len+=2;
        }
        if(len<=max_index-3){
            value+=tmp[i];
        }
    }
    if(len<=max_index){
        return str;
    }else{
        return value+"…";
    }
}
$("body").css("min-height",$(window).height()-90);
$(".demo").css("min-height",$(window).height()-160);
//demo里面仅仅接受lyrow类型的拖拽
$(".demo").sortable({
    connectWith:".lyrow"
});
//column里面仅仅接受box类型的拖拽
$(".demo .column").sortable({
    connectWith:".box",
    opacity:.35
});
$(".demo .myModule").sortable({
    opacity:.35,
    connectWith:".lyrow .myModule .lyrow"
});
//拖动行的时候
$(".sidebar-nav .lyrow").draggable({
    connectToSortable:".demo",
    helper:"original",
    //handle: ".drag",
    drag:function(e,t){
        t.helper.width(400);
    },
    stop:function(e,t){
        $(".demo .column").sortable({
            opacity:.35,
            connectWith:".column"
        })
    }
});
//左边拖拽的时候
$(".sidebar-nav .box").draggable({
    connectToSortable:".column",
    helper:"clone",
    drag:function(e,t){
        t.helper.width(100);//拖拽过程中目标项的宽度
    },
    stop:function(e,t){
        //不可重复
    }
});
/**获取所有的功能****/
var currentPage=1; //第几页
var numPerPage=4; //常量,每页显示条数
var numRowCount=6;//常量,每行显示多少列数据
var totalPages=0;
//分页查询
var queryByPage=function(){
    Metronic.startPageLoading();
    var name="";
    if($('#searchText').val()!=undefined&&$('#searchText').val()!=null&&$('#searchText').val()!=""&&$('#searchText').val()!="Search..."){
        //name=encodeURI($('#searchText').val(),'utf-8');
        name=$('#searchText').val();
    }
    $.ajax({
        url:"${rc.contextPath}/application/function/find-all-function-infs",
        type:"POST",
        data:{"currentPage":currentPage,"numPerPage":numPerPage*numRowCount,"name":name},
        dataType:"json",
        traditional:true,
        success:function(data){
            Metronic.stopPageLoading();
            //删除所有子项
            document.getElementById("allFunctions").innerHTML='';
            var array=data.content;
            //总数
            var total=data.totalElements;
            if(array==null||array==undefined||total==0){
                return;
            }
            if(total<=numPerPage*numRowCount){
                document.getElementById("funcPageBar").style.visibility="hidden";//隐藏
            }else{
                document.getElementById("funcPageBar").style.visibility="visible";
            }
            //循环json中的数据
            $.each(array,function(i,functionInf){
                var img=functionInf.icon;
                if(img==undefined||img==null||img==''){
                    img="/assets/drags/img/default.jpg";
                }
                var funcVersion=functionInf.version;
                if(funcVersion=='undefind'||funcVersion==null||funcVersion==""){
                    funcVersion=1.0;
                }
                var str="<div class=\'box box-element ui-draggable  dd-handle\' >"+"<div class=\'views\'>"+"<img class=\'icon-title\' src=\'${rc.contextPath}"+img+"\'/>"+"<a href=\'#\'  class=\'remove\'>"+"<img src=\'${rc.contextPath}/assets/drags/img/ic_delete.png\'/>"+"</a>"+"</div>"+"<p style=\'text-align:center;\' title=\'"+functionInf.name+"("+funcVersion+")"+"\'>"+functionInf.name+"</p>"+"<p style=\'display:none\'>"+functionInf.id+"</p>"+"</div>";
                document.getElementById("allFunctions").innerHTML+=str;
            });
            //总行数
            if(total%(numPerPage*numRowCount)!=0){
                totalPages=total/(numPerPage*numRowCount)+1;
            }else{
                totalPages=total/(numPerPage*numRowCount);
            }
            var options={
                currentPage:currentPage,
                totalPages:totalPages,
                onPageClicked:function(event,originalEvent,type,page){
                    currentPage=page;
                    queryByPage(currentPage,numPerPage);
                }
            };
            $('#funcPager').bootstrapPaginator(options);
            if(totalPages<2){
                document.getElementById("funcPageBar").style.display="none";
            }else{
                document.getElementById("funcPageBar").style.display="block";
            }
            //拖拽的时候
            $(".sidebar-nav .box").draggable({
                connectToSortable:".column",
                revert:"invalid",
                helper:"clone",
                cursor:"move"
            });
        },
        error:function(XMLHttpRequest,textStatus,errorThrown){
            bootbox.alert("网络异常,数据不能成功返回");
        }
    });
    removeElm();
    //拖拽的时候
    $(".sidebar-nav .box").draggable({
        connectToSortable:".column",
        revert:"invalid",
        helper:"clone",
        cursor:"move"
    });
}
//初始化列表
queryByPage(currentPage,numPerPage);
//翻页
$("#gotoPage").bind("click",function(){
    if($("#toPage").val()==null||""==$("#toPage").val()){
        bootbox.alert("请输入跳转页码");
        return;
    }
    var thisPage=parseInt($("#toPage").val());
    if(thisPage>totalPages){
        bootbox.alert("请输入正确跳转页码");
        return;
    }
    $('#funcPager').bootstrapPaginator("show",thisPage);
    currentPage=thisPage;
    queryByPage(currentPage,numPerPage);
});
var currentMPage=1; //第几页
var totalMPages=0;
//对模块进行分页查询
var queryModuleByPage=function(){
    Metronic.startPageLoading();
    /**获取除该角色的模块后的所有的模块**/
    $.ajax({
        url:"${rc.contextPath}/application/module/find-page-module-not-in-rid",
        type:"POST",
        data:{"roleId":roleId,"currentPage":currentMPage,"numPerPage":numPerPage*numRowCount},
        dataType:"json",
        traditional:true,
        success:function(data){
            if(data){
                //删除所有子项
                document.getElementById("allModules").innerHTML='';
                var ril=data.content;
                var total=data.totalElements;
                if(ril==null||ril==undefined){
                    return;
                }
                if(total<=numPerPage*numRowCount){
                    document.getElementById("modulePager").style.visibility="hidden";//隐藏
                }else{
                    document.getElementById("modulePager").style.visibility="visible";
                }
                /**动态节点
                 **/
                $.each(ril,function(i,moduleInf){
                    var img=moduleInf.icon;
                    if(img==undefined||img==null||img==''){
                        img="/assets/drags/img/default.jpg";
                    }
                    var str="<div class=\'lyrow ui-draggable mlyrow prelyrow\' >"+"<div class=\'preview\'>"+"<div class=\'module-handle\'>"+"<img src=\'${rc.contextPath}"+img+"\'/>"+"<p title=\'"+moduleInf.name+"\'>"+checkLen(moduleInf.name,11)+"</p>"+"<p style=\'display:none\'>"+moduleInf.id+"</p>"+"</div>"+"</div>"+"<div id=\'"+moduleInf.id+"\' class=\'view\'>"+"<div class='row-header'>"+"<img src=\'${rc.contextPath}/assets/drags/img/ic_title.png\'/>"+"<span style='padding:5px;'>"+moduleInf.name+"</span>"+"<a href=\'#\' class=\'m_remove\'>"+"<img src=\'${rc.contextPath}/assets/drags/img/ic_delete.png\'/>"+"</a>"+"</div>"+"<img src=\'${rc.contextPath}/assets/drags/img/bg_right.jpg\' style='height:30px; margin:0;width:40%;'/>"+"<div class=\'row clearfix\' style='top:-15px'>"+"<div id=\'content_"+moduleInf.id+"\' class=\'col-md-12 column ui-sortable\' style=\'min-height: 80px;height:100%;\'>";
                    str+="</div>"+"</div>"+"</div>"+"</div>";
                    document.getElementById("allModules").innerHTML+=str;
                });
                //总行数
                if(total%(numPerPage*numRowCount)!=0){
                    totalMPages=total/(numPerPage*numRowCount)+1;
                }else{
                    totalMPages=total/(numPerPage*numRowCount);
                }
                if(totalMPages<2){
                    document.getElementById("modulePageBar").style.display="none";
                }else{
                    document.getElementById("modulePageBar").style.display="block";
                }
                var options={
                    currentPage:currentMPage,
                    totalPages:totalMPages,
                    onPageClicked:function(event,originalEvent,type,page){
                        currentMPage=page;
                        queryModuleByPage(currentMPage,numPerPage);
                    }
                }
                $('#modulePager').bootstrapPaginator(options);
                Metronic.stopPageLoading();
                //column里面仅仅接受box类型的拖拽
                $(".demo .column").sortable({
                    connectWith:".box",
                    opacity:.35
                });
                //拖拽的时候
                $(".sidebar-nav .box").draggable({
                    connectToSortable:".column",
                    revert:"invalid",
                    helper:"clone",
                    cursor:"move"
                });
                //拖动行的时候
                $(".sidebar-nav .lyrow").draggable({
                    connectToSortable:".demo .myModule",
                    helper:"original",//original
                    revert:"invalid",
                    cursor:"move"
                });
                //拖动成功的回调函数
                $("#myModules").droppable({
                    drop:function(event,ui){
                        ui.draggable.removeClass('prelyrow');
                        ui.helper.removeClass('prelyrow');
                        ui.draggable.removeClass('ui-draggable-dragging');
                        ui.draggable.removeAttr('style');
                        //移动到角色的应用中去以后，存在两个问题，角色移动不到该模块中，该模块内部不能移动
                        $(".lyrow").unbind("click");
                        $(".column").unbind("click");
                        //重新注册事件
                        removeElm();
                        //使模块内部能移动
                        $(".demo .column").sortable({
                            connectWith:".box",
                            opacity:.35
                        });
                    }
                });
            }
        }
    });
}
//初始化模块列表
queryModuleByPage(currentMPage,numPerPage);
//翻页
$("#gotoMPage").bind("click",function(){
    if($("#toMPage").val()==null||""==$("#toMPage").val()){
        bootbox.alert("请输入跳转页码");
        return;
    }
    var thisPage=parseInt($("#toMPage").val());
    if(thisPage>totalMPages){
        bootbox.alert("请输入正确跳转页码");
        return;
    }
    $('#modulePager').bootstrapPaginator("show",thisPage);
    currentMPage=thisPage;
    queryModuleByPage(currentMPage,numPerPage);
});
/**当前角色的功能**/
if(roleId){
    Metronic.startPageLoading();
    //获取当前角色的模块信息
    $.ajax({
        url:"${rc.contextPath}/application/function/find-module-by-role-id",
        type:"POST",
        data:{"roleId":roleId},
        dataType:"json",
        traditional:true,
        success:function(data){
            if(data){
                var ril=data;
                if(ril==null||ril==undefined){
                    return;
                }
                /**动态节点
                 * 以模板ID为easyui-accordion中my+面板的ID
                 * 以myul+模板ID为面板中的ul的ＩＤ
                 **/
                $.each(ril,function(i,moduleInf){
                    var img=moduleInf.icon;
                    if(img==undefined||img==null||img==''){
                        img="/assets/drags/img/default.jpg";
                    }
                    var str="<div  class=\'lyrow ui-draggable mlyrow\' >"+"<div class=\'preview\'>"+"<div class=\'module-handle\'>"+"<img src=\'${rc.contextPath}"+img+"\'/>"+"<p title=\'"+moduleInf.name+"\'>"+checkLen(moduleInf.name,11)+"</p>"+"<p style=\'display:none\'>"+moduleInf.id+"</p>"+"</div>"+"</div>"+"<div class=\'view\' id=\'"+moduleInf.id+"\' >"+"<div class='row-header'>"+"<img  src=\'${rc.contextPath}/assets/drags/img/ic_title.png\'/>"+"<span style='padding:5px;'>"+moduleInf.name+"</span>"+"<a href=\'#\' class=\'m_remove\'>"+"<img src=\'${rc.contextPath}/assets/drags/img/ic_delete.png\'/>"+"</a>"+"</div>"+"<img src=\'${rc.contextPath}/assets/drags/img/bg_right.jpg\' style='height:30px; margin:0;width:40%;'/>"+"<div class=\'row clearfix\' style='top:-15px'>"+"<div id=\'content_"+moduleInf.id+"\' class=\'col-md-12 column ui-sortable\' style=\'min-height:80px;height:100%;\'>";
                    //获取模块ID(opts.id),查询该模块下所有功能
                    $.ajax({
                        url:"${rc.contextPath}/application/role/find-function-by-mid",
                        type:"POST",
                        data:{"rid":roleId,"mid":moduleInf.id},
                        dataType:"json",
                        traditional:true,
                        success:function(data){
                            if(data){
                                var list=data;
                                if(list==null||list==undefined||list.length==0){
                                    return;
                                }
                                document.getElementById("content_"+moduleInf.id).innerHTML="";
                                /**动态节点，开始**/
                                $.each(list,function(j,functionInf){
                                    var img=functionInf.icon;
                                    if(img==undefined||img==null||img==''){
                                        img="/assets/drags/img/default.jpg";
                                    }
                                    var funcTitle=checkLen(functionInf.name);
                                    var funcVersion=functionInf.version;
                                    if(funcVersion=='undefind'||funcVersion==null||funcVersion==""){
                                        funcVersion=1.0;
                                    }
                                    var drag="<div class=\'box box-element ui-draggable  dd-handle\'  style=\'display: block;\'>"+"<div class=\'views\' >"+"<img class=\'icon-title\' src=\'${rc.contextPath}"+img+"\'/>"+"<a href=\'#\'  class=\'remove\'>"+"<img src=\'${rc.contextPath}/assets/drags/img/ic_delete.png\'/>"+"</a>"+"</div>"+"<p style=\'text-align:center;\' title=\'"+functionInf.name+"("+funcVersion+")"+"\'>"+funcTitle+"</p>"+"<p style=\'display:none\'>"+functionInf.id+"</p>"+"</div>";
                                    document.getElementById("content_"+moduleInf.id).innerHTML+=drag;
                                });
                            }
                        }
                    });
                    str+="</div>"+"</div>"+"</div>"+"</div>";
                    document.getElementById("myModules").innerHTML+=str;
                });
                //加载隐藏
                Metronic.stopPageLoading();
                //demo里面仅仅接受lyrow类型的拖拽
                $(".demo").sortable({
                    connectWith:".lyrow"
                });
                //column里面仅仅接受box类型的拖拽
                $(".demo .column").sortable({
                    connectWith:".box",
                    opacity:.35
                });
                removeElm();
                //拖动成功的回调函数
                $("#myModules .lyrow .view").droppable({
                    drop:function(event,ui){
                        //修改显示方式
                        var value=checkLen(ui.draggable.find('p').eq(0).html());
                        ui.draggable.find('p').eq(0).html(value);
                    }
                });
            }
        }
    });
}
$('#myTab a').click(function(e){
    e.preventDefault();
    $(this).tab('show');
});
//demo里面仅仅接受lyrow类型的拖拽
$(".demo").sortable({
    connectWith:".lyrow"
});
//查询
$('#selectFunction').bind("click",function(){
    if(currentPage!=1){
        currentPage=1;
    }
    queryByPage(currentPage,numPerPage);
});
</script>
</content>
</html>
