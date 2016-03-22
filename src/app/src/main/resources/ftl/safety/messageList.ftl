<html>
<head>
    <title>消息查询</title>
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
                <a href="${rc.contextPath}/">安全管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="${rc.contextPath}/safety/message-search">消息查询</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>消息列表</div>
                <div class="actions">
                    <div class="btn-group">
                        <button onclick="deleteAll(null)" class="btn red">
                            <i class="fa fa-trash-o"></i>
                            <span class="hidden-480">删除</span>
                        </button>

                    </div>
                </div>
            </div>

            <div class="portlet-body">
                <#if message??>
                    <div id="message" class="alert alert-success">
                        <button data-dismiss="alert" class="close">×</button>
                        ${message}
                    </div>
                </#if>
                <div class="table-container">
                    <table class="table table-striped table-bordered table-hover" id="searchList_data_table">
                        <thead>
                        <tr role="row" class="heading">
                            <th width="3%"></th>
                            <th width="10%">接收者</th>
                            <th width="10%">标题</th>
                            <th width="9%">内容</th>
                            <th width="2%">应用名</th>
                            <th width="9%">消息类型</th>
                            <th width="9%">消息状态</th>
                            <th width="9%">类别</th>
                            <th width="5%">设备名</th>
                            <th width="9%">设备号</th>
                            <th width="9%">发送时间</th>
                            <th width="15%">操作</th>
                        </tr>
                        <tr role="row" class="filter">
                            <td></td>
                            <!-- 接收者 -->
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_deviceInfo.loginName"></td>
                            <!-- 标题 -->
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_title"></td>
                            <!-- 内容 -->
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_content"></td>
                            <td></td>
                            <td>
                                <!--消息类型-->
                                <select name="search_EQ_messType" class=" form-filter input-inline input-sm" style="width:60px;">
                                    <option value="">请选择</option>
                                    <#list messType as q>
                                        <option value='${q.name()}'>${q.getM_type()}</option>
                                    </#list>
                                </select>
                            </td>
                            <td>
                                <!--消息状态-->
                                <select name="search_EQ_msgState" class=" form-filter input-inline input-sm" style="width:60px;">
                                    <option value="">请选择</option>
                                    <#list msgState as q>
                                        <option value='${q.name()}'>${q.getM_state()}</option>
                                    </#list>
                                </select>
                            </td>
                            <td>
                                <!--类别-->
                                <select name="search_EQ_plateMess" class=" form-filter input-inline input-sm" style="width:60px;">
                                    <option value="">请选择</option>
                                    <#list plateMess as q>
                                        <option value='${q.name()}'>${q.name()}</option>
                                    </#list>
                                </select>
                            </td>
                            <!-- 设备名 -->
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_deviceInfo.deviceName"></td>
                            <!-- 设备号 -->
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_token"></td>
                            <td></td>
                            <td>
                                <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> 搜索</button>
                                <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i> 重置</button>
                            </td>
                        </tr>
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
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        var grid=new Datatable();
        var $searchList_data_table=$("#searchList_data_table");
        grid.init({
            src:$searchList_data_table,
            onSuccess:function(grid){
            },
            onError:function(grid){
            },
            dataTable:{
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/safety/message-search/search-list",
                "aaSorting":[
                    [ 1,"asc" ]
                ],
                "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0,11 ] }]  ,//指定某列不可排序
                "aoColumns":[
                    { "sTitle":'<input type="checkbox"  class="group-checkable"/>' ,"mData":"id","mRender":function(data,type,full){
                        return "<input type='checkbox' name='idCheck' class='group-checkable' value='"+data+"'>";
                    }},
                    {  "sTitle":"接收者","mData":"deviceInfo.loginName"},
                    {  "sTitle":"标题","mData":"title","mRender":function(data,type,full){
                        return "<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;wzy:expression(void(this.title=this.innerText));width:85px;' title='"+data+"'>"+data+"</div>";
                    }},
                    {  "sTitle":"内容","mData":"content","mRender":function(data,type,full){
                        return "<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;wzy:expression(void(this.title=this.innerText));width:100px;' title='"+data+"'>"+data+"</div>";
                    }},
                    {  "sTitle":"应用名","mData":"deviceInfo.appTitle"},
                    {  "sTitle":"消息类型","mData":"messTypeName"},
                    {  "sTitle":"消息状态","mData":"msgStateName"},
                    {  "sTitle":"类别","mData":"plateMessName"},
                    {  "sTitle":"设备名","mData":"deviceInfo.deviceName"},
                    {  "sTitle":"设备号","mData":"deviceInfo.deviceToken" ,"mRender":function(data,type,full){
                        return "<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;wzy:expression(void(this.title=this.innerText));width:150px;' title='"+data+"'>"+data+"</div>";
                    }},
                    //{  "sTitle":"发送时间","mData":"createTimeStr"},
                    {  "sTitle":"发送时间","mData":"updateTime" ,"mRender":function(data){
                        var time='';
                        if(data){
                            time=new Date(data).format('yyyy-MM-dd hh:mm');
                        }
                        return time;
                    }},
                    {  "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data){
                        var a='<a href="javascript:void(0);" onclick="deleteAll(\''+data+'\')" class= "btn btn-xs red" title ="删除" ><i class="fa fa-trash-o"></i>删除</a>';
                        return a;
                    }}
                ]
            }
        });
        function deleteAll(data){
            var ids=[];
            if(data){
                ids.push(data);
            }else{
                $.each(grid.getSelectedRows(),function(key,val){
                    ids.push(val['value']);
                });
                if(ids.length==0){
                    Metronic.alert({type:'danger',icon:'warning',message:'请选择一条要删除的信息。',container:grid.getTableWrapper(),place:'prepend'});
                    return;
                }
            }
            bootbox.dialog({
                message: "您是否确认批量删除?",
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
                            Metronic.startPageLoading();
                            $.ajax({
                                url:'${rc.contextPath}/safety/message-search/delete',
                                type:'POST',
                                timeout:2000,
                                data:{"ids":ids },
                                dataType:"json",
                                traditional:true,
                                success:function(msg){
                                    Metronic.stopPageLoading();
                                    if(msg.stat){
                                        Metronic.alert({type:'success',message:'删除成功.',container:grid.getTableWrapper(),place:'prepend'});
                                    } else {
                                        Metronic.alert({type:'danger',icon:'warning',message:'删除失败.',container:grid.getTableWrapper(),place:'prepend'});
                                    }
                                    grid.getDataTable().fnDraw();
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
