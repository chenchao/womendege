<html>
<head>
    <title>消息发送</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
</head>
<body>

<div class="row" id="editDataDiv" style="margin-right: 0px; margin-left: 0px;">
    <div class="col-md-12" style=" padding-left: 0px; padding-right: 0px;">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-earth"></i>消息发送
                </div>
            </div>
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form method="POST" class="form-horizontal" id="messform" name="messform">
                    <div class="form-body">
                        <h3 class="form-section">基本信息</h3>

                        <div class="alert alert-danger display-hide">
                            <button class="close" data-close="alert"></button>
                            <span id="errorMsg">信息填写不完全,无法推送.</span>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                发送类型<span class="required">*</span>
                            </label>

                            <div class="col-md-6">
                                <select id="messageType" name="messageType" class="form-control" onchange="sendMessType(this);">

                                    <#list messType as m>
                                        <#if m.name() == 'systemmes'>
                                            <option value='${m.name()}' selected='selected'>${m.getM_type()}</option>
                                        <#elseif  m.name() == 'clearuser' || m.name() == 'cleardevice' || m.name() == 'onlineupdate'>
                                                <option value='${m.name()}'>${m.getM_type()}</option>
                                        </#if>
                                    </#list>

                                </select>
                                <span id="messageTypeX" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label" id="cliearDevicexCol">设备</label>

                            <div class="col-md-6">
                                <select id="cliearDevice" name="cliearDevice" class="form-control select2_sample1 mess_text" placeholder="请先选择<清除设备>再选择相应设备." multiple="multiple" disabled="disabled">

                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label" id="appversionxCol">应用版本</label>

                            <div class="col-md-6">
                                <select class="form-control" name="appversion" id="appversion" disabled="disabled">
                                    <option value="-1">请选择</option>
                                    <#list knversionList as v>
                                        <option value='${v.getId()}'>
                                            ${v.getApplicationInfo().getTitle()}_${v.getNum()}_${v.getWorkStatusName()}_${v.getType().name()}
                                        </option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label" id="broadcastxCol">
                                发送范围<span class="required">*</span>
                            </label>

                            <div class="col-md-6">
                                <select id="broadcast" name="broadcast" class="form-control" onchange="sendScopeType(this);">
                                    <option value="NO">--请选择--</option>
                                    <option value="U_L">在线设备(android/ios)</option>
                                    <option value="U">指定设备</option>
                                    <!-- <option value="R">指定角色</option>  -->
                                </select>
                                <span id="broadcastX" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label" id="userinfoxCol">
                                设备
                            </label>

                            <div class="col-md-6">
                                <div class="input-group" style="text-align:left">
                                    <div class="input-icon">
                                        <i class="fa fa-bell-o"></i>
                                        <input id="channelId" name="channelId" type="hidden"/>
                                        <input type="text" id="userinfo" name="userinfo" class="form-control mess_text" placeholder="请选择用户发送消息." readonly="readonly">
                                    </div>
                                    <span class="input-group-btn">
                                        <button id="USER_ADD" class="btn green" type="button" disabled="disabled"><i class="fa fa-user"/></i> 用户</button>
                                    </span>
                                </div>
                                <span id="userinfoX" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group" style="display: none;">
                            <label class="col-md-3 control-label" id="roleNamexCol">
                                角色
                            </label>

                            <div class="col-md-6">
                                <div class="input-group" style="text-align:left">
                                    <div class="input-icon">
                                        <i class="fa fa-bell-o"></i>
                                        <input type="hidden" name="roleinfo" id="roleinfo"/>
                                        <input type="text" id="roleName" name="roleName" class="form-control mess_text" placeholder="请选择角色发送消息." readonly="readonly">
                                    </div>
                                    <span class="input-group-btn">
                                        <button id="ROLE_ADD" class="btn btn-success" type="button" disabled="disabled"><i class="fa icon-search fa-fw"/></i> 角色</button>
                                    </span>
                                </div>
                                <span id="roleNameX" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label" id="titlexCol">
                                android标题<span class="required">*</span>
                            </label>

                            <div class="col-md-6">
                                <input type="text" id="title" name="title" class="form-control mess_text" placeholder="指android消息的标题." onKeyUp="checkLen(this,15)">
                                <span id="titleX" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                URL
                            </label>

                            <div class="col-md-6">
                                <input id="uri" name="uri" type="text" class="form-control mess_text" placeholder="指android消息的url标识">
                            </div>
                        </div>

                        <div class="form-group last">
                            <label class="col-md-3 control-label">
                                内容<span class="required">*</span>
                            </label>

                            <div class="col-md-6">
                                <textarea id="message" name="message" class="form-control" rows="3" placeholder="指IOS消息的推送内容/android消息的正文." onKeyUp="checkLen(this,30)"></textarea>
                                <font color="red">注:标题最多为15个汉字,内容为30个汉字</font>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions fluid">
                        <div class="col-md-offset-5 col-md-3">
                            <button class="btn green" type="button" onclick="sendMessForm()">发送</button>
                            <label style="padding-left: 20px;"></label>
                            <button class="btn default" type="button" onclick="resetBtn()">重置</button>
                        </div>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>
</div>
<!-- row div 对应结束 -->

<div id="role_add_div" class="modal fade" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">角色列表</h4>
            </div>
            <div class="modal-body">
                <div class="row" id="tableDatas">
                    <div class="col-md-12">
                        <div class="portlet">
                            <div class="portlet-body">
                                <table class="table table-striped table-hover table-bordered" id="role_list_table">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="5%">
                                            <input type="checkbox" class="group-checkable">
                                        </th>
                                        <th width="15%">
                                            角色名称
                                        </th>
                                        <th width="15%">
                                            角色代号
                                        </th>
                                        <th width="15%">
                                            备注
                                        </th>
                                        <th width="15%">
                                            操作
                                        </th>
                                    </tr>
                                    <tr role="row" class="filter">
                                        <td>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control form-filter input-sm" name="search_LIKE_name">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control form-filter input-sm" name="search_LIKE_code">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control form-filter input-sm" name="search_LIKE_description"></td>
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
    </div>
</div>


<div id="user_add_div" class="modal fade" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog" style="width:1080px;">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom:none;">
                <button type="button" class="close"  data-dismiss="modal" aria-hidden="true"></button>
            </div>
            <div class="modal-body">
                <div class="row" id="roletableDatas">
                    <div class="col-md-12">
                        <div class="portlet">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-cogs"></i>内容列表</div>
                                <div class="actions">
                                    <div class="btn-group">
                                        <a href="javascript:void(0);" onclick="addCheckData(null ,null ,'device')" class="btn default btn-xs black">
                                            <i class="fa fa-trash-o"></i>
                                            <span class="hidden-480">添加</span>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="portlet-body">
                                <table class="table table-striped table-hover table-bordered" id="user_list_table">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="5%"></th>
                                        <th width="10%">用户名</th>
                                        <th width="5%">设备类型</th>
                                        <th width="5%">状态</th>
                                        <th width="9%">设备号</th>
                                        <th width="9%">手机号</th>
                                        <th width="2%">版本号</th>
                                        <th width="9%">设备名</th>
                                        <th width="9%">登录状态</th>
                                        <th width="9%">应用名</th>
                                        <th width="9%">更新时间</th>
                                        <th width="15%">操作</th>
                                    </tr>
                                    <tr role="row" class="filter">
                                        <td></td>
                                        <!-- 用户名 -->
                                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_loginName"></td>
                                        <td>
                                            <!--设备类型-->
                                            <select name="search_EQ_deviceType" class=" form-filter input-inline input-sm" style="width:70px;">
                                                <option value="">请选择</option>
                                                <#list platType  as q>
                                                    <option value='${q.name()}'>${q.name()}</option>
                                                </#list>
                                            </select>
                                        </td>
                                        <td>
                                            <!--账号状态
                                            <select name="search_EQ_delState" class=" form-filter input-inline input-sm" style="width:70px;">
                                                <option value="">请选择</option>

                                                <#list delStatus  as q>
                                                    <option value='${q.name()}'>${q.getTypeName()}</option>
                                                </#list>
                                            </select> -->
                                        </td>
                                        <!--设备号-->
                                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_deviceToken"></td>
                                        <!--手机号-->
                                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userPhone"></td>
                                        <td></td>
                                        <!--设备名称-->
                                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_deviceName"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> 搜索</button>
                                            <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i> 重置</button>
                                        </td>
                                    </tr>
                                    </thead>
                                    <tbody id="user_table_body">
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

</body>
<content tag="script">
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
<script src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
    FormSamples.init();
    $('#USER_ADD').bind("click",function(){
        $('#user_add_div').modal('show');
    });
});
$("#cliearDevice").append('${deviceBuf}');
var rolegrid=new Datatable();
var $roleList_data_table=$("#role_list_table");
/*rolegrid.init({
    src:$roleList_data_table,
    onSuccess:function(grid){
        console.log(grid);
    },
    onError:function(grid){
    },
    dataTable:{
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/system/role/list",
            "aoColumnDefs":[
                { "bSortable":false,"aTargets":[ 0,4] }
            ],//指定某列不可排序
            "aaSorting":[
                [ 1,"asc" ]
            ],
            "aoColumns":[
                { "sTitle":'<input type="checkbox"  class="group-checkable"/>',"mData":"id","mRender":function(data,type,full){
                    return "<input type='checkbox' name='idCheck' tid='"+data+"' username='"+full.name+"'  class='group-checkable' value='"+data+"'>";
                }},
                {  "sTitle":"角色名称","mData":"name"},
                {  "sTitle":"角色代号","mData":"code"},
                {  "sTitle":"备注","mData":"description","mRender":function(data,type,full){
                    return "<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;wzy:expression(void(this.title=this.innerText));width:150px;' title='"+data+"'>"+data+"</div>";
                }},
                {  "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data,type,full){
                    var a='<a href="javascript:void(0);" onclick="addCheckData(\''+data+'\',\''+full.name+'\' , \'role\')" class= "btn default btn-xs black" title ="添加" ><i class="fa fa-trash-o"></i>添加</a>';
                    return a;
                }}
            ]
        }
    });*/

var grid=new Datatable();
var $userList_data_table=$("#user_list_table");
grid.setAjaxParam("EQ_delState","nodelete");
grid.init({
    src:$userList_data_table,
    onSuccess:function(grid){
        console.log(grid);
    },
    onError:function(grid){
    },
    dataTable:{
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/safety/channel/search-list",
        "aaSorting":[
            [ 1,"asc" ]
        ],
        "aoColumnDefs":[
            { "bSortable":false,"aTargets":[ 0,11 ] }
        ],//指定某列不可排序
        "aoColumns":[
            { "sTitle":'<input type="checkbox"  class="group-checkable"/>',"mData":"id","mRender":function(data,type,full){
                var loginName = full.loginName ;
                return "<input type='checkbox' name='idCheck' tid='"+data+"' username='"+loginName+"'  class='group-checkable' value='"+data+"'>";
            }},
            {  "sTitle":"用户名","mData":"loginName","mRender":function(data,type,full){
                return "<div  title='"+data+"'>"+data+"</div>";
            }},
            {  "sTitle":"设备类型","mData":"deviceType"},
            {  "sTitle":"状态","mData":"delState","mRender":function(data,type,full){
                return '<span class="label label-sm '+full.styleCss+'">'+full.typeName+'</span>';
            }},
            {  "sTitle":"设备号","mData":"deviceToken","mRender":function(data,type,full){
                return "<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;wzy:expression(void(this.title=this.innerText));width:150px;' title='"+data+"'>"+data+"</div>";
            }},
            {  "sTitle":"手机号","mData":"userPhone"},
            {  "sTitle":"版本号","mData":"chversion","mRender":function(data,type,full){
                return "<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;wzy:expression(void(this.title=this.innerText));width:50px;' title='"+data+"'>"+data+"</div>";
            }},
            {  "sTitle":"设备名","mData":"deviceName","mRender":function(data,type,full){
                return "<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;wzy:expression(void(this.title=this.innerText));width:100px;' title='"+data+"'>"+data+"</div>";
            }},
            {  "sTitle":"登录状态","mData":"onlineStat","mRender":function(data,type,full){
                return   full.onlineOff ;
            }},
            {  "sTitle":"应用名","mData":"appTitle"},
            {  "sTitle":"更新时间","mData":"createTimeStr"},
            {  "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data,type,full){
                var a='<a href="javascript:void(0);" onclick="addCheckData(\''+data+'\',\''+ full.loginName +'\' , \'device\')"  class="btn default btn-xs purple" title ="添加"><i class="fa fa-edit"></i>添加</a>';
                return a;
            }}
        ]
    }
});
function addCheckData(data,name,type){
    var ids=[];
    var names=[];
    var username=[];
    var tabGrid;
    if("role"==type){
        tabGrid=rolegrid;
    }else if("device"==type){
        //用户
        tabGrid=grid;
    }
    var obj=$("input[name='idCheck']");
    try{
        if(data){
            ids.push(data);
            names.push(name);
            username.push(name);
        }else{
            $.each(tabGrid.getSelectedRows(),function(key,val){
                var sid=val['value'];
                $.each(obj,function(i,obj){
                    if(sid==$(this).attr("tid")){
                        ids.push($(this).attr("tid"));
                        names.push($(this).attr("username"));
                        username.push($(this).attr("username"));
                        return false;
                    }
                });
            });
            if(ids.length==0){
                Metronic.alert({type:'danger',icon:'warning',message:'请选择一条要添加的信息。',container:tabGrid.getTableWrapper(),place:'prepend'});
                return;
            }
        }
        if("role"==type){
            var roleids=$.trim($('#roleinfo').val());
            var roleName=$.trim($('#roleName').val());
            if(''==roleids&&''==roleName){
                roleids=ids;
                roleName=names;
            }else{
                roleids=roleids+','+ids;
                roleName=roleName+','+names;
            }
            $('#roleinfo').val(removeStr(roleids,','));
            $('#roleName').val(removeStr(roleName,','));
        }else if("device"==type){
            var channelId=$.trim($('#channelId').val());
            var userinfo=$.trim($('#userinfo').val());
            if(''==channelId&&''==userinfo){
                channelId=ids;
                userinfo=username;
            }else{
                channelId=channelId+','+ids;
                userinfo=userinfo+','+username;
            }
            $('#channelId').val(removeStr(channelId,','));
            $('#userinfo').val(removeStr(userinfo,','));
        }
        Metronic.alert({type:'success',message:'添加成功.',container:tabGrid.getTableWrapper(),place:'prepend'});
        setTimeout("$('.alert').alert('close');",6000);
    }catch(e){
        Metronic.alert({type:'danger',icon:'warning',message:'添加失败.',container:tabGrid.getTableWrapper(),place:'prepend'});
        setTimeout("$('.alert').alert('close');",6000);
    }
}
function checkLen(obj,len){
    var str=obj.value;
    if(str.length>=len){
        var value=str.substring(0,len);
        while(value.length>len){
            value=value.substring(0,value.length-1);
        }
        obj.value=value;
    }
}
function removeStr(str,mark){
    str=str+'';
    var arr=str.split(mark);
    var dic={};
    for(var i=arr.length; i--;){
        dic[ arr[i] ]=arr[i];
    }
    var r=[];
    for(var v in dic){
        r.push(dic[v]);
    }
    return r.join();
}
function sendMessType(obj){
    // systemmes("系统消息"),,clearuser("清除用户"),cleardevice("清除设备"), onlineupdate("在线更新");
    var flag=true;
    var title='' , message='';
    var type=obj.value;
    if('systemmes'==type||'clearuser'==type){
        //系统消息
        flag=false;
        $("#broadcastxCol").html('发送范围<span class="required">*</span>');//将 发送范围  框放开
        $("#broadcast").removeAttr("disabled"); //将 发送范围 框置为可用
        $("#cliearDevicexCol").html('设备'); //将 设备 框前面的 * 去掉
        $("#cliearDevice").attr({"disabled":"disabled"});//将设备下拉框置为不可用状态
        $("#appversion").attr({"disabled":"disabled"});
        $("#appversionxCol").html('应用版本');
        $("#userinfoxCol").html('用户<span class="required">*</span>');
        if('clearuser'==type){
            //清除用户
            title='用户清除';
            message='用户清除';
        }
    }else if('cleardevice'==type){
        //清除设备
        $("#cliearDevicexCol").html('设备<span class="required">*</span>'); // 将 设备 框前面加上 *
        $("#cliearDevice").removeAttr("disabled"); // 将 设备 框置为可用
        $("#broadcastxCol").html('发送范围'); //将发送范围前面的 * 去掉
        $("#broadcast").attr({"disabled":"disabled"}); // 将 发送范围 框置为不可用
        $("#appversion").attr({"disabled":"disabled"});
        $("#appversionxCol").html('应用版本');
        $("#cliearDevice").removeAttr("disabled"); // 将 设备 框置为可用
        $("#userinfoxCol").html('用户');
        title='客户端设备清除';
        message='客户端设备清除';
    }else if('onlineupdate'==type){
        //在线更新
        $("#broadcastxCol").html('发送范围');
        $("#broadcast").attr({"disabled":"disabled"}); // 将 发送范围 框置为不可用
        $("#appversion").removeAttr("disabled");
        $("#appversionxCol").html('应用版本<span class="required">*</span>');
        $("#cliearDevice").attr({"disabled":"disabled"}); // 将 设备 框置为可用
        $("#userinfoxCol").html('用户');
        title='新版本更新';
        message='有新版本,请更新';
    }
    $('#title').val(title);
    $('#message').val(message);
    if(flag){
        $("#channelId").val('');
        $("#userinfo").val('');
        $("#roleinfo").val('');
        $("#roleName").val('');
    }
}
function sendScopeType(obj){
    //  U_L  在线用户(android/ios)  ； U 指定用户  ； R   指定角色
    var type=obj.value;
    if('R'==type){
        // 指定角色
        $("#roleNamexCol").html('角色<span class="required">*</span>');
        $("#ROLE_ADD").removeAttr("disabled");//
        $("#USER_ADD").attr({"disabled":"disabled"});
        $("#channelId").val('');
        $("#userinfo").val('');
    }else if('U'==type){ //||'U_L'==type){
        //指定用户
        $("#userinfoxCol").html('用户<span class="required">*</span>');
        $("#USER_ADD").removeAttr("disabled");//
        $("#ROLE_ADD").attr({"disabled":"disabled"});
        $("#roleinfo").val('');
        $("#roleName").val('');
    }else if ( 'U_L'==type){
        $("#userinfoxCol").html('用户<span class="required"></span>');
        $("#USER_ADD").attr({"disabled":"disabled"});
    }else{
        $("#channelId").val('');
        $("#userinfo").val('');
        $("#roleinfo").val('');
        $("#roleName").val('');
    }
    // $('#title').val('');
    // $('#message').val('');
}
function resetBtn(){
    $("#messageType").val('systemmes');
    $("#cliearDevice").attr({"disabled":"disabled"});//将设备下拉框置为不可用状态
    $("#cliearDevicexCol").html('设备'); //将 设备 框前面的 * 去掉
    $("#appversion").val('-1');
    $("#appversion").attr({"disabled":"disabled"});
    $("#broadcastxCol").html('发送范围<span class="required">*</span>');//将 发送范围  框放开
    $("#broadcast").removeAttr("disabled"); //将 发送范围 框置为可用
    $("#broadcast").val('NO');
    $("#channelId").val('');
    $("#userinfo").val('');
    $("#roleinfo").val('');
    $("#roleName").val('');
    $("#title").val('');
    $("#uri").val('');
    $("#message").val('');
}
function sendMessForm(){
    var flag=true;
    var type=$("#messageType").val();
    if('systemmes'==type||'clearuser'==type){
        //系统消息  //清除用户
        var broadcast=$("#broadcast").val();
        if('R'==broadcast){
            // 指定角色
            if(''==$.trim($("#roleinfo").val())||''==$.trim($("#roleName").val())){
                flag=false;
            }
        }else if('U'==broadcast){ ////||'U_L'==broadcast){
            //指定用户
            if(''==$.trim($("#channelId").val())||''==$.trim($("#userinfo").val())){
                flag=false;
            }
        }
    }else if('cleardevice'==type){
        //清除设备
        if(''==$.trim($("#cliearDevice").val())){
            flag=false;
        }
    }else if('onlineupdate'==type){
        //在线更新
        if(''==$.trim($("#appversion").val())){
            flag=false;
        }
    }
    if(''==$.trim($("#title").val())||''==$.trim($("#message").val())){
        flag=false;
    }
    if(!flag){
        bootbox.alert('信息不完全,无法推送');
    }else{
        Metronic.startPageLoading();
        $.ajax({
            "dataType":'json',
            "type":"POST",
            "url":"${rc.contextPath}/safety/message-send/send-message",
            "timeout":10000,
            "data":$('#messform').serialize(),
            "success":function(msg){
                Metronic.stopPageLoading();
                var tip='推送失败';
                if(msg.stat){
                    tip='推送成功';
                }
                bootbox.alert(tip);
            }
        });
    }
}
var FormSamples=function(){
    return {
        init:function(){
            $('.select2_sample1').select2({
                placeholder:"Select a State",
                allowClear:true
            });
        }
    };
}();


</script>
</content>
</html>
