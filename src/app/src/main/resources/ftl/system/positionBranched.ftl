<html>
<head>
    <title>岗位分管管理</title>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/select2/select2.css" type="text/css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css" type="text/css"/>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li><i class="fa fa-home"></i><a href="${rc.contextPath}/">系统设置</a><i class="fa fa-angle-right"></i></li>
            <li><a href="${rc.contextPath}/system/position">岗位管理</a><i class="fa fa-angle-right"></i></li>
            <li>岗位分管</li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-square-o"></i>岗位信息
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-3">岗位:${ep.id.pos.name}</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-3">领导:${ep.id.emp.userName}</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-level-down"></i>岗位分管员工列表
                </div>
            </div>
            <div class="portlet-body" style="max-height:940px;overflow-y:auto;overflow-x:hidden">
                <table class="table table-striped table-bordered table-hover" id="empInPosBranched">
                    <thead>
                    <tr role="row" class="heading">
                        <th width="15%">登陆名</th>
                        <th width="12%">姓名</th>
                        <th width="20%">邮箱</th>
                        <th width="15%">状态</th>
                        <th width="23%">操作</th>
                    </tr>
                    <tr role="row" class="filter">
                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_loginName"></td>
                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userName"></td>
                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_email"></td>
                        <td>
                            <select name="search_EQ_job" class="form-control  form-filter input-sm">
                                <option selected="selected" value>请选择</option>
                                <option value="ENABLE">在职</option>
                                <option value="DISABLE">离职</option>
                            </select>
                        </td>
                        <td>
                            <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i>搜索</button>
                            <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i>重置</button>
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
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-level-up"></i>待编入分管员工列表
                </div>
            </div>
            <div class="portlet-body" style="max-height:940px;overflow-y:auto;overflow-x:hidden">
                <table class="table table-striped table-bordered table-hover" id="empOutPosBranched">
                    <thead>
                    <tr role="row" class="heading">
                        <th width="20%">登陆名</th>
                        <th width="20%">姓名</th>
                        <th width="30%">邮箱</th>
                        <th width="30%">操作</th>
                    </tr>
                    <tr role="row" class="filter">
                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_loginName"></td>
                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userName"></td>
                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_email"></td>
                        <td>
                            <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i>搜索</button>
                            <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i>重置</button>
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
</body>
<content tag="script">
    <script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/scripts/datatable.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/lib/jquery.form.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/localization/messages_zh.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jstree/dist/jstree.js" type="text/javascript"></script>
    <script type="text/javascript">
        var pid, text, empInPosBranched=new Datatable(), empOutPosBranched=new Datatable();
        empInPosBranched.init({
            src:$('#empInPosBranched'),
            dataTable:{
                "iDisplayLength":10,
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/system/position/emp-in-pos-branched/${ep.id.pos.id}/${ep.id.emp.id}",
                "aoColumnDefs":[
                    {'bSortable':false,'aTargets':[4]}
                ],
                "aoColumns":[
                    { "sTitle":"登陆名","mData":"loginName"},
                    { "sTitle":"姓名","mData":"userName"},
                    { "sTitle":"邮箱","mData":"email","mRender":function(data){
                        return "<a href='mailto:"+data+"'>"+data+"</a>";
                    }},
                    { "sTitle":"状态","mData":"status","mRender":function(data){
                        return "ENABLE"==data?"在职":"离职";
                    }},
                    { "sTitle":"操作","mData":"userId","sDefaultContent":"","mRender":function(data){
                        return'<a class="btn" href="javascript:leave('+data+');" ><i class="fa fa-level-down"></i>离开</a>';
                    }}
                ]
            }
        });
        empOutPosBranched.init({
            src:$('#empOutPosBranched'),
            dataTable:{
                "iDisplayLength":10,
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/system/position/emp-out-pos-branched/${ep.id.emp.id}",
                "aoColumnDefs":[
                    {'bSortable':false,'aTargets':[3]}
                ],
                "aoColumns":[
                    { "sTitle":"登陆名","mData":"loginName"},
                    { "sTitle":"姓名","mData":"userName"},
                    { "sTitle":"邮箱","mData":"email","mRender":function(data){
                        return "<a href='mailto:"+data+"'>"+data+"</a>";
                    }},
                    { "sTitle":"操作","mData":"userId","sDefaultContent":"","mRender":function(data,t,row){
                        return'<a class="btn" href="javascript:join(\''+data+'\',\''+row.userName+'\');" ><i class="fa fa-level-up"></i>加入</a>';
                    }}
                ]
            }
        });
        function join(id,name){
            if(confirm("确认此员工编入[${ep.id.emp.userName}]领导"))
                $.ajax({
                    url:'${rc.contextPath}/system/position/branched/join',
                    type:'POST',
                    traditional:true,
                    data:{"posId":${ep.id.pos.id},"posCode":"${ep.id.pos.code}","posName":"${ep.id.pos.name}","leaderId":${ep.id.emp.id},"leaderName":"${ep.id.emp.userName}","empId":id,"empName":name},
                    success:function(){
                        empInPosBranched.getDataTable().fnDraw();
                        empOutPosBranched.getDataTable().fnDraw();
                    }
                });
        }
        function leave(id){
            if(confirm("确认此员工移除[${ep.id.emp.userName}]领导"))
                $.ajax({
                    url:'${rc.contextPath}/system/position/branched/leave',
                    type:'POST',
                    traditional:true,
                    data:{"empId":id},
                    success:function(){
                        empInPosBranched.getDataTable().fnDraw();
                        empOutPosBranched.getDataTable().fnDraw();
                    }
                });
        }
    </script>
</content>
</html>