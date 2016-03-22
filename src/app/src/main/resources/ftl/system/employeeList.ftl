<html>
<head>
    <title>员工管理</title>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/select2/select2.css" type="text/css"/>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">系统设置</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">员工管理</a>
            </li>
        </ul>
    </div>
</div>
<div class="row main">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-user"></i>员工列表
                </div>
                <div class="actions">
                    <a href="${rc.contextPath}/system/employee/create" class="btn green">
                        <i class="fa fa-plus"></i>
                        <span class="hidden-480">新增员工</span>
                    </a>
                </div>
            </div>
            <div class="row">
            </div>
            <div class="portlet-body">
            <#if message>
                <div class="alert alert-success">
                    <button data-dismiss="alert" class="close">×</button>
                ${(message)!}
                </div>
            </#if>
                <div class="table-container">
                    <table class="table table-striped table-bordered table-hover" id="emp_list_table">
                        <thead>
                        <tr role="row" class="heading">
                            <th width="5%">照片</th>
                            <th width="10%">用户Id</th>
                            <th width="10%">登陆名</th>
                            <th width="10%">姓名</th>
                            <th width="15%">邮箱</th>
                            <th width="10%">在职</th>
                            <th width="10%">来自系统</th>
                            <th width="18%">操作</th>
                        </tr>
                        <tr role="row" class="filter">
                            <td></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userId"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_loginName"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userName"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_email"></td>
                            <td>
                                <select name="search_EQ_job" class="form-control  form-filter input-sm">
                                    <option selected="selected" value>请选择</option>
                                    <option value="ENABLE">在职</option>
                                    <option value="DISABLED">离职</option>
                                </select>
                            </td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userSystem"></td>
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
    <script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/scripts/datatable.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/common/common.js" type="text/javascript"></script>
    <script type="text/javascript">
        var grid=new Datatable();
        grid.init({
            src:$('#emp_list_table'),
            onSuccess:function(grid){
            },
            onError:function(grid){
            },
            dataTable:{
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/system/employee",
                "aoColumnDefs":[
                    { "bSortable":false,"aTargets":[ 0,7] }
                ],//设置不排序得列
                "aoColumns":[
                    { "sTitle":"照片","mData":"imageAddress","sDefaultContent":"","mRender":function(data,type,full){
                        if(data){
                            if(data.indexOf('http')!=-1){
                                return '<img src="'+data+'" width="60px" height="60px" style="margin:auto 0;" >';
                            }else{
                                return '<img src="${rc.contextPath}'+data+'" width="60px" height="60px" style="margin:auto 0;" >';
                            }
                        }else{
                            return '<img src="${rc.contextPath}'+'/assets/global/img/default.jpg'+'" width="60px" height="60px" style="margin:auto 0;" >';
                        }
                    }},
                    { "sTitle":"三方系统ID","mData":"userId"},
                    { "sTitle":"登陆名","mData":"loginName","mRender":function(data,type,row){
                        return'<a href="${rc.contextPath}/system/employee/update/'+row.id+'">'+data+'</a>';
                    }},
                    { "sTitle":"姓名","mData":"userName"},
                    { "sTitle":"邮箱","mData":"email","mRender":function(data){
                        return "<a href='mailto:"+data+"'>"+data+"</a>";
                    }},
                    { "sTitle":"状态","mData":"job","sDefaultContent":"","mRender":function(data){
                        return "ENABLE"==data?"在职":"离职";
                    }},
                    { "sTitle":"来自系统","mData":"userSystem"},
                    { "sTitle":"操作","mData":"id","mRender":function(data,type,row){
                        return'<a class="btn btn-xs red " href="${rc.contextPath}/system/employee/delete/'+row.id+'"><i class="fa fa-trash-o"></i>删除</a>';
                    }}
                ]
            }
        });
    </script>
</content>
</html>