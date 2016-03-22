<html>
<head>
    <title>岗位管理</title>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/select2/select2.css" type="text/css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css" type="text/css"/>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li><i class="fa fa-home"></i><a href="${rc.contextPath}/">系统设置</a><i class="fa fa-angle-right"></i></li>
            <li><a href="#">岗位管理</a></li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-sitemap"></i>岗位结构树</div>
            </div>
            <div class="portlet-body" id="posTree"></div>
        </div>
    </div>
    <div class="col-md-8">
        <div class="row">
            <div class="col-md-12">
                <div class="portlet box green-haze">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-square-o"></i>岗位信息表单
                        </div>
                        <div class="actions">
                            <div class="btn-group">
                                <a class="btn green btn-parent">
                                    <i class="fa fa-plus"></i>
                                    <span class="hidden-480">新增父岗位</span>
                                </a>
                                <button type="button" class="btn green btn-children" disabled="disabled">
                                    <i class="fa fa-plus"></i>
                                    <span class="hidden-480">新增子岗位</span>
                                </button>
                                <button type="button" class="btn blue btn-edit" disabled="disabled">
                                    <i class="fa fa-edit"></i>
                                    <span class="hidden-480">编辑此岗位</span>
                                </button>
                                <button type="button" class="btn red btn-delete" disabled="disabled">
                                    <i class="fa fa-trash-o"></i>
                                    <span class="hidden-480">删除此岗位</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <form class="form-horizontal" action="${rc.contextPath}/system/position/save" method="POST" id="posForm">
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
                                                    <input type="text" class="form-control" name="name" placeholder="请录入岗位名称" readonly="true"/>
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
                                                    <input type="text" class="form-control" name="code" placeholder="请录入岗位编码" readonly="true"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
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
                                    <div class="col-md-6">
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
                            <i class="fa fa-level-down"></i>岗位员工列表
                        </div>
                    </div>
                    <div class="portlet-body" style="max-height:940px;overflow-y:auto;overflow-x:hidden">
                        <table class="table table-striped table-bordered table-hover" id="empInPos">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="15%">登陆名</th>
                                <th width="12%">姓名</th>
                                <th width="20%">邮箱</th>
                                <th width="15%">状态</th>
                                <th width="15%">岗位</th>
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
                                    <select name="search_EQ_major" class="form-control  form-filter input-sm">
                                        <option selected="selected" value>请选择</option>
                                        <option value="ENABLE">主</option>
                                        <option value="DISABLE">副</option>
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
                            <i class="fa fa-level-up"></i>待编入岗位员工列表
                        </div>
                    </div>
                    <div class="portlet-body" style="max-height:940px;overflow-y:auto;overflow-x:hidden">
                        <table class="table table-striped table-bordered table-hover" id="empOutPos">
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
        var form=$('#posForm'), pid=0, text, empInPos=new Datatable(), empOutPos=new Datatable();
        empInPos.init({
            src:$('#empInPos'),
            dataTable:{
                "iDeferLoading":0,
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/system/position/emp-in-pos",
                "aoColumnDefs":[
                    {'bSortable':false,'aTargets':[5]}
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
                    { "sTitle":"岗位","mData":"major","mRender":function(data,t,row){
                        if(data=='ENABLE'){
                            return'<a href="javascript:major('+row.userId+');"><span class="" style="color:red">&nbsp;主</span></a>&nbsp;';
                        }else{
                            return'<a href="javascript:major('+row.userId+');" ><span class="" style="color:green">&nbsp;副</span></a>&nbsp;';
                        }
                    }},
                    { "sTitle":"操作","mData":"userId","mRender":function(data){
                        return'<a class="btn default btn-xs black" href="javascript:leave('+data+');" ><i class="fa fa-level-down"></i>离开</a><a class="btn default btn-xs" href="${rc.contextPath}/system/position/branched-passage/'+pid+'/'+data+'"><i class="fa fa-gavel"></i>分管</a>';
                    }}
                ]
            }
        });
        empOutPos.init({
            src:$('#empOutPos'),
            onSuccess:function(grid){
            },
            onError:function(grid){
            },
            dataTable:{
                "aLengthMenu":[
                    [20,50,100,150],
                    [20,50,100,150]
                ],
                "iDeferLoading":0,
                "iDisplayLength":10,
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/system/position/emp-out-pos",
                "aoColumnDefs":[
                    {'bSortable':false,'aTargets':[3]}
                ],
                "aoColumns":[
                    { "sTitle":"登陆名","mData":"loginName"},
                    { "sTitle":"姓名","mData":"userName"},
                    { "sTitle":"邮箱","mData":"email","mRender":function(data){
                        return "<a href='mailto:"+data+"' target='_blank'>"+data+"</a>";
                    }},
                    { "sTitle":"操作","mData":"userId","sDefaultContent":"","mRender":function(data){
                        return'<a class="btn default btn-xs black" href="javascript:join('+data+');" ><i class="fa fa-level-up"></i>加入</a>';
                    }}
                ]
            }
        });
        $("#posTree").jstree({
            "core":{
                "animation":0,
                "themes":{
                    theme:"classic",
                    "dots":true,
                    "icons":true
                },
                "check_callback":true,
                'data':${posTree}
            },
            "types":{
                "default":{
                    "valid_children":["default","file"]
                }
            },
            "plugins":["types","wholerow"],
        }).on("select_node.jstree",function(node,selectd){
            pid=selectd.node.id;
            text=selectd.node.text;
            if(pid){
                empInPos.setAjaxParam("id",pid);
                empInPos.getDataTable().fnDraw();
                empOutPos.setAjaxParam("id",pid);
                empOutPos.getDataTable().fnDraw();
                $.ajax({
                    url:'${rc.contextPath}/system/position/read/'+pid,
                    type:'GET',
                    success:function(data){
                        $('input[name=id]').val(data.id);
                        $('input[name=supId]').val(data.supId);
                        $('input[name=name]').val(data.name);
                        $('input[name=code]').val(data.code);
                        $('input[name=description]').val(data.description);
                        $("select[name=active] option[value='"+data.active+"']").attr("selected","selected");
                        $('#posForm :input').each(function(a){
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
            $('#posForm :input').each(function(a){
                $(this).enable();
                $(this).attr("readonly",false);
            });
            $('.btn-edit').attr('disabled',"disabled");
            $('.btn-delete').attr('disabled',"disabled");
        });
        $('.btn-children').click(function(){
            form.resetForm();
            $('input[name=id]').val("");
            $('input[name=supId]').val(pid);
            $('#posForm :input').each(function(a){
                $(this).enable();
                $(this).attr("readonly",false);
            });
            $('.btn-edit').attr('disabled',"disabled");
            $('.btn-delete').attr('disabled',"disabled");
        });
        $('.btn-edit').click(function(){
            $('#posForm :input').each(function(a){
                $(this).enable();
                $(this).attr("readonly",false);
            });
        });
        $('.btn-cancel').click(function(){
            $('#posForm :input').each(function(a){
                $(this).attr('disabled',"disabled");
                $(this).attr("readonly","true");
            });
        });
        $('.btn-delete').click(function(){
            if(confirm("确认要删除此组织及其下级岗位编制"))
                $.ajax({
                    url:'${rc.contextPath}/system/position/delete/'+pid,
                    type:'DELETE',
                    success:function(){
                        location.reload();
                    }
                });
        });
        function major(id){
            if(confirm("确认要修改员工主岗位关系"))
                $.ajax({
                    url:'${rc.contextPath}/system/position/major',
                    type:'POST',
                    traditional:true,
                    data:{"posId":pid,"empId":id},
                    success:function(t){
                        if(!t.success){
                            alert("此员工存在主岗位");
                        }
                        empInPos.getDataTable().fnDraw();
                    },
                    error:function(t){
                        if(!t.success){
                            alert("此员工存在主岗位");
                        }
                        empInPos.getDataTable().fnDraw();
                    }
                });
        }
        function join(id){
            if(confirm("确认此员工编入此岗位"))
                $.ajax({
                    url:'${rc.contextPath}/system/position/join',
                    type:'POST',
                    traditional:true,
                    data:{"posId":pid,"empId":id},
                    success:function(){
                        empInPos.getDataTable().fnDraw();
                        empOutPos.getDataTable().fnDraw();
                    }
                });
        }
        function leave(id){
            if(confirm("确认此员工移任此岗位"))
                $.ajax({
                    url:'${rc.contextPath}/system/position/leave',
                    type:'POST',
                    traditional:true,
                    data:{"posId":pid,"empId":id},
                    success:function(){
                        empInPos.getDataTable().fnDraw();
                        empOutPos.getDataTable().fnDraw();
                    }
                });
        }
    </script>
</content>
</html>