<html>
<head>
    <title>活动编辑</title>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css">
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>

    <style>
    </style>
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
                <a href="${rc.contextPath}/news/article">活动管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">活动编辑</a>
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>编辑活动
                </div>
            </div>

            <div class="portlet-body form">
                <form action="${rc.contextPath}/order/update" class="form-horizontal form-bordered" method="POST" id="form1" >

                    <!--隐藏元素-->
                    <input name="id" type="hidden" value="${orderHead.id}"/>
                <#--<input name="leaveStartDate" type="text" value="55"/>-->
                <#--<input name="leaveEndDate" type="text" value="44"/>-->
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-2 control-label">活动名称</label>

                            <div class="col-md-4">
                                <div class="input-group">
                                <#--<span class="input-group-addon"><i class="fa fa-key"></i></span>-->
                                    <input check-type='required' readonly name="orderNo" type="text" class="form-control orderHead" placeholder="" value="${orderHead.orderHeadNo}">

                                </div>
                            </div>

                            <label class="col-md-2 control-label">活动编号</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input name="userName" type="text"  class="form-control required" placeholder="" value="${orderHead.userName}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">活动内容</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span  class="" >
                                    ${orderHead.money}
                                    </span>
                                </div>
                            </div>

                            <label class="col-md-2 control-label">活动折扣</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span  class="" >
                                    <#if orderHead.status?? && orderHead.status=='daizhifu'>
                                        未支付
                                    <#else>
                                        已支付
                                    </#if>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">开始时间</label>

                            <div class="col-md-4">
                                <div class="input-group">
                                    <span  class="" id="createTime">2016-03-10</span>
                                </div>
                            </div>

                            <label class="col-md-2 control-label">结束时间</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <select name="status"  class="form-control form-filter input-sm required">
                                        <option value="daifukuan">待发货
                                        </option>
                                        <option value="daifahuo">已发货</option>
                                        <option value="yifahuo">已收货</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">排位</label>

                            <div class="col-md-4">
                                <div class="input-group">
                                    <select name="logisticsComp"  class="form-control form-filter input-sm required">
                                        <option value="shunfeng">顺风</option>
                                        <option value="yuntong">圆通</option>
                                        <option value="shentong">申通</option>
                                    </select>
                                </div>
                            </div>

                            <label class="col-md-2 control-label">状态</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input check-type='required' name="freight" type="text"  class="form-control required " placeholder="" value="${orderHead.freight}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">创建时间</label>

                            <div class="col-md-4">
                                <div class="input-group">
                                    <span></span>
                                </div>
                            </div>

                            <label class="col-md-2 control-label">创建人</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span></span>
                                </div>
                            </div>
                        </div>
                </div>

                    <div class="form-actions fluid">
                        <div class="col-md-offset-5 col-md-6">
                            <button type="submit" class="btn blue" id="saveBtn">保存</button>

                            <button type="button" id="cancelBtn" class="btn default" data-dismiss="modal" onclick="javascript:window.location.href='${rc
                            .contextPath}/order'">
                                返回
                            </button>
                        </div>
                    </div>
            </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <ul class="page-breadcrumb breadcrumb" style="margin: 0px;padding: 10px;">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="javascript:void(0)">活动图片</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                </ul>
            </div>
        </div>

        <div class="table-container">
            <div class="table-actions-wrapper"><span></span>
            </div>
            <table class="table table-striped table-bordered table-hover dataTable" style="width: 81%" align="center">
                <thead>
                <tr role="row" class="heading">
                    <th width="10%">位置</th>
                    <th width="10%">编码</th>
                    <th width="10%">类型</th>
                    <th width="10%">宽</th>
                    <th width="10%">高</th>
                    <th width="40%">图片</th>
                    <th width="10%">操作</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-md-12">
                <ul class="page-breadcrumb breadcrumb" style="margin: 0px;padding: 10px;">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="javascript:void(0)">活动商品</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                </ul>
            </div>
        </div>
        <div class="table-container">
            <div class="table-actions-wrapper"><span></span>
            </div>
            <table class="table table-striped table-bordered table-hover" style="width: 81%" align="center"  id="comment_data_table">
                <thead>
                <tr role="row" class="heading">
                    <th width="10%">位置</th>
                    <th width="10%">编码</th>
                    <th width="10%">类型</th>
                    <th width="10%">宽</th>
                    <th width="10%">高</th>
                    <th width="40%">图片</th>
                    <th width="10%">操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
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
                //"sDom":"<'table-scrollable't><'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>r>>",//dataTable翻页,只保留表格底部翻页样式
                "sDom":'<<"clear">>rt<"bottom">',
                "aLengthMenu":[
                    [10,20,50,-1],
                    [10,20,50,"All"]
                ],
                "iDisplayLength":10,
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/order/detail/list?search_LIKE_orderHeadId="+'${orderHead.id}',
                "aaSorting":[
                    [ 0,"desc" ]
                ],
                "aoColumns":[

                    { "sTitle":"位置","mData":"orderNo","mRender":function(data,type,row){
                    return data;
                    }},
                    {  "sTitle":"编码","mData":"quatity","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"类型","mData":"quatity","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"宽","mData":"quatity","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"高","mData":"price","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"图片","mData":"price","mRender":function(data,type,row){
                        return data;
                    }},
                    {  "sTitle":"操作","mData":"price","mRender":function(data,type,row){
                        return data;
                    }}
                ]
            }
        });

        function getYmd(date){
            return date.substr(0,10);
        }
    </script>
</content>
</html>
