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
                <a href="#">退货列表</a>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
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

                <!-- 上传模态窗口 -->
                <div class="modal fade" id="uploadModal" tabindex="-1" backdrop="false" role="dialog"
                     aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span
                                        aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title" id="myModalLabel">处理退单</h4>
                            </div>
                            <div class="modal-body" style="align-content: center">
                                <input type="hidden" id="returnId">
                                   <select id="returnStatus" style="padding-left: 300px">
                                       <option value="daituikuan">同意退货</option>
                                       <option value="jujue">拒绝退货</option>
                                       <option value="wancheng">已退款</option>
                                   </select>
                                    <button type="submit" class="btn blue" id="saveBtn" onclick="saveStatus()">确定</button>
                                </div>
                        </div>
                    </div>
                </div>


                <div class="table-container">
                    <div class="table-actions-wrapper"><span></span>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="comment_data_table">
                        <thead>
                        <tr role="row" class="heading">
                            <#--<th width="15%">订单编号</th>-->
                            <th width="15%">退货编号</th>
                            <th width="15%">商品数量</th>
                            <th width="8%">交易金额</th>
                            <th width="15%">交易时间</th>
                            <th width="5%">当前收货人</th>
                            <th width="5%">当前收货人</th>
                            <th width="20%">操作</th>
                        </tr>
                        <tr role="row" class="filter">
                            <td>
                                <input type="text" class="form-control form-filter input-sm" name="search_LIKE_orderNo" value="">
                            </td>
                            <td></td>
                            <td></td>
                            <td>
                                <div class="margin-bottom-5">
                                    <div class="input-group date date-picker margin-bottom-5" data-date-format="yyyy-mm-dd">
                                        <input type="text" class="form-control form-filter input-sm" readonly name="search_LIKE_startTime" placeholder="From">
                                        <span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span>
                                    </div>
                                    <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
                                        <input type="text" class="form-control form-filter input-sm" readonly name="search_LIKE_endTime" placeholder="To">
                                        <span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span>
                                    </div>
                                </div>
                            </td>
                            <td></td>
                            <td></td>
                            <td>
                                <div class="margin-bottom-5">
                                    <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> 搜索</button>
                                </div>
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
                "sAjaxSource":"${rc.contextPath}/order/return/list",
                "aaSorting":[
                    [ 0,"desc" ]
                ],
                "aoColumns":[
                    { "sTitle":"退货编号","mData":"orderReturnNo","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"商品数量","mData":"orderDetail.","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"交易金额","mData":"money","mRender":function(data,type,row){
                        return data;
                    }},

                    { "sTitle":"退货时间","mData":"createTime","mRender":function(data,type,row){
                        return getYmd(changeDate(parseFloat(data)));
                    }},
                    {  "sTitle":"退货理由","mData":"userName","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"退货状态","mData":"status","mRender":function(data,type,row){
                        if(data=='daishenhe'){
                            return "待审核"
                        }
                        else if(data=='daituikuan'){
                            return "待退款"
                        }
                        else if(data=='jujue'){
                            return "决绝退款"
                        }
                        else if(data=='wancheng'){
                            return "退货完成"
                        }
                    }},
                    {  "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data,type,row){
                        var a='<a href="javascript:void(0)" class="update btn default btn-xs purple" title="编辑" onclick="showModel('+data+')">处理</a>';
                        //onclick="javascript:$('#uploadModal').modal('toggle');"
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

        function showModel(id){
            $('#uploadModal').modal('toggle');
            $('#returnId').val(id);

        }
        function saveStatus(){
            $.ajax({
                url:'${rc.contextPath}/order/return/approve',
                type:'POST',
                data:{"id": $('#returnId').val(),"status": $('#returnStatus').val()},
                dataType:"json",
                traditional:true,
                success:function(){
                    $('#uploadModal').modal('toggle');
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
