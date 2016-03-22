<html>
<head>
    <title>证书管理</title>
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
                <a href="${rc.contextPath}/safety/certificate">证书管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>内容列表</div>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/safety/certificate/add-certificate" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">新增</span>
                        </a>
                        <button onclick="deleteAll(null)" class="btn red">
                            <i class="fa fa-trash-o"></i>
                            <span class="hidden-480">删除</span>
                        </button>
                    </div>
                </div>
            </div>

            <div class="portlet-body">
                <#if message??>
                    <#if messaction == '1'>
                        <div id="message" class="alert alert-success">
                            <button data-dismiss="alert" class="close">×</button>
                        ${message}
                        </div>
                    <#elseif  messaction == '0'>
                        <div id="message" class="alert alert-danger">
                            <button data-dismiss="alert" class="close">×</button>
                             ${message}
                        </div>
                    </#if>
                </#if>
                <div class="table-container">
                    <table class="table table-striped table-bordered table-hover" id="certificate_data_table">
                        <thead>
                        <tr role="row" class="heading">
                            <th width="1%"></th>
                            <th width="10%">平台类型</th>
                            <th width="5%">证书密码</th>
                            <th width="9%">证书状态</th>
                            <th width="9%">应用名称</th>
                            <th width="15%">操作</th>
                        </tr>
                        <tr role="row" class="filter">
                            <td></td>
                            <!-- 平台类型 -->
                            <td>
                                <select name="search_EQ_platformType" class=" form-filter input-inline input-sm">
                                    <option value=''>请选择</option>
                                        <#list platformType as q>
                                            <option value='${q.name()}'>${q.name()}</option>
                                        </#list>
                                </select>
                            </td>
                            <!-- 证书密码 -->
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_certificatePwd"></td>
                            <td>
                                <!-- 证书状态 -->
                                <select name="search_EQ_workStatus" class=" form-filter input-inline input-sm">
                                    <option value=''>请选择</option>
                                    <#list workStatus as q>
                                        <#if q.name() == 'usable' ||  q.name() == 'unusable'>
                                            <option value='${q.name()}'>${q.getTypeName()}</option>
                                        </#if>
                                    </#list>

                                </select>
                            </td>
                            <!-- 应用名称 -->
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_applicationInfo.title"></td>
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
    <script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        setTimeout("$('.alert').alert('close');",3000);
        var tabGrid=new Datatable();
        var $certificate_data_table=$("#certificate_data_table");
        tabGrid.init({
            src:$certificate_data_table,
            onSuccess:function(grid){
                console.log(grid);
            },
            onError:function(grid){
            },
            dataTable:{
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/safety/certificate/search-list",
                "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0,5 ] }]  ,//指定某列不可排序
                "aaSorting":[
                    [ 1,"asc" ]
                ],
                "aoColumns":[
                    { "sTitle":'<input type="checkbox"  class="group-checkable"/>' ,"mData":"id","mRender":function(data,type,full){
                        return "<input type='checkbox' class='group-checkable' value='"+data+"'>";
                    }},
                    {  "sTitle":"平台类型","mData":"platformType"},
                    {  "sTitle":"证书密码","mData":"certificatePwd"},
                    {  "sTitle":"证书状态","mData":"workStatus","mRender":function(data,type,full){
                        return '<span>'+full.workStatusType+'</span>';
                    }},
                    {  "sTitle":"应用名称","mData":"applicationInfo.title"},
                    {  "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data){
                        var a='<a href="${rc.contextPath}/safety/certificate/update-certificate/'+data+'" class="btn btn-xs blue"  title="编辑" ><i class="fa fa-edit"></i>编辑</a>';
                        var b='<a href="javascript:void(0);" onclick="deleteAll(\''+data+'\')" class= "btn btn-xs red" title ="删除" ><i class="fa fa-trash-o"></i>删除</a>';
                        return a+b;
                    }}
                ]
            }
        });
        function deleteAll(data){
            var ids=[];
            if(data){
                ids.push(data);
            }else{
                $.each(tabGrid.getSelectedRows(),function(key,val){
                    ids.push(val['value']);
                });
                if(ids.length==0){
                    Metronic.alert({type:'danger',icon:'warning',message:'请选择一条要删除的信息。',container:tabGrid.getTableWrapper(),place:'prepend'});
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
                                url:'${rc.contextPath}/safety/certificate/delete',
                                type:'POST',
                                timeout:2000,
                                data:{"ids":ids  },
                                dataType:"json",
                                traditional:true,
                                success:function(msg){
                                    Metronic.stopPageLoading();
                                    if(msg.stat){
                                        Metronic.alert({type:'success',message:'删除成功.',container:tabGrid.getTableWrapper(),place:'prepend'});
                                    }else{
                                        Metronic.alert({type:'danger',icon:'warning',message:'删除失败.',container:tabGrid.getTableWrapper(),place:'prepend'});
                                    }
                                    setTimeout("$('.alert').alert('close');",3000);
                                    tabGrid.getDataTable().fnDraw();
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
