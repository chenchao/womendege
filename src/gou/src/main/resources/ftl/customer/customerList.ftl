<html>
<head>
    <title>订单管理</title>
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
                <a href="${rc.contextPath}/">驾驶舱</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">订单列表</a>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>会员列表</div>
                <div class="actions">
                    <div class="btn-group">
                    </div>
                </div>
            </div>
            <div class="portlet-body">
            <#if message??>
                <div class="alert alert-success">
                    <button data-dismiss="alert" class="close">×</button>
                ${(message)!}
                </div>
            </#if>
                <div class="table-container">
                    <div class="table-actions-wrapper"><span></span>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="comment_data_table">
                        <thead>
                        <tr role="row" class="heading">
                        <#--<th width="15%">订单编号</th>-->
                            <th width="10%">账号</th>
                            <th width="10%">姓名</th>
                            <th width="10%">昵称</th>
                            <th width="10%">会员积分</th>
                            <th width="10%">宝宝的</th>
                            <th width="10%">注册时间</th>
                            <th width="10%">注册平台</th>
                            <th width="10%">宝宝性别</th>
                            <th width="10%">宝宝生日</th>
                            <th width="10%">我的订单</th>
                        </tr>
                        <tr role="row" class="filter">
                            <td>
                                <input type="text" class="form-control form-filter input-sm" name="search_loginName" value="">
                            </td>
                            <td>
                                <input type="text" class="form-control form-filter input-sm" name="search_userName" value="">
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <div class="margin-bottom-5">
                                    <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> 搜索</button>
                                </div>
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
                "sAjaxSource":"${rc.contextPath}/customer/list",
                "aaSorting":[
                    [ 0,"desc" ]
                ],
                "aoColumns":[
                    { "sTitle":"账号","mData":"loginName","mRender":function(data,type,row){
                        return '<a href="${rc.contextPath}/customer/detail/'+row.id+'">'+data+'</a>';
                    }},
                    {  "sTitle":"姓名","mData":"userName","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"昵称","mData":"nickName","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"积分","mData":"integral","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"宝宝的","mData":"identity","mRender":function(data,type,row){
                        return data;
                    }},
                    { "sTitle":"注册时间","mData":"createTime","mRender":function(data,type,row){
                        return getYmd(changeDate(parseFloat(data)));
                    }},
                    {  "sTitle":"注册平台","mData":"registeredModel","mRender":function(data,type,row){
                        return data;
                    }},
                    { "sTitle":"宝宝性别","mData":"babySex","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"宝宝生日","mData":"babyBirthday","mRender":function(data,type,row){
                        return getYmd(changeDate(parseFloat(data)));;
                    }},
                    {  "sTitle":"我的订单","mData":"id","sDefaultContent":"","mRender":function(data,type,row){
                        var a='<a href="${rc.contextPath}/order/head/detail/'+data+'" class="update btn default btn-xs purple"  title="编辑" >查看</a>';
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
