<html>
<head>
    <title>设备管理</title>
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
    <!-- END PAGE LEVEL STYLES -->
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
                <a href="${rc.contextPath}/safety/channel">设备管理</a>
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
            <button   onclick="cleanPhoneDel('user')" class="btn red">
                <i class="fa fa-user"></i>
                <span class="hidden-480">用户擦除</span>
            </button>
            <button  onclick="cleanPhoneDel('device')" class="btn red">
                <i class="fa fa-trash-o"></i>
                <span class="hidden-480">设备擦除</span>
            </button>
            <button  onclick="openSendMess(null)" class="btn blue">
                <i class="icon-envelope-letter"></i>
                <span class="hidden-480">发送消息</span>
            </button>
            <button onclick="cancelUserDel(null)" class="btn green">
                <i class="fa fa-user"></i>
                <span class="hidden-480">取消用户擦除</span>
            </button>
            <button onclick="deleteAll(null ,'channel')" class="btn red">
                <i class="fa fa-trash-o"></i>
                <span class="hidden-480">删除设备</span>
            </button>
        </div>
    </div>
</div>

<div class="portlet-body">
    <#if message??>
        <div id="messageTip" class="alert alert-success">
            <button data-dismiss="alert" class="close">×</button>
            ${message}
        </div>
    </#if>
    <div class="table-container">
        <table class="table table-striped table-bordered table-hover" id="searchList_data_table">
            <thead>
            <tr role="row" class="heading">
                <th width="5%"></th>
                <th width="5%">用户名</th>
                <th width="5%">设备类型</th>
                <th width="8%">账号状态</th>
                <th width="8%">设备号</th>
                <th width="8%">手机号</th>
                <th width="8%">版本号</th>
                <th width="8%">设备名</th>
                <th width="5%">登录状态</th>
                <th width="3%">应用</th>
                <th width="5%">更新时间</th>
                <th width="15%">操作</th>
            </tr>
            <tr role="row" class="filter">
                <td></td>
                <!-- 用户名 -->
                <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_loginName"></td>
                <td>
                    <!--设备类型-->
                    <select name="search_EQ_deviceType" class=" form-filter input-inline input-sm" style="width:80px;">
                        <option value='' selected='selected'>请选择</option>
                        <#list platType as q>
                                <option value='${q.name()}'>${q.name()}</option>
                        </#list>
                    </select>
                </td>
                <td>
                    <!--账号状态-->
                    <select name="search_EQ_delState" class=" form-filter input-inline input-sm" style="width:70px;">
                        <option value='' selected='selected'>请选择</option>
                        <#list delStatus as q>
                            <option value='${q.name()}' >${q.getTypeName()}</option>
                        </#list>
                    </select>
                </td>
                <!--设备号-->
                <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_deviceToken"></td>
                <!--手机号-->
                <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userPhone"></td>
                <td></td>
                <!--设备名-->
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
            <tbody>
            </tbody>
        </table>
    </div>
</div>

<div id="user_mess_div" class="modal fade" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog" style="width:1010px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">消息列表</h4>
            </div>
            <div class="modal-body">
                <div class="row" id="tableDatas">
                    <div class="col-md-12">
                        <div class="portlet">
                            <div class="portlet-body">
                                <table class="table table-striped table-bordered table-hover" id="messList_data_table">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th width="7%">接收者</th>
                                        <th width="10%">标题</th>
                                        <th width="12%">内容</th>
                                        <th width="4%">消息类型</th>
                                        <th width="2%">所属系统</th>
                                        <th width="4%">消息状态</th>
                                        <th width="4%">类别</th>
                                        <th width="9%">更新时间</th>
                                        <th width="4%">操作</th>
                                    </tr>
                                    <tr role="row" class="filter">
                                        <input type="hidden" class="form-control form-filter input-sm" name="search_LIKE_deviceId" id="deviceId">
                                        <!-- 接收者 -->
                                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_deviceInfo.loginName"></td>
                                        <!-- 标题 -->
                                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_title"></td>
                                        <!-- 内容 -->
                                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_content"></td>
                                        <td>
                                            <!--消息类型-->
                                            <select name="search_EQ_messType" class=" form-filter input-inline input-sm" style="width:70px;">
                                                <option value="" selected='selected'>请选择</option>
                                                <#list messType as q>
                                                    <option value='${q.name()}'>${q.getM_type()}</option>
                                                </#list>
                                            </select>
                                        </td>
                                        <!-- 所属系统 -->
                                        <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_fromSys" style="width:70px;"></td>
                                        <td>
                                            <!--消息状态-->
                                            <select name="search_EQ_msgState" class=" form-filter input-inline input-sm" style="width:70px;">
                                                <option value="" selected='selected'>请选择</option>
                                                <#list msgState as q>
                                                    <option value='${q.name()}'>${q.getM_state()}</option>
                                                </#list>
                                            </select>
                                        </td>
                                        <td>
                                            <!--类别-->
                                            <select name="search_EQ_plateMess" class=" form-filter input-inline input-sm" style="width:70px;">
                                                <option value="" selected='selected'>请选择</option>
                                                <#list plateMess as q>
                                                    <option value='${q.name()}'>${q.name()}</option>
                                                </#list>
                                            </select>
                                        </td>
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
        </div>
    </div>
</div>

<div id="send_mess_div" class="modal fade" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="row" id="sendMessTable">
                <div class="col-md-12">
                    <div class="portlet box green">
                        <div class="portlet-title">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">发送消息</h4>
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form method="POST" class="form-horizontal"  id="messform" name="messform" >
                                <input type="hidden" id="broadcast" name="broadcast" value="U">
                                <input type="hidden" id="cliearDevice" name="cliearDevice" value="">
                                <input type="hidden" id="uri" name="uri" value="">
                                <div class="form-body">
                                    <h3 class="form-section">基本信息</h3>
                                    <div class="alert alert-danger display-hide">
                                        <button class="close" data-close="alert" ></button>
                                        <span id="errorMsg">发送失败,请重试.</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label" id="userinfoxCol">
                                            用户
                                        </label>
                                        <div class="col-md-6">
                                            <input id="channelId" name="channelId" type="hidden"/>
                                            <input type="text" id="userinfo" name="userinfo" class="form-control mess_text"  style="width:300px; "  readonly="readonly">
                                                            <span id="userinfoX" class="help-block">
                                                            </span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">
                                            设备号
                                        </label>
                                        <div class="col-md-6">
                                            <input type="text" id="deviceNum" name="deviceNum"  class="form-control mess_text"    style="width:300px; "  readonly="readonly"/>
															<span id="deviceNumX" class="help-block">
															</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">
                                            设备名称
                                        </label>
                                        <div class="col-md-6">
                                            <input type="text" id="deviceName" name="deviceName"  class="form-control mess_text"    style="width:300px; "  readonly="readonly"/>
															<span id="deviceNameX" class="help-block">
															</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">
                                            发送类型<span class="required">*</span>
                                        </label>
                                        <div class="col-md-6">
                                            <select id="messageType" name="messageType"  class="form-control" onchange="sendMessType(this);" style="width:300px; " >
                                                <#list messType as m>
                                                    <#if m.name() == 'systemmes'>
                                                        <option value='${m.name()}' selected='selected'>${m.getM_type()}</option>
                                                    <#elseif  m.name() == 'clearuser' || m.name() == 'cleardevice'>
                                                            <option value='${m.name()}'>${m.getM_type()}</option>
                                                    </#if>
                                                </#list>
                                            </select>
                                            <span id="messageTypeX" class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label" id="titlexCol">
                                            android标题<span class="required">*</span>
                                        </label>

                                        <div class="col-md-6">
                                            <input type="text" id="title" name="title" class="form-control mess_text" placeholder="指android消息的标题." onKeyUp="checkLen(this,15)" style="width:300px; "   />
                                            <span id="titleX" class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group last">
                                        <label class="col-md-3 control-label">
                                            内容<span class="required">*</span>
                                        </label>

                                        <div class="col-md-6">
                                            <textarea id="message" name="message" class="form-control" style="width: 302px; height: 102px;" placeholder="指IOS消息的推送内容/android消息的正文." onKeyUp="checkLen(this,30)"></textarea>
                                            <font color="red">注:标题最多为15个汉字,内容为30个汉字</font>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-actions fluid">
                                    <div class="col-md-offset-4 col-md-9">
                                        <button class="btn green" type="button" onclick="sendMessForm()">发送</button>
                                        <label style="padding-left: 20px;"></label>
                                        <button class="btn default" type="button" onclick="resetBtn()" >重置</button>
                                    </div>
                                </div>
                            </form>
                            <!-- END FORM-->
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
<script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
<script type="text/javascript">

var grid=new Datatable();
var $searchList_data_table=$("#searchList_data_table");
grid.init({
    src:$searchList_data_table,
    onSuccess:function(grid){
        console.log(grid);
    },
    onError:function(grid){
    },
    dataTable:{
        "bProcessing": true,//查询显示
        "bStateSave": false,
        "bAutoWidth": true,//列自适应浏览器宽度
        "bDestroy": true,
        "bRetrieve": true,
        "bSort": true,//排序
        "bPaginate": true,//是否开启滚动条
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/safety/channel/search-list?r=" + Math.random(),
        "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0,11 ] }]  ,//指定某列不可排序
        "aaSorting":[
            [ 1,"asc" ]
        ],
        "aoColumns":[
            { "sTitle":'<input type="checkbox" name="checkDeviceName" class="group-checkable"/>' ,"mData":"id","mRender":function(data,type,full){
                var username = full.loginName ;
                return "<input type='checkbox' name='idCheck' tid='"+data+"' username='"+username+"' token='"+full.deviceToken+"' devname='"+full.deviceName+"' accountState='"+full.delState+"' cliearDevice='"+full.deviceToken+"' class='group-checkable' value='"+data+"'>";
            }},
            {  "sTitle":"用户名","mData":"loginName","mRender":function(data,type,full){
                return data ;
            }},
            {  "sTitle":"设备类型","mData":"deviceType"},
            {  "sTitle":"账号状态","mData":"delState","mRender":function(data,type,full){
                return '<span class="label label-sm '+full.styleCss+'">'+full.typeName+'</span>';
            }},
            {  "sTitle":"设备号","mData":"deviceToken","mRender":function(data,type,full){
                return "<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;wzy:expression(void(this.title=this.innerText));width:150px;' title='"+data+"'>"+data+"</div>";
            }},
            {  "sTitle":"手机号","mData":"userPhone"},
            {  "sTitle":"版本号","mData":"chversion","mRender":function(data,type,full){
                return "<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;wzy:expression(void(this.title=this.innerText));width:57px;' title='"+data+"'>"+data+"</div>";
            }},
            {  "sTitle":"设备名","mData":"deviceName","mRender":function(data){
                return "<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;wzy:expression(void(this.title=this.innerText));width:60px;' title='"+data+"'>"+data+"</div>";
            }},
            {  "sTitle":"登录状态", "mData": "onlineStat" , "mRender": function(data, type, full) {
                return '<span class="label label-sm '+full.styleOnlineCss+'">'+full.onlineOff+'</span>';
            }},
            {  "sTitle":"应用","mData":"appTitle"},
            {  "sTitle":"更新时间","mData":"updateTime" ,"mRender":function(data){
                var time='';
                if(data){
                    time=new Date(data).format('yyyy-MM-dd hh:mm');
                }
                return time;
            }},
            {  "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data,type ,full){
                var a='<a href="javascript:void(0);" onclick="seeMess(\''+data+'\')" class="btn btn-xs blue" title ="查看消息"><i class="fa fa-search"></i>查看消息</a>';
                var b='<a href="javascript:void(0);" onclick="deleteAll(\''+data+'\' , \'channel\')" class= "btn btn-xs red" title ="删除" ><i class="fa fa-trash-o"></i>删除</a>';
                var c='<a href="javascript:void(0);" onclick="openSendMess(\''+data+'\')" class= "btn btn-xs blue" title ="发送消息" ><i class="fa icon-envelope-letter"></i>发送消息</a>';
                var d='<a href="javascript:void(0);" onclick="cancelUserDel(\''+data+'\')" class= "btn btn-xs green" title ="取消用户擦除" ><i class="fa fa-user"></i>取消用户擦除</a>';

                // isdelete("已擦除"),dodelete("待擦除"),device("设备擦除"),account("账号擦除"),nodelete("正常"); // 正常登录
                var res =a+b ;
                var state = full.delState ;
                if('account'==state){
                    res += d ;
                } else if('nodelete'==state){
                    res += c ;
                }
                return res ;
            }}
        ]
    }
});
var messgrid=new Datatable();
var $messList_data_table=$("#messList_data_table");
messgrid.init({
    src:$messList_data_table,
    onSuccess:function(grid){
        console.log(grid);
    },
    onError:function(grid){
    },
    dataTable:{
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/safety/channel/query-mess-list",
        "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0,8 ] }]  ,//指定某列不可排序
        "aaSorting":[
            [ 1,"asc" ]
        ],
        "aoColumns":[
            {  "sTitle":"接收者","mData":"deviceInfo.loginName"},
            {  "sTitle":"标题","mData":"title","mRender":function(data,type,full){
                return "<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;wzy:expression(void(this.title=this.innerText));width:100px;' title='"+data+"'>"+data+"</div>";
            }},
            {  "sTitle":"内容","mData":"content","mRender":function(data,type,full){
                return "<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;wzy:expression(void(this.title=this.innerText));width:150px;' title='"+data+"'>"+data+"</div>";
            }},
            {  "sTitle":"消息类型","mData":"messTypeName"},
            {  "sTitle":"所属系统","mData":"fromSys"},
            {  "sTitle":"消息状态","mData":"msgStateName"},
            {  "sTitle":"类别","mData":"plateMessName"},
            {  "sTitle":"发送时间","mData":"updateTime" ,"mRender":function(data){
                var time='';
                if(data){
                    time=new Date(data).format('yyyy-MM-dd hh:mm');
                }
                return time;
            }},
            {  "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data){
                var a='<a href="javascript:void(0);" onclick="deleteAll(\''+data+'\' , \'mess\')" class= "btn btn-xs red" title ="删除" ><i class="fa fa-trash-o"></i>删除</a>';
                return a;
            }}
        ]
    }
});
function seeMess(data){
    messgrid.setAjaxParam("deviceId",data);
    $("#deviceId").val(data);
    messgrid.getDataTable().fnDraw();
    $('#user_mess_div').modal('show');
}
function deleteAll(data,delType){
    var ids=[];
    var tabGrid;
    if("channel"==delType){
        tabGrid=grid;
    }else if("mess"==delType){
        tabGrid=messgrid;
    }
    if(data){
        ids.push(data);
    }else{
        $.each(tabGrid.getSelectedRows(),function(key,val){
            ids.push(val['value']);
        });
        if(ids.length==0){
            Metronic.alert({type:'danger',icon:'warning',message:'请选择至少一条要删除的信息。',container:tabGrid.getTableWrapper(),place:'prepend'});
            setTimeout("$('.alert').alert('close');",6000);
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
                        url:'${rc.contextPath}/safety/channel/delete',
                        type:'POST',
                        timeout:2000,
                        data:{"ids":ids,"delType":delType },
                        dataType:"json",
                        traditional:true,
                        success:function(msg){
                            Metronic.stopPageLoading();
                            if(msg.stat){
                                Metronic.alert({type:'success',message:'删除成功.',container:tabGrid.getTableWrapper(),place:'prepend'});
                            } else {
                                Metronic.alert({type:'danger',icon:'warning',message:'删除失败.',container:tabGrid.getTableWrapper(),place:'prepend'});
                            }
                            tabGrid.getDataTable().fnDraw();
                        }
                    });
                }
            }
        }
    });
    setTimeout("$('.alert').alert('close');",6000);
}

function openSendMess(data){

    $("#messageType").val('systemmes');
    $("#title").val('');
    $("#uri").val('');
    $("#message").val('');


    var channelId=[]; //用户id
    var userinfo = [] ;
    var deviceNum = [] ; //设备号
    var deviceName = [] ; //设备名
    var cliearDevice = [] ;//要清除的设备的设备号

    var obj = $("input[name='idCheck']") ;
    if(data){
        $.each( obj, function(i, obj){
            if(data == $(this).attr("tid") ){
                channelId.push($(this).attr("tid"));
                userinfo.push($(this).attr("username"));
                deviceNum.push($(this).attr("token"));
                deviceName.push($(this).attr("devname"));
                cliearDevice.push($(this).attr("cliearDevice"));
                return false ;
            }
        });
        //// onlineupdate("在线更新");
        if( 3==$("#messageType option").length ){
            $("#messageType").append("<option value='onlineupdate'>在线更新</option>");
        }
    }else{
        if( 4==$("#messageType option").length ){
            $("#messageType option:last").remove();
        }

        $.each(grid.getSelectedRows(),function(key,val){
            var sid = val['value'] ;
            $.each( obj, function(i, obj){
                //只能对正常状态下的设备进行消息推送
                if(sid == $(this).attr("tid") &&  'nodelete' == $(this).attr("accountState")  ){
                    channelId.push($(this).attr("tid"));
                    userinfo.push($(this).attr("username"));
                    deviceNum.push($(this).attr("token"));
                    deviceName.push($(this).attr("devname"));
                    cliearDevice.push($(this).attr("cliearDevice"));
                    return false ;
                }
            });
        });
        if(channelId.length==0){
            Metronic.alert({type:'danger',icon:'warning',message:'请至少选择一个设备',container:grid.getTableWrapper(),place:'prepend'});
            setTimeout("$('.alert').alert('close');",6000);
            return;
        }
    }


    $("#channelId").val(channelId);
    $("#userinfo").val(userinfo);
    $("#deviceNum").val(deviceNum);
    $("#deviceName").val(deviceName);
    $("#cliearDevice").val(cliearDevice);

    $('#send_mess_div').modal('show');
}

function sendMessType(obj){
    // systemmes("系统消息"),,clearuser("清除用户"),cleardevice("清除设备"), onlineupdate("在线更新");
    var title='' , message='';
    var type=obj.value;
    if('clearuser'==type){
        //清除用户
        title='用户清除';
        message='用户清除';
    }else if('cleardevice'==type){
        //清除设备
        title='客户端设备清除';
        message='客户端设备清除';
    }else if('onlineupdate'==type){
        //在线更新
        title='你有新版本更新';
        message='你有新版本更新';
    }
    $('#uri').val('');
    $('#title').val(title);
    $('#message').val(message);
}

function sendMessForm(){
    var flag=true;
    if(''==$.trim($("#title").val())||''==$.trim($("#message").val())){
        flag=false;
    }
    if(!flag){
        bootbox.alert('信息不完全,无法推送');
    } else {
        $('#send_mess_div').modal('hide');
        Metronic.startPageLoading();
        $.ajax({
            "dataType": 'json',
            "type": "POST",
            "url": "${rc.contextPath}/safety/message-send/send-message",
            "timeout":10000,
            "data": $('#messform').serialize(),
            "success": function(obj) {
                Metronic.stopPageLoading();
                var msgx = '' ;
                if(obj.msg){
                    msgx = obj.msg+";"  ;
                }
                if(obj.infiphone){
                    msgx += obj.infiphone ;
                }
                Metronic.alert({type:'success', message: msgx,container:grid.getTableWrapper(),place:'prepend'});
                setTimeout("$('.alert').alert('close');",6000);
            }
        });
    }
}

function resetBtn(){
    $("#messageType").val('systemmes');
    $("#title").val('');
    $("#uri").val('');
    $("#message").val('');
}

function cancelUserDel(data){
    var ids=[];
    if(data){
        ids.push(data);
    }else{
        var checkObj = $("input[name='idCheck']") ;
        $.each( checkObj, function(i, obj){
            var accountState = $(this).attr("accountState") ;
            var tid = $(this).attr("tid") ;
            $.each(grid.getSelectedRows(),function(key,val){
                if(val['value'] == tid && 'account'==accountState){
                    ids.push(val['value']);
                    return false;
                }
            });
        });
        if(ids.length==0){
            Metronic.alert({type:'danger',icon:'warning',message:'请选择状态为<账号擦除>的数据操作',container:grid.getTableWrapper(),place:'prepend'});
            return;
        }
    }
    bootbox.dialog({
        message: "此操作只能对<账号擦除>状态的数据进行取消擦除?",
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
                        url:'${rc.contextPath}/safety/channel/cancel-del',
                        type:'POST',
                        timeout:2000,
                        data:{"ids":ids },
                        dataType:"json",
                        traditional:true,
                        success:function(msg){
                            Metronic.stopPageLoading();
                            if(msg.stat){
                                Metronic.alert({type:'success',message:'取消用户擦除成功',container:grid.getTableWrapper(),place:'prepend'});
                            } else {
                                Metronic.alert({type:'danger',icon:'warning',message:'取消用户擦除失败',container:grid.getTableWrapper(),place:'prepend'});
                            }
                            grid.getDataTable().fnDraw();
                        }
                    });
                }
            }
        }
    });
    setTimeout("$('.alert').alert('close');",6000);
}


/**
 *  批量擦除设备  分为用户擦除  跟 设备擦除
 */
function cleanPhoneDel(type){
    var ids=[];
    var messageType = "clearuser" , titleMess = "用户清除" ;

    var checkObj = $("input[name='idCheck']") ;
    $.each( checkObj, function(i, obj){
        var accountState = $(this).attr("accountState") ;
        var tid = $(this).attr("tid") ;
        $.each(grid.getSelectedRows(),function(key,val){
            if(val['value'] == tid && ('nodelete'==accountState || 'account'==accountState)){
                ids.push(val['value']);
                return false;
            }
        });
    });

    if(ids.length==0){
        Metronic.alert({type:'danger',icon:'warning',message:'请选择状态为<账号擦除>、<正常>的数据操作',container:grid.getTableWrapper(),place:'prepend'});
        return;
    }

    var cliearDevice = [] ;//要清除的设备的设备号
    if('device'==type){
        //设备擦除
        $.each( checkObj, function(i, obj){
            var cliearDeviceStr = $(this).attr("cliearDevice") ;
            var tid = $(this).attr("tid") ;
            $.each( ids, function(k, idn){
                if(idn == tid ){
                    cliearDevice.push(cliearDeviceStr);
                    return false;
                }
            });
        });
        messageType ="cleardevice";
        titleMess = "客户端设备清除" ;
    }

    bootbox.dialog({
        message: "此操作只能对<账号擦除>、<正常>状态的数据进行"+titleMess+"操作?",
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
                        url:'${rc.contextPath}/safety/message-send/send-message',
                        type:'POST',
                        timeout:10000,
                        data:{"messageType": messageType ,"broadcast":"U" ,"cliearDevice":cliearDevice ,"channelId":ids , "title": titleMess ,"message": titleMess },
                        dataType:"json",
                        traditional:true,
                        success:function(obj){
                            Metronic.stopPageLoading();
                            var msgx = '' ;
                            if(obj.msg){
                                msgx = obj.msg+";"  ;
                            }
                            if(obj.infiphone){
                                msgx += obj.infiphone ;
                            }
                            Metronic.alert({type:'success',icon:'warning',message: msgx,container:grid.getTableWrapper(),place:'prepend'});
                            setTimeout("$('.alert').alert('close');",6000);
                            grid.getDataTable().fnDraw();
                        }
                    });
                   setTimeout("Metronic.stopPageLoading();grid.getDataTable().fnDraw();",6000);
                }
            }
        }
    });
    setTimeout("$('.alert').alert('close');",6000);
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

</script>
</content>
</html>
