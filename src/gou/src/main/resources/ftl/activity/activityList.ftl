<html>
<head>
    <title>订单管理</title>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css">
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/css/style.css"/>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">驾驶舱</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">活动列表</a>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>活动列表</div>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/activity/toAdd" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">新增活动</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
            <#if message??>
                <div  class="alert alert-success">
                    <button data-dismiss="alert" class="close">×</button>
                ${(message)!}
                </div>
            </#if>
                <div id="message" style="display: none;" class="alert alert-success">
                    <button data-dismiss="alert" class="close">×</button>
                    操作成功
                </div>
                <div class="table-container">
                    <div class="table-actions-wrapper"><span></span>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="comment_data_table">
                        <thead>
                        <tr role="row" class="heading">
                            <th width="15%">活动编号</th>
                            <th width="15%">活动名称</th>
                            <th width="8%">开始时间</th>
                            <th width="15%">结束时间</th>
                            <th width="15%">活动状态</th>
                            <th width="10%">操作</th>
                        </tr>
                        <tr role="row" class="filter">
                            <td>
                                <input type="text" class="form-control form-filter input-sm" name="search_activityCode" value="">
                            </td>
                            <td>
                                <input type="text" class="form-control form-filter input-sm" name="search_name" value="">
                            </td>
                            <td></td>
                            <td></td>
                            <td>
                                <select name="search_state" class="input-sm">
                                    <option value="">--全部--</option>
                                    <option value="ready">未开始</option>
                                    <option value="running">进行中</option>
                                    <option value="finish">已完成</option>
                                    <option value="closed">已关闭</option>
                                </select>
                            </td>
                            <td>
                                <div class="margin-bottom-5">
                                    <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> 搜索</button>
                                </div>
                                <#--<button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i> 重置</button>-->
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
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script type="text/javascript">
        $('.date-picker').datepicker({
            rtl:Metronic.isRTL(),
            autoclose:true,
            language:'zh-CN'
        });
        var grid=new Datatable();
        grid.init({
            src:$("#comment_data_table"),
            onSuccess:function(grid){
            },
            onError:function(grid){
            },
            dataTable:{
                "sDom":"<'table-scrollable't><'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>r>>",//dataTable翻页,只保留表格底部翻页样式
                "aLengthMenu":[
                    [10,10,20,50,100,150,-1],
                    [10,10,20,50,100,150,"All"]
                ],
                "iDisplayLength":10,
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/activity/list",
                "aaSorting":[
                    [ 0,"desc" ]
                ],
                "aoColumns":[
                    { "sTitle":"活动编号","mData":"activityCode","mRender":function(data,type,row){
                        return '<a href="${rc.contextPath}/activity/update/'+row.id+'">'+data+'</a>';
                    }},
                    {  "sTitle":"活动名称","mData":"name","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"开始时间","mData":"startTimeStr","mRender":function(data,type,row){
                        if(data == 'daifahuo'){
                            return "待发货";
                        }
                    }},
                    { "sTitle":"结束时间","mData":"endTimeStr","mRender":function(data,type,row){
                        return getYmd(changeDate(parseFloat(data)));
                    }},
                    {  "sTitle":"活动状态","mData":"state","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data,type,row){
                        var a='<a href="${rc.contextPath}/activity/update/'+data+'" class="update btn default btn-xs purple"  title="编辑" >编辑</a>'+
                        '<a href="${rc.contextPath}/activity/delete/'+data+'" class="delete btn default btn-xs purple"  title="删除" >删除</a>'
                       return a;
                    }}
                ]
            }
        });
        $('.table-group-action-submit').click(function(){
            var ids=[];
            $.each(grid.getSelectedRows(),function(key,val){
                ids.push(val['value']);
            });
            pub(ids,$('#pub').val());
        });
        function _pub(id,p){
            pub([id],p);
        }
        function pub(ids,p){
            $.ajax({
                url:'${rc.contextPath}/news/article/publication',
                type:'POST',
                data:{"ids":ids,"pub":p},
                dataType:"json",
                traditional:true,
                success:function(){
                    grid.getDataTable().fnDraw();
                }
            });
        }
        function validateTop(id,title,isTop){
            if(isTop==false){
                $.ajax({
                    url:'${rc.contextPath}/news/article/validatetop/'+id,
                    type:'GET',
                    dataType:"json",
                    traditional:true,
                    success:function(a,b,c){
                        if(a.id){
                            topic(a,title,id);
                        }else{
                            topicSubmit(id);
                        }
                    }
                });
            }else{
                topicSubmit(id);
            }
        }

        function topicSubmit(id){
            $.ajax({
                url:'${rc.contextPath}/news/article/topic/'+id,
                type:'POST',
                dataType:"json",
                traditional:true,
                success:function(){
                    grid.getDataTable().fnDraw();
                    alertHint("操作成功");

                }
            });
        }


        function getYmd(date){
            return date.substr(0,10);
        }
    </script>
</content>
</html>
