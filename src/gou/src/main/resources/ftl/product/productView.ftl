<html>
<head>
    <title>商品管理</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css">
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">商品管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="${rc.contextPath}/product/class">商品</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">维护商品详情</a>
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
                    <i class="fa fa-gift"></i>商品信息
                </div>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/product/class/create/${d.classCode}" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">编辑商品信息</span>
                        </a>
                    <#if d.parentClass?? && d.parentClass =='ROOT'>
                        <a href="${rc.contextPath}/product/class" class="btn green">
                            <i class="fa fa-undo"></i>
                            <span class="hidden-480">返回</span>
                        </a>
                    <#else>
                        <a href="${rc.contextPath}/product/class/sub-view/${d.parentClass}" class="btn green">
                            <i class="fa fa-undo"></i>
                            <span class="hidden-480">返回</span>
                        </a>
                    </#if>
                    </div>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal form-bordered">
                    <input type="hidden" id="classId" name="classId" value="${d.id}">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">基本信息</label>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">商品编码</label>
                            <div class="col-md-4">
                                商品编码商品编码商品编码
                            </div>
                            <label class="col-md-2 control-label">商品名称</label>
                            <div class="col-md-4">
                                商品名称商品名称商品名称
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">所属品牌</label>
                            <div class="col-md-4">
                                所属品牌所属品牌所属品牌
                            </div>
                            <label class="col-md-2 control-label">商品简称</label>
                            <div class="col-md-4">
                                商品简称商品简称商品简称
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">所属分类</label>
                            <div class="col-md-8">
                                所属分类所属分类所属分类
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">商品描述</label>
                            <div class="col-md-8">
                                商品描述商品描述商品描述
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">其他属性
                                <font color="blue" style="font-size: small;">目录组名称</font>
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">产地</label>
                            <div class="col-md-4">
                                产地产地产地
                            </div>
                            <label class="col-md-2 control-label">试用年龄</label>
                            <div class="col-md-4">
                                试用年龄试用年龄试用年龄
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">包装类型</label>
                            <div class="col-md-4">
                                包装类型包装类型包装类型
                            </div>
                            <label class="col-md-2 control-label">保质期</label>
                            <div class="col-md-4">
                                保质期保质期保质期
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">商品条码</label>
                            <div class="col-md-4">
                                商品条码商品条码商品条码
                            </div>
                            <label class="col-md-2 control-label">其他</label>
                            <div class="col-md-4">
                                其他其他其他其他其他其他
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">商品图片</label>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <span id="spanShow" style="padding-left: 50px;font-size: 14px;">暂无图片</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#if message??>
<div id="message" class="alert alert-success">
    <button data-dismiss="alert" class="close">×</button>
${message}
</div>
</#if>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>商品详情信息
                </div>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/product/class/create/${d.classCode}" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">新增商品详情</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal form-bordered">
                    <div class="form-body">
                        <div class="form-actions fluid">
                            <div class="col-md-offset-5 col-md-7">
                                商品详情1
                                <button type="button" id="saveBtn" class="btn green" onclick="saveInfo();">编辑详情</button>
                            </div>
                            <input type="hidden" id="classId" name="classId" value="${d.id}">
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情信息</label>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情编码</label>
                            <div class="col-md-4">
                                详情编码详情编码详情编码
                            </div>
                            <label class="col-md-2 control-label">详情名称</label>
                            <div class="col-md-4">
                                详情名称详情名称详情名称
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情单位</label>
                            <div class="col-md-4">
                                详情单位详情单位详情单位
                            </div>
                            <label class="col-md-2 control-label">详情单价</label>
                            <div class="col-md-4">
                                详情单价详情单价详情单价详情单价
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情库存</label>
                            <div class="col-md-4">
                                详情库存详情库存详情库存详情库存
                            </div>
                            <label class="col-md-2 control-label">是否上架</label>
                            <div class="col-md-4">
                                是否上架是否上架是否上架是否上架
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情规格
                                <font color="blue" style="font-size: small;">规格名称</font>
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">85CM</label>
                            <div class="col-md-4">
                                12
                            </div>
                            <label class="col-md-2 control-label">90CM</label>
                            <div class="col-md-4">
                                10
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">100CM</label>
                            <div class="col-md-4">
                                0
                            </div>
                            <label class="col-md-2 control-label">110CM</label>
                            <div class="col-md-4">
                                4
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">120CM</label>
                            <div class="col-md-4">
                                1
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情图片
                            </label>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <span id="spanShow" style="padding-left: 50px;font-size: 14px;">暂无图片</span>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-5 col-md-7">
                                商品详情2
                                <button type="button" id="saveBtn" class="btn green" onclick="saveInfo();">编辑详情</button>
                            </div>
                            <input type="hidden" id="classId" name="classId" value="${d.id}">
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情信息</label>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情编码</label>
                            <div class="col-md-4">
                                详情编码详情编码详情编码
                            </div>
                            <label class="col-md-2 control-label">详情名称</label>
                            <div class="col-md-4">
                                详情名称详情名称详情名称
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情单位</label>
                            <div class="col-md-4">
                                详情单位详情单位详情单位
                            </div>
                            <label class="col-md-2 control-label">详情单价</label>
                            <div class="col-md-4">
                                详情单价详情单价详情单价详情单价
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情库存</label>
                            <div class="col-md-4">
                                详情库存详情库存详情库存详情库存
                            </div>
                            <label class="col-md-2 control-label">是否上架</label>
                            <div class="col-md-4">
                                是否上架是否上架是否上架是否上架
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情规格
                                <font color="blue" style="font-size: small;">规格名称</font>
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">85CM</label>
                            <div class="col-md-4">
                                12
                            </div>
                            <label class="col-md-2 control-label">90CM</label>
                            <div class="col-md-4">
                                10
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">100CM</label>
                            <div class="col-md-4">
                                0
                            </div>
                            <label class="col-md-2 control-label">110CM</label>
                            <div class="col-md-4">
                                4
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">120CM</label>
                            <div class="col-md-4">
                                1
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情图片
                            </label>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <span id="spanShow" style="padding-left: 50px;font-size: 14px;">暂无图片</span>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-5 col-md-7">
                                商品详情3
                                <button type="button" id="saveBtn" class="btn green" onclick="saveInfo();">编辑详情</button>
                            </div>
                            <input type="hidden" id="classId" name="classId" value="${d.id}">
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情信息</label>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情编码</label>
                            <div class="col-md-4">
                                详情编码详情编码详情编码
                            </div>
                            <label class="col-md-2 control-label">详情名称</label>
                            <div class="col-md-4">
                                详情名称详情名称详情名称
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情单位</label>
                            <div class="col-md-4">
                                详情单位详情单位详情单位
                            </div>
                            <label class="col-md-2 control-label">详情单价</label>
                            <div class="col-md-4">
                                详情单价详情单价详情单价详情单价
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情库存</label>
                            <div class="col-md-4">
                                详情库存详情库存详情库存详情库存
                            </div>
                            <label class="col-md-2 control-label">是否上架</label>
                            <div class="col-md-4">
                                是否上架是否上架是否上架是否上架
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情规格
                                <font color="blue" style="font-size: small;">规格名称</font>
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">85CM</label>
                            <div class="col-md-4">
                                12
                            </div>
                            <label class="col-md-2 control-label">90CM</label>
                            <div class="col-md-4">
                                10
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">100CM</label>
                            <div class="col-md-4">
                                0
                            </div>
                            <label class="col-md-2 control-label">110CM</label>
                            <div class="col-md-4">
                                4
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">120CM</label>
                            <div class="col-md-4">
                                1
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情图片
                            </label>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <span id="spanShow" style="padding-left: 50px;font-size: 14px;">暂无图片</span>
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
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/fnReloadAjax.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/common.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jstree/dist/jstree.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script type="text/javascript">
        function alertClose(){
            $(".alert").alert('close');
        }
        $(document).ready(function(){
            setInterval(alertClose,3*1000);
        });
        var grid=new Datatable();
        grid.setAjaxParam("search_EQ_parentClass",'${d.classCode}');
        grid.init({
            src:$("#data_table"),dataTable:{
                "aLengthMenu":[[5,10,20,50,100,-1],[5,10,20,50,100,"All"]],
                "aaSorting":[[2,"asc"]],
                "iDisplayLength":5,
                "bServerSide":true,
                "aoColumnDefs":[{"bSortable":false,"aTargets":[0,1,2,3,4,5]}],
                "sAjaxSource":"${rc.contextPath}/product/class",
                "aoColumns":[{
                    "sTitle":"分类编码","mData":"classCode","mRender":function(data,type,row){
                        return '<a href="javascript:goView('+row.id+')">'+data+'</a>';
                    }
                },{"sTitle":"分类名称","mData":"className"},{"sTitle":"分类排序","mData":"classSort"},{"sTitle":"关键字","mData":"classKeyword"},{"sTitle":"描述","mData":"classDesc"},{
                    "sTitle":"操作","mData":"id","mRender":function(data,type,row){
                        var a='<a class="btn btn-xs red" href="javascript:delData('+row.id+')"><i class="fa fa-trash-o"></i>删除</a></div>';
                        var b='<a class="btn btn-xs blue" href="javascript:subView('+row.classCode+')"><i class="fa fa-edit"></i>编辑子类</a></div>';
                        return a+b;
                    }
                }]
            }
        });
        function delData(id){
            bootbox.dialog({
                message:"您是否确认删除该数据项？",buttons:{
                    main:{
                        label:"取消",className:"gray",callback:function(){
                            $(this).hide();
                        }
                    },success:{
                        label:"确定",className:"green",callback:function(){
                            Metronic.startPageLoading();
                            $.ajax({
                                url:'${rc.contextPath}/product/class/delete/'+id,type:'POST',dataType:"json",traditional:true,success:function(data){
                                    if(data.result=="success"){
                                        grid.getDataTable().fnDraw();
                                    }else{
                                        bootbox.alert("删除数据失败!");
                                    }
                                    Metronic.stopPageLoading();
                                }
                            });
                        }
                    }
                }
            });
        }
        $('.table-group-action-submit').click(function(){
            selectAjax($("#selectInput").val());
        });
        function selectAjax(value){
            grid.setAjaxParam("search_EQ_parentClass","${d.classCode}");
            grid.setAjaxParam("search_OR_classCode|className",value);
            grid.getDataTable().fnDraw();
        }
        function goView(id){
            document.location="${rc.contextPath}/product/class/view/"+id+"/${d.classCode}";
        }
        function subView(code){
            document.location="${rc.contextPath}/product/class/sub-view/"+code;
        }
    </script>
</content>
</html>
