<html>
<head>
    <title>团队新增/编辑</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">系统管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="${rc.contextPath}/system/team/">团队管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>团队<#if action?? && action =='add'>新增<#else>编辑</#if>
                </div>
            </div>
            <div class="portlet-body form">
                <form id="myForm" action="${rc.contextPath}/system/team/save-edit" onsubmit="return checkInfo();" class="form-horizontal" method="POST">
                    <input type="hidden" name="id" value="${team.id}"/>
                    <input type="hidden" name="action" value="${action}"/>
                    <input type="hidden" id="oldId" name="oldId"  value="${oldId}">

                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">名称<span class="required">
											 *
										</span></label>

                                    <div class="col-md-5">
                                        <input name="name" type="text" class="form-control"  placeholder="请输入团名称" value="${team.name}" required="true">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">团队负责人<span class="required">
											 *
										</span></label>
                                    <div class="col-md-5">
                                        <input type="hidden" id="userId" name="userId" class="form-control" value="${team.master.id}">
                                        <input placeholder="请选择团队负责人" id="loginName"  name="loginName"  class="form-control empbutton" value="${team.master.loginName}" required="true" readonly>
                                    </div>
                                    <span class="input-group-btn">
                                        <button id="user_add" class="btn green" type="button" onclick="showWinEmployee()">选择</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">描述</label>
                                    <div class="col-md-5">
                                        <textarea name="description" type="text" class="form-control"  placeholder="请选择团队描述">${team.description}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">状态<span class="required">
											 *
										</span></label>
                                    <div class="col-md-5">
                                        <select name="active" class="form-control">
                                            <#list status  as q>
                                                <#if q.name()==team.active>
                                                    <option value='${q.name()}' selected='selected'>${q.typeName}</option>
                                                <#else>
                                                    <option value='${q.name()}'>${q.typeName}</option>
                                                </#if>
                                            </#list>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="submit" class="btn green">保存</button>
                            <button type="button" class="btn default" onclick="javascript:window.location.href='${rc.contextPath}/system/team';">取消</button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- 展示所有的员工列表 -->
            <div id="emp_manager_list_div" class="modal fade" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog" style="width:900px;">
                    <div class="modal-content">
                        <div class="modal-header" style="border-bottom:none;">
                            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row" id="tableDatas">
                                <div class="col-md-12">
                                    <div class="portlet">
                                        <div class="portlet-title">
                                            <div class="caption"><i class="fa fa-cogs"></i>员工列表</div>
                                        </div>
                                        <div class="portlet-body">
                                            <table class="table table-striped table-bordered table-hover" id="emp_manager_list_table">
                                                <thead>
                                                <tr role="row" class="heading">
                                                    <th width="5%">照片</th>
                                                    <th width="10%">用户Id</th>
                                                    <th width="10%">登陆名</th>
                                                    <th width="10%">姓名</th>
                                                    <th width="10%">邮箱</th>
                                                    <th width="15%">在职</th>
                                                    <th width="10%">来自系统</th>
                                                    <th width="18%">操作</th>
                                                </tr>
                                                <tr role="row" class="filter">
                                                    <td></td>
                                                    <!-- 用户Id -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userId"></td>
                                                    <!-- 登陆名 -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_loginName"></td>
                                                    <!-- 姓名 -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userName"></td>
                                                    <!-- 邮箱 -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_email"></td>
                                                    <!-- 在职 -->
                                                    <td>
                                                        <select name="search_EQ_job" class="form-control  form-filter input-sm">
                                                            <option selected="selected" value>请选择</option>
                                                            <#list station  as q>
                                                                <option value='${q.name()}'>${q.typeName}</option>
                                                            </#list>
                                                        </select>
                                                    </td>
                                                    <!-- 来自系统 -->
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
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
    <script type="text/javascript"
            src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.js"></script>
    <script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>

    <script type="text/javascript">

        var empManagerGrid=new Datatable();
        empManagerGrid.init({
            src:$('#emp_manager_list_table'),
            onSuccess:function(empManagerGrid){
            },
            onError:function(empManagerGrid){
            },
            dataTable:{
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/system/team/emp-member-list",
                "aoColumnDefs":[
                    {'bSortable':false,'aTargets':[0]},
                    {'bSortable':false,'aTargets':[7]}
                ],
                "aoColumns":[
                    { "sTitle":"照片","mData":"imageAddress","sDefaultContent":"","mRender":function(data,type,full){
                        if(!data){
                            data="/assets/global/img/default.jpg";
                        }
                        return '<img src="${rc.contextPath}'+data+'" width="60px" height="60px" style="margin:auto 0;" >';
                    }},
                    { "sTitle":"三方系统ID","mData":"userId"},
                    { "sTitle":"登陆名","mData":"loginName"},
                    { "sTitle":"姓名","mData":"userName"},
                    { "sTitle":"邮箱","mData":"email","mRender":function(data){
                        if(null==data){
                            data = '' ;
                        } else {
                            data = "<a href='mailto:"+data+"'>"+data+"</a>";
                        }
                        return data ;
                    }},
                    { "sTitle":"状态","mData":"job","sDefaultContent":"","mRender":function(data){
                        return "ENABLE"==data?"在职":"离职";
                    }},
                    { "sTitle":"来自系统","mData":"userSystem"},
                    { "sTitle":"操作","mData":"id","mRender":function(data,type,row){
                        return '<a href="javascript:void(0);" onclick="addEmployee(\''+data+'\',\''+row.loginName+'\')" class="btn default btn-xs purple" title ="添加"><i class="fa fa-save"></i>添加</a>';
                    }}
                ]
            }
        });

        function showWinEmployee(){
            empManagerGrid.getDataTable().fnDraw();
            $('#emp_manager_list_div').modal('show');
        }

        function addEmployee(userId ,loginName){
            $('#userId').val(userId);
            $('#loginName').val(loginName);
            $('#emp_manager_list_div').modal('hide');
        }

        /**
         * 检测 表单所填是否符合规则
         */
        function checkInfo(){
            return $('#myForm').valid();
        }
    </script>
</content>
</html>
