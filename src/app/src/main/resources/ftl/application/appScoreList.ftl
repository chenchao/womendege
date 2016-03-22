<html>
<head>
    <title>应用评分管理</title>
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
                <a href="${rc.contextPath}/">应用评论管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="${rc.contextPath}/app-score/list">应用评论</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>应用评论列表</div>
                <div class="actions">
                    <div class="btn-group">
                        <button class="btn red">
                            <i class="fa  fa-trash-o"></i>
                            <span class="hidden-480"  onclick="deleteList();">删除评论</span>
                        </button>
                        <button class="btn green"  data-toggle="dropdown">
                            <i class="fa fa-angle-double-down"></i>
                            <span class="hidden-480">导出EXCEL</span>
                        </button>
                        <ul class="dropdown-menu pull-right">
                            <li>
                                <a href="javascript:exportData('0');">
                                    全部导出
                                </a>
                            </li>
                            <li>
                                <a href="javascript:exportData('1');">
                                    选择导出
                                </a>
                            </li>
                            <li>
                                <a href="javascript:exportData('2');">
                                    查询导出
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-container">
                    <table class="table table-striped table-bordered table-hover" id="apply_data_table">
                        <thead>
                        <tr role="row" class="heading">
                            <th width="1%">
                                <input type="checkbox" class="group-checkable">
                            </th>
                            <th width="20%">用户名称</th>
                            <th width="13%">版本号</th>
                            <th width="13%">版本号</th>
                            <th width="13%">评分</th>
                            <th width="13%">评论内容</th>
                            <th width="13%">更新日期</th>
                            <th width="13%">更新日期</th>
                        </tr>
                        <tr role="row" class="filter">
                            <td></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_name" id="LIKE_user_name"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_name" id="LIKE_version_num"></td>
                            <td><select class="form-control  form-filter" id="LIKE_version_type">
                                <option value="">请选择</option>
                                <option value="IPHONE">IPHONE</option>
                                <option value="IPAD">IPAD</option>
                                <option value="ANDROID">Android_手机版</option>
                                <option value="ANDROID_PAD">Android_平板</option>
                            </select></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_name" id="LIKE_rating"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_name" id="LIKE_app-commont"></td>
                            <td>
                                <div id="beginTime" class="input-group date date-picker margin-bottom-5" data-date-format="yyyy-mm-dd">
                                    <input id="begin" type="text" class="form-control form-filter  input-sm" readonly name="beginTime" placeholder="开始日期">
                                    <span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span>
                                </div>
                                <div id="endTime" class="input-group date date-picker" data-date-format="yyyy-mm-dd">
                                    <input id="end" type="text" class="form-control form-filter  input-sm" readonly name="endTime" placeholder="结束日期">
                                    <span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span>
                                </div>
                            </td>
                            <td>
                                <button class="btn btn-sm yellow margin-bottom" onclick="selectAjax()"><i class="fa fa-search"></i> 搜索</button>
                                <button class="btn btn-sm red" onclick="restInfo()"><i class="fa fa-times"></i> 重置</button>
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
    <script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/lang/summernote-zh-CN.js" type="text/javascript"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
    <script type="text/javascript">
        $('.date-picker').datepicker({
            rtl:Metronic.isRTL(),
            language: 'zh-CN',
            autoclose:true
        });
        $('#beginTime').on('change',function(e){
            $('#endTime').datepicker('setStartDate', $('#begin').val());
        });
        $('#endTime').on('change',function(e){
            $('#beginTime').datepicker('setEndDate', $('#end').val());
        });
        var grid=new Datatable();
        grid.init({
            src:$("#apply_data_table"),
            onSuccess:function(grid){
            },
            onError:function(grid){
            },
            dataTable:{
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/app-score/list/app-score-list",
                "aaSorting":[
                    [ 2,"desc" ]
                ],
                "aLengthMenu":[
                    [10,20,30,50,100],
                    [10,20,30,50,100]
                ],
                "aoColumnDefs":[
                    { "bSortable":false,"aTargets":[ 0,1,2,3,4,5,6,7] }
                ],//设置不排序得列
                "aoColumns":[
                    { "sWidth":"1%","sTitle":'<input type="checkbox" class= "checkAllBox" onclick="checkAllBox(this)"  title="全选" class="group-checkable" />',"sDefaultContent":"","mRender":function(data,type,full){
                        return '<div class="checker"  ><span class=""><input type="checkbox" class="checkboxes" checked="" name="checkBox" value="'+full.id+'"></span></div>';
                    }},
                    {  "sWidth":"10%","sTitle":"用户名称","mData":"userName"},
                    {  "sWidth":"10%","sTitle":"版本号","mData":"versionNum"},
                    {  "sWidth":"10%","sTitle":"运行平台","mData":"vertionTypeName"},
                    {  "sWidth":"5%","sTitle":"评分","mData":"rating"},
                    {  "sWidth":"25%","sTitle":"评论内容","mData":"appComment"},
                    {  "sWidth":"13%","sTitle":"更新日期","mData":"createTime","sDefaultContent":"","mRender":function(data,type,full){
                        var time='';
                        if(data){
                            time=new Date(data).format('yyyy-MM-dd hh:mm');
                        }
                        return time;
                    }},
                    {  "sWidth":"10%","sTitle":"操作","sDefaultContent":"","mRender":function(data,type,full){
                        var a='<a  href="javascript:void(0);" onclick="deleteOne('+full.id+')" class= "btn default btn-xs black" title ="删除">删除</a>';
                        return a;
                    }}
                ]
            }
        });
        /**
         *  选择框选中事件
         * */
        jQuery('#apply_data_table').on('change','tbody tr .checkboxes',function(){
            $(this).parents('span').toggleClass("checked");
        });

        /**
         * 模糊查询信息
         * */
        function selectAjax(){
            grid.setAjaxParam("beginTime",$('#begin').val());
            grid.setAjaxParam("endTime",$('#end').val());
            grid.setAjaxParam("plateForm",$('#LIKE_version_type').val());
            grid.setAjaxParam("versionNum",$('#LIKE_version_num').val());
            grid.setAjaxParam("rating", $('#LIKE_rating').val());
            grid.setAjaxParam("userName",$('#LIKE_user_name').val());
            grid.setAjaxParam("appComment",$('#LIKE_app-commont').val());
            grid.getDataTable().fnDraw();
        }

        /**
         * 重置信息
         * */
        function restInfo(){
            $('#begin').datepicker('setDate', '');
            $('#end').datepicker('setDate', '');
            $("#LIKE_version_type option[value='']").attr('selected','true');
            $('#LIKE_version_num').val('');
            $('#LIKE_rating').val('');
            $('#LIKE_user_name').val('');
            $('#LIKE_app-commont').val('');
            selectAjax();
        }
        /**
         * 导出评论信息excel
         */
        function exportData(tip){
            var beginTime=$('#begin').val(),endTime = $('#end').val(),ids=[];
            if(1==tip||'1'==tip){
                var  ch=$("#apply_data_table span.checked >input[name='checkBox']");
                if(ch){
                    ch.each(function(i,n){
                        ids.push(n.value);
                    });
                }
                if(ids==''||ids==null||ids.length==0){
                    bootbox.alert('请选择需要导出的评论信息');
                    return false;
                }
            }else{
                ids.push(0);
            }
            location.href='${rc.contextPath}/app-score/list/export-app-list?exportType='+tip+'&plateForm='+$('#LIKE_version_type').val()+'&ids='+ids+'&beginTime='+beginTime+'&endTime='+endTime+'&versionNum='+$('#LIKE_version_num').val()+'&rating='+$('#LIKE_rating').val()+'&appComment='+$('#LIKE_app-commont').val()+'&userName='+$('#LIKE_user_name').val();
        }

        /**
         *  删除多个信息
         */
        function deleteList(){
            var ids=[], ch=$("#apply_data_table span.checked >input[name='checkBox']");
            if(ch){
                ch.each(function(i,n){
                    ids.push(n.value);
                });
            }
            if(ids==''||ids==null||ids.length==0){
                bootbox.alert('请选择需要删除的评论');
                return false;
            }
            commonDelete({"ids":ids},'确认批量删除应用评论信息?','批量删除应用评论','${rc.contextPath}/app-score/list/delete-all');
        }
        /**
         * 单个删除信息
         * */
        function deleteOne(id){
            var ids=[];
            if(id){
                ids.push(id);
                commonDelete({"ids":ids},'确认删除应用评论信息?','删除应用评论','${rc.contextPath}/app-score/list/delete-all');
            }
        }
        /**
         *  公共删除信息
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
