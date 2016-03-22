<html>
<head>
    <title>应用管理</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
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
                <a href="${rc.contextPath}/application/list">应用清单</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>应用列表</div>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/application/list/create" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480" >新增应用</span>
                        </a>
                        <button  class="btn red">
                            <i class="fa fa-trash-o"></i>
                            <span class="hidden-480"  onclick="deleteList();">删除应用</span>
                        </button>
                        <#--<a class="btn default btn-sm btn-default" href="javascript:void(0)" data-toggle="dropdown">
                            <i class="fa fa-cogs"></i>
                            <span class="hidden-480" style="color: #0000ff;font-weight: bold;">应用同步清单</span>
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <li>
                                <a href="javascript:synToCloud(0);">
                                    全部同步至云端
                                </a>
                            </li>
                            <li>
                                <a href="javascript:synToCloud(1);">
                                    选中同步至云端
                                </a>
                            </li>
                            <li>
                                <a href="javascript:synFromCloud(0);">
                                    云端同步至本地
                                </a>
                            </li>
                        </ul>-->
                    </div>
                </div>
            </div>
            <div class="portlet-body">
                <#if message>
                    <div class="alert alert-success">
                        <button data-dismiss="alert" class="close">×</button>
                    ${(message)!}
                    </div>
                </#if>
                <div class="table-container">
                    <div class="table-actions-wrapper">
                        <b class="form-control input-inline input-small input-sm" style="border: 0px; text-align: right;">应用名称：</b><input type="text" class="form-control table-group-action-input form-control input-inline input-small input-sm" id="selectInput" maxlength="15">
                        <button class="btn btn-sm yellow table-group-action-submit"><i class="fa fa-search"></i> 查询</button>
                        <button class="btn btn-sm red table-group-action-times"><i class="fa fa-times"></i> 重置</button>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="apply_data_table">
                        <thead>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<content tag="script">
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script type="text/javascript">
        var grid=new Datatable();
        grid.init({
            src:$("#apply_data_table"),
            onSuccess:function(grid){
            },
            onError:function(grid){
            },
            dataTable:{
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/application/list/apply-list",
                "aaSorting":[
                    [ 2,"desc" ]
                ],
                "aoColumnDefs":[
                    { "bSortable":false,"aTargets":[ 0,1,6 ] }
                ],//设置不排序得列
                "aoColumns":[
                    { "sWidth":"1%","sTitle":'<input type="checkbox" class= "checkAllBox" onclick="checkAllBox(this)"  title="全选" class="group-checkable" />',"sDefaultContent":"","mRender":function(data,type,full){
                        return '<div class="checker"  ><span class=""><input type="checkbox" class="checkboxes" checked="" name="checkBox" value="'+full.id+'"></span></div>';
                    }},
                    { "sWidth":"1%","sTitle":'应用图标',"mData":"icon","sDefaultContent":"","mRender":function(data,type,full){
                        if(data){
                            return '<img src="${rc.contextPath}'+data+'" width="60px" height="60px">';
                        }else{
                            return '<img src="${rc.contextPath}'+commonImgAddress+'" width="60px" height="60px" style="margin:auto 0;" >';
                        }
                    }},
                    {  "sWidth":"20%","sTitle":"应用名称","mData":"title"},
                    {  "sWidth":"20%","sTitle":"所属企业","mData":"forFirm"},
                    {  "sWidth":"15%","sTitle":"应用状态","mData":"workStatusName"},
                    {  "sWidth":"15%","sTitle":"更新日期","mData":"updateTime","sDefaultContent":"","mRender":function(data,type,full){
                        var time='';
                        if(data){
                            time=new Date(data).format('yyyy-MM-dd hh:mm');
                        }
                        return time;
                    }},
                    {  "sWidth":"10%","sTitle":"操作","sDefaultContent":"","mRender":function(data,type,full){
                        var a='<a href="${rc.contextPath}/application/list/update/'+full.id+'" class="btn btn-xs blue"  title="编辑" ><i class="fa fa-edit"></i>编辑</a>';
                        var b='<a  href="javascript:void(0);" onclick="deleteInfo('+full.id+')" class= "btn btn-xs red" title ="删除"><i class="fa fa-trash-o"></i>删除</a>';
                        return a+b;
                    }}
                ]
            }
        });
        /**
         *  选择框选中事件
         * */
        jQuery('#apply_data_table').on('change','tbody tr .checkboxes',function(){
            $(this).parents('span').toggleClass("checked");
        });
        /**
         * 点击查询 模糊查询应用信息
         * */
        $('.table-group-action-submit').click(function(){
            selectAjax($("#selectInput").val());
        });
        /**
         * 点击重置 按钮
         * */
        $('.table-group-action-times').click(function(){
            $("#selectInput").val('');
            selectAjax('');
        });
        /**
         * 关闭提示信息
         * */
        function alertClose(){
            $(".alert").alert('close');
        }
        jQuery(function($){
            var message="${message}", stat="${stat}";
            if(null==message||''==message){
                setInterval(alertClose,3*1000);
            }else{
                if('true'==stat){
                    $('#message').removeClass('alert-danger');
                    $('#message').addClass('alert-success');
                    setInterval(alertClose,3*1000);
                }else{
                    $('#message').addClass('alert-danger');
                    $('#message').removeClass('alert-success');
                }
            }
        });
        /**
         * 模糊查询应用信息
         * */
        function selectAjax(appName){
            grid.setAjaxParam("appName",appName);
            grid.getDataTable().fnDraw();
        }
        /**
         * 删除单个应用信息
         **/
        function deleteInfo(id){
            commonDelete({"id":id},'确认删除应用,以及相关联的的版本,应用设置,设备信息?','删除应用','${rc.contextPath}/application/list/delete');
        }
        /**
         *  删除多个应用信息
         */
        function deleteList(){
            var ids=[], finIds=[], ch=$("#apply_data_table span.checked >input[name='checkBox']");
            if(ch){
                ch.each(function(i,n){
                    ids.push(n.value);
                });
            }
            if(ids==''||ids==null||ids.length==0){
                bootbox.alert('请选择需要删除的应用');
                return false;
            }
            commonDelete({"ids":ids},'确认批量删除应用,以及相关联的的版本,应用设置,设备信息?','批量删除应用','${rc.contextPath}/application/list/delete-all');
        }
        /**
         *  公共删除应用信息
         * */
        function commonDelete(data,message,title,url){
            bootbox.dialog({
                message:message,
                title:title,
                buttons:{
                    main:{
                        label:"取消",
                        className:"gray",
                        callback:function(){
                            $(this).hide();
                        }
                    },
                    success:{
                        label:"确定",
                        className:"green",
                        callback:function(){
                            $.ajax({
                                url:url,
                                type:'POST',
                                data:data,
                                dataType:"json",
                                traditional:true,
                                success:function(msg){
                                    if(msg&&msg.stat){
                                        bootbox.alert('删除成功');
                                        grid.getDataTable().fnDraw();
                                    }else{
                                        bootbox.alert('删除失败');
                                    }
                                }
                            });
                        }
                    }
                }
            });
        }
        //同步至云端
        function synToCloud(type){
            var ids=[];
            if(1==type||'1'==type){
              var  ch=$("#apply_data_table span.checked >input[name='checkBox']");
                if(ch){
                    ch.each(function(i,n){
                        ids.push(n.value);
                    });
                }
                if(ids==''||ids==null||ids.length==0){
                    bootbox.alert('请选择需要同步至云端的应用');
                    return false;
                }
            }else{
                ids.push(0);
            }
            bootbox.dialog({
                message: '确认同步数据到云端?',
                title: '同步数据',
                buttons: {
                    main: {
                        label: "取消",
                        className: "gray",
                        callback: function() {
                            $(this).hide();
                        }
                    },
                    success: {
                        label: "确定",
                        className: "green",
                        callback: function() {
                            $.ajax({
                                url: '${rc.contextPath}/cloud/application/syn-to-cloud',
                                type:'POST',
                                data:{"ids":ids,"tip":type},
                                dataType:"json",
                                traditional:true,
                                success:function(msg){
                                    if(msg&&msg.resultCode=='200'){
                                        bootbox.alert('同步成功');
                                    }else{
                                        bootbox.alert(msg.msg);
                                    }
                                }
                            });
                        }
                    }
                }
            });
        }

        //云端同步至本地
        function synFromCloud(tip){
            bootbox.dialog({
                message: '确认同步云端数据到本地?',
                title: '同步数据',
                buttons: {
                    main: {
                        label: "取消",
                        className: "gray",
                        callback: function() {
                            $(this).hide();
                        }
                    },
                    success: {
                        label: "确定",
                        className: "green",
                        callback: function() {
                            $.ajax({
                                url: '${rc.contextPath}/cloud/application/syn-from-cloud',
                                type:'POST',
                                dataType:"json",
                                data:{"tip":tip},
                                traditional:true,
                                success:function(msg){
                                    if(msg&&msg.resultCode=='200'){
                                        bootbox.alert('同步成功');
                                    }else{
                                        bootbox.alert(msg.msg);
                                    }
                                }
                            });
                        }
                    }
                }
            });
        }
    </script>
</content>
</html>
