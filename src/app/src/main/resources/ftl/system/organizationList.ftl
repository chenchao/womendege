<html>
<head>
    <title>组织管理</title>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/select2/select2.css" type="text/css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css" type="text/css"/>
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
            <li><a href="#">组织管理</a>
            </li>
        </ul>
    </div>
</div>
<div class="row">
<div class="col-md-4">
    <div class="portlet box green-haze">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-sitemap"></i>组织结构树</div>
        </div>
        <div class="portlet-body" id="orgTree"></div>
    </div>
</div>
<div class="col-md-8">
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-square-o"></i>组织信息表单
                </div>
                <div class="actions">
                    <div class="btn-group">
                        <a class="btn green btn-parent">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">新增父组织</span>
                        </a>
                        <button type="button" class="btn green btn-children" disabled="disabled">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">新增子组织</span>
                        </button>
                        <button type="button" class="btn blue btn-edit" disabled="disabled">
                            <i class="fa fa-edit"></i>
                            <span class="hidden-480">编辑此组织</span>
                        </button>
                        <button type="button" class="btn red btn-delete" disabled="disabled">
                            <i class="fa fa-trash-o"></i>
                            <span class="hidden-480">删除此组织</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="portlet-body form">
                <form class="form-horizontal" action="${rc.contextPath}/system/organization/save" method="POST" id="orgForm">
                    <input type="hidden" name="id"/>
                    <input type="hidden" name="supId" value="0"/>

                    <div class="form-body">
                        <div class="alert alert-danger display-hide">
                            <button class="close" data-close="alert"></button>
                            请检查后再提交
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">名称</label>

                                    <div class="col-md-9">
                                        <div class="input-icon right">
                                            <i class="fa"></i>
                                            <input type="text" class="form-control" name="name" placeholder="请录入组织名称" readonly="true"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">编码</label>

                                    <div class="col-md-9">
                                        <div class="input-icon right">
                                            <i class="fa"></i>
                                            <input type="text" class="form-control" name="code" placeholder="请录入组织编码" readonly="true"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">类型</label>

                                    <div class="col-md-9">
                                        <select name="orgType" class="form-control" disabled="disabled">
                                            <option value="GROUP">集团</option>
                                            <option value="COMPANY">公司</option>
                                            <option value="ORGANIZATION">机构</option>
                                            <option value="DEPARTMENT">部门</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">状态</label>

                                    <div class="col-md-9">
                                        <select name="active" class="form-control" disabled="disabled">
                                            <option value="ENABLE">是</option>
                                            <option value="DISABLE">否</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">排序</label>

                                    <div class="col-md-9">
                                        <div class="input-icon right">
                                            <i class="fa"></i>
                                            <input type="text" class="form-control" name="seq" placeholder="请录入排序号" readonly="true"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="row">
                            <div class="col-md-6">
                            </div>
                            <div class="col-md-6">
                                <div class="col-md-offset-3 col-md-9">
                                    <button type="submit" class="btn green" disabled="disabled">保存</button>
                                    <button type="button" class="btn default btn-cancel" disabled="disabled">取消</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-level-down"></i>组织下属员工列表
                </div>
            </div>
            <div class="portlet-body" style="max-height:940px;overflow-y:auto;overflow-x:hidden">
                <table class="table table-striped table-hover table-bordered" id="empInOrg">
                    <thead>
                    <tr role="row" class="heading">
                        <th width="15%">登陆名</th>
                        <th width="12%">姓名</th>
                        <th width="20%">邮箱</th>
                        <th width="15%">状态</th>
                        <th width="15%">主组织</th>
                        <th width="15%">主负责人</th>
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
                            <select name="search_EQ_charge" class="form-control  form-filter input-sm">
                                <option selected="selected" value>请选择</option>
                                <option value="1">是</option>
                                <option value="0">否</option>
                            </select>
                        </td>
                        <td>
                            <select name="search_EQ_major" class="form-control  form-filter input-sm">
                                <option selected="selected" value>请选择</option>
                                <option value="1">是</option>
                                <option value="0">否</option>
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
                    <i class="fa fa-level-up"></i>待加入员工列表
                </div>
            </div>
            <div class="portlet-body" style="max-height:940px;overflow-y:auto;overflow-x:hidden">
                <table class="table table-striped table-hover table-bordered" id="empOutOrg">
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
<script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/localization/messages_zh.js" type="text/javascript"></script>
<script src="${rc.contextPath}/assets/global/plugins/jstree/dist/jstree.js" type="text/javascript"></script>
<script type="text/javascript">
var form=$('#orgForm'), oid=0, text;
var empInOrg=new Datatable();
empInOrg.init({
    src:$('#empInOrg'),
    dataTable:{
        "iDeferLoading":0,
        "iDisplayLength":10,
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/system/organization/emp-in-org",
        "aoColumnDefs":[{'bSortable':false,'aTargets':[6]}],
        "aoColumns":[
            { "sTitle":"登陆名","mData":"loginName"},
            { "sTitle":"姓名","mData":"userName"},
            { "sTitle":"邮箱","mData":"email","mRender":function(data){
                return "<a href='mailto:"+data+"'>"+data+"</a>";
            }},
            { "sTitle":"状态","mData":"status","mRender":function(data){
                return "ENABLE"==data?"在职":"离职";
            }},
            { "sTitle":"主组织","mData":"major","mRender":function(data,t,row){
                if(data==1){
                    return'<a href="javascript:major('+row.userId+');"><span class="" style="color:red">是</span></a>';
                }else{
                    return'<a href="javascript:major('+row.userId+');"><span class="" style="color:green">否</span></a>';
                }
            }},
            { "sTitle":"主负责人","mData":"charge","mRender":function(data,t,row){
                if(data==1){
                    return'<a href="javascript:charge('+row.userId+');"><span class="" style="color:red">是</span></a>';
                }else{
                    return'<a href="javascript:charge('+row.userId+');"><span class="" style="color:green">否</span></a>';
                }
            }},
            { "sTitle":"操作","mData":"userId","sDefaultContent":"","mRender":function(data){
                return'<a class="delete btn default btn-xs black" href="javascript:leave('+data+');"><i class="fa fa-level-down"></i>离开</a>';
            }}
        ]
    }
});
var empOutOrg=new Datatable();
empOutOrg.init({
    src:$('#empOutOrg'),
    dataTable:{
        "iDeferLoading":0,
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/system/organization/emp-out-org",
        "aoColumnDefs":[
            {'bSortable':false,'aTargets':[3]}
        ],
        "aoColumns":[
            { "sTitle":"登陆名","mData":"loginName"},
            { "sTitle":"姓名","mData":"userName"},
            { "sTitle":"邮箱","mData":"email","mRender":function(data){
                return "<a href='mailto:"+data+"'>"+data+"</a>";
            }},
            { "sTitle":"操作","mData":"userId","sDefaultContent":"","mRender":function(data){
                return'<a class="delete btn default btn-xs black" href="javascript:join('+data+');"><i class="fa fa-level-up"></i>加入</a>';
            }}
        ]
    }
});
$("#orgTree").jstree({
    "core":{
        "animation":0,
        "themes":{
            theme:"classic",
            "dots":true,
            "icons":true
        },
        "check_callback":true,
        'data':${orgTree}
    },
    "types":{
        "default":{
            "valid_children":["default","file"]
        }
    },
    "plugins":["types","wholerow"]
}).on("select_node.jstree",function(node,selectd){
    oid=selectd.node.id;
    text=selectd.node.text;
    if(oid){
        empInOrg.setAjaxParam("id",oid);
        empInOrg.getDataTable().fnDraw();
        empOutOrg.setAjaxParam("id",oid);
        empOutOrg.getDataTable().fnDraw();
        $.ajax({
            url:'${rc.contextPath}/system/organization/read/'+oid,
            type:'GET',
            success:function(data){
                $('input[name=id]').val(data.id);
                $('input[name=supId]').val(data.supId);
                $('input[name=name]').val(data.name);
                $('input[name=code]').val(data.code);
                $('input[name=seq]').val(data.seq);
                $('input[name=description]').val(data.description);
                $("select[name=orgType] option[value='"+data.orgType+"']").attr("selected","selected");
                $("select[name=active] option[value='"+data.active+"']").attr("selected","selected");
                $('#orgForm :input').each(function(a){
                    $(this).attr('disabled',"disabled");
                    $(this).attr("readonly","true");
                });
                $('.btn-children').enable();
                $('.btn-edit').enable();
                $('.btn-delete').enable();
            }
        });
    }
});
var error=$('.alert-danger',form);
form.validate({
    errorElement:'span',
    errorClass:'help-block help-block-error',
    focusInvalid:false,
    rules:{
        name:{
            minlength:2,
            maxlength:30,
            required:true
        },
        code:{
            required:true
        },
        orgType:{
            required:true
        },
        active:{
            required:true
        }
    },
    invalidHandler:function(event,validator){
        error.show();
        Metronic.scrollTo(error,-200);
    },
    errorPlacement:function(e,element){
        var icon=$(element).parent('.input-icon').children('i');
        icon.removeClass('fa-check').addClass("fa-warning");
        icon.attr("data-original-title",e.text()).tooltip({'container':'body'});
    },
    highlight:function(element){
        $(element).closest('.form-group').removeClass("has-success").addClass('has-error');
    },
    unhighlight:function(element){
    },
    success:function(label,element){
        var icon=$(element).parent('.input-icon').children('i');
        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
        icon.removeClass("fa-warning").addClass("fa-check");
    },
    submitHandler:function(form){
        error.hide();
        form.submit();
    }
});
$('.btn-parent').click(function(){
    form.resetForm();
    $('input[name=id]').val("");
    $('input[name=supId]').val(0);
    $('#orgForm :input').each(function(a){
        $(this).enable();
        $(this).attr("readonly",false);
    });
    $('.btn-edit').attr('disabled',"disabled");
    $('.btn-delete').attr('disabled',"disabled");
});
$('.btn-children').click(function(){
    form.resetForm();
    $('input[name=id]').val("");
    $('input[name=supId]').val(oid);
    $('#orgForm :input').each(function(a){
        $(this).enable();
        $(this).attr("readonly",false);
    });
    $('.btn-edit').attr('disabled',"disabled");
    $('.btn-delete').attr('disabled',"disabled");
});
$('.btn-edit').click(function(){
    $('#orgForm :input').each(function(a){
        $(this).enable();
        $(this).attr("readonly",false);
    });
});
$('.btn-cancel').click(function(){
    form.resetForm();
    $('#orgForm :input').each(function(a){
        $(this).attr('disabled',"disabled");
        $(this).attr("readonly","true");
    });
});
$('.btn-delete').click(function(){
    if(confirm("确认要删除此组织及其下级组织"))
        $.ajax({
            url:'${rc.contextPath}/system/organization/delete/'+oid,
            type:'DELETE',
            success:function(){
                location.reload();
            }
        });
});
function charge(id){
    if(confirm("确认要修改用户部门主负责状态"))
        $.ajax({
            url:'${rc.contextPath}/system/organization/charge',
            type:'POST',
            traditional:true,
            data:{"orgId":oid,"empId":id},
            success:function(){
                empInOrg.getDataTable().fnDraw();
            }
        });
}
function major(id){
    if(confirm("确认要修改用户部门主组织关系"))
        $.ajax({
            url:'${rc.contextPath}/system/organization/major',
            type:'POST',
            traditional:true,
            data:{"orgId":oid,"empId":id},
            success:function(t){
                console.log(t);
                if(!t.success){
                    alert("此员工存在主组织");
                }
                empInOrg.getDataTable().fnDraw();
            },
            error:function(t){
                console.log(t);
                if(!t.success){
                    alert("此员工存在主组织");
                }
                empInOrg.getDataTable().fnDraw();
            }
        });
}
function join(id){
    if(confirm("确认此员工加入此部门"))
        $.ajax({
            url:'${rc.contextPath}/system/organization/join',
            type:'POST',
            traditional:true,
            data:{"orgId":oid,"empId":id},
            success:function(){
                empInOrg.getDataTable().fnDraw();
                empOutOrg.getDataTable().fnDraw();
            }
        });
}
function leave(id){
    if(confirm("确认此员工离开此部门"))
        $.ajax({
            url:'${rc.contextPath}/system/organization/leave',
            type:'POST',
            traditional:true,
            data:{"orgId":oid,"empId":id},
            success:function(){
                empInOrg.getDataTable().fnDraw();
                empOutOrg.getDataTable().fnDraw();
            }
        });
}
</script>
</content>
</html>