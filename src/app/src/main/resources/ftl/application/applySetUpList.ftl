<html>
<head>
    <title>应用设置管理</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/css/plugins.css"/>
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
                <a href="${rc.contextPath}/application/setup">应用设置</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>应用设置列表</div>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/application/setup/create" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480" >新增应用设置</span>
                        </a>
                        <button  class="btn red">
                            <i class="fa fa-trash-o"></i>
                            <span class="hidden-480"   onclick="deleteList();">删除应用设置</span>
                        </button>
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
                    <table class="table table-striped table-bordered table-hover" id="apply_setup_data_table">
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
            src:$("#apply_setup_data_table"),
            onSuccess:function(grid){
            },
            onError:function(grid){
            },
            dataTable:{
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/application/setup/apply-setup-list",
                "aoColumnDefs":[
                    { "bSortable":false,"aTargets":[ 0,1,6 ] }
                ],//指定某列不可排序
                "aaSorting":[
                    [ 2,"desc" ]
                ],
                "aoColumns":[
                    { "sWidth":"1%","sTitle":'<input type="checkbox" class= "checkAllBox" onclick="checkAllBox(this)"  title="全选" class="group-checkable" />',"sDefaultContent":"","mRender":function(data,type,full){
                        return '<div class="checker"  ><span class=""><input type="checkbox" class="checkboxes" checked="" name="checkBox" value="'+full.id+'"></span></div>';
                    }},
                    { "sWidth":"1%","sTitle":'应用图标',"mData":"applicationInfo.icon","sDefaultContent":"","mRender":function(data,type,full){
                        if(data){
                            return '<img src="${rc.contextPath}'+data+'" width="60px" height="60px">';
                        }else{
                            return '<img src="${rc.contextPath}'+commonImgAddress+'" width="60px" height="60px" style="margin:auto 0;" >';
                        }
                    }},
                    {  "sWidth":"20%","sTitle":"应用名称","mData":"applicationInfo.title"},
                    {  "sWidth":"20%","sTitle":"IOS包名","mData":"iosPackage"},
                    {  "sWidth":"15%","sTitle":"ANDROID包名","mData":"packageName"},
                    {  "sWidth":"15%","sTitle":"更新日期","mData":"updateTime","sDefaultContent":"","mRender":function(data,type,full){
                        var time='';
                        if(data){
                            time=new Date(data).format('yyyy-MM-dd hh:mm');
                        }
                        return time;
                    }},
                    {  "sWidth":"10%","sTitle":"操作","sDefaultContent":"","mRender":function(data,type,full){
                        var a='<a href="${rc.contextPath}/application/setup/update/'+full.id+'" class="btn btn-xs blue"  title="编辑" ><i class="fa fa-edit"></i>编辑</a>';
                        var b='<a  href="javascript:void(0);" onclick="deleteInfo('+full.id+')" class= "btn btn-xs red" title ="删除"><i class="fa fa-trash-o"></i>删除</a>';
                        return a+b;
                    }}
                ]
            }
        });
        /**
         *  选择框选中事件
         * */
        jQuery('#apply_setup_data_table').on('change','tbody tr .checkboxes',function(){
            $(this).parents('span').toggleClass("checked");
        });
        /**
         * 点击查询 模糊查询应用设置信息
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
         * 模糊查询应用设置信息
         * */
        function selectAjax(appName){
            grid.setAjaxParam("appName",appName);
            grid.getDataTable().fnDraw();
        }
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
                    $('#message').removeClass('alert-success');
                    $('#message').addClass('alert-danger');
                }
            }
        });
        /**
         * 删除单个应用设置信息
         **/
        function deleteInfo(id){
            commonDelete({"id":id},'确认应用设置?','删除应用设置','${rc.contextPath}/application/setup/delete');
        }
        /**
         *  删除多个应用设置信息
         */
        function deleteList(){
            var ids=[], finIds=[], ch=$("#apply_setup_data_table span.checked >input[name='checkBox']");
            if(ch){
                ch.each(function(i,n){
                    ids.push(n.value);
                });
            }
            if(ids==''||ids==null||ids.length==0){
                bootbox.alert('请选择需要删除的应用设置');
                return false;
            }
            commonDelete({"ids":ids},'确认批量删除应用设置?','批量删除应用设置','${rc.contextPath}/application/setup/delete-all');
        }
        /**
         *  公共删除应用设置信息
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

    </script>
</content>
</html>
