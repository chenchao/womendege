<html>
<head>
    <title>导入用户列表</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">导入管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">用户导入</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>用户导入列表</div>
            </div>
            <div class="portlet-body">
                <div class="table-container">
                    <div class="row" id="tableDatas">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <form action="" enctype="multipart/form-data" class="form-horizontal" id="myForm" type="post">
                                    <input type="hidden" name="importType" value="1"/>

                                    <div class="fileinput fileinput-new" data-provides="fileinput" id="uploadFile_old">
								<span class="btn green btn-file" id="uploadFile_clone">
									<i class="fa fa-long-arrow-down"></i>
									<span class="fileinput-new">
										  导入文件
									</span>
									<input type="file" name="uploadFile" id="uploadFile">
								</span>
                                        <button type="button" class="btn green start" id="toSaveFile"/>
                                        <i class="icon-upload"></i>
								<span>
									 保存上传
								</span>
                                        </button>
                                        <button type="button" class="btn blue start" onclick="downLoadExcel(1)">
                                            <i class="fa fa-long-arrow-down"></i>
								<span>
									 下载模板
								</span>
                                        </button>
                                        <button type="button" class="btn red" id="toCloseInfo">
                                            <i class="fa fa-trash-o"></i>
								<span>
									 移除
								</span>
                                        </button>
                                    </div>
                                    <table class="table table-striped table-bordered table-hover" id="import_user_data_table">
                                    </table>

                                </form>
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
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/lang/summernote-zh-CN.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script type="text/javascript">
        jQuery(function($){
            var oTable=$('#import_user_data_table').dataTable({
                "bProcessing":true,//查询显示
                "bStateSave":false,
                "bAutoWidth":true,//列自适应浏览器宽度
                "bDestroy":true,
                "bRetrieve":true,
                "bSort":true,//排序
                "bPaginate":false,//是否分页
                "oLanguage":{
                    "sLengthMenu":"每页显示 _MENU_ 条记录",
                    "sZeroRecords":"抱歉, 没有找到记录",
                    "sInfo":"从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                    "sInfoEmpty":"",
                    "sInfoFiltered":"(从 _MAX_ 条数据中检索)","sSearch":""
                },
                "aoColumnDefs":[
                    { "bSortable":false,"aTargets":[ 0 ] }
                ],//指定某列不可排序
                "aoColumns":[
                    { "sWidth":"1%","sTitle":'<div class="checker" ><span class=""><input type="checkbox" class= "checkAllBox"  title="全选" /></span></div>',"sDefaultContent":"","mRender":function(data,type,full){
                        return '<div class="checker" ><span class=""><input type="checkbox" class="checkboxes" checked="" name="checkBox" value="'+full.id+'"></span></div>';
                    }},
                    { "sTitle":"用户名","mData":"name","sDefaultContent":"","mRender":function(data,type,full){
                        return "<input class='form-control input-small' name='name' type='text' value="+full[1].name+">";
                    }},
                    { "sTitle":"账号","mData":"loginName","sDefaultContent":"","mRender":function(data,type,full){
                        return "<input class='form-control input-small' name='loginName' type='text' value="+full[1].loginName+">";
                    }},
                    { "sTitle":"密码","mData":"password","sDefaultContent":"","mRender":function(data,type,full){
                        return "<input class='form-control input-small' name='password' type='text' value="+full[1].password+">";
                    }},
                    { "sTitle":"用户Id","mData":"userId","sDefaultContent":"","mRender":function(data,type,full){
                        return "<input class='form-control input-small' name='userId' type='text' value="+full[0].userId+">";
                    }},
                    { "sTitle":"用户类型","mData":"userType","sDefaultContent":"","mRender":function(data,type,full){
                        return "<input class='form-control input-small' name='userType' type='text' value="+full[0].userType+">";
                    }},
                    { "sTitle":"来自系统","mData":"fromSystem","sDefaultContent":"","mRender":function(data,type,full){
                        return "<input class='form-control input-small' name='fromSystem' type='text' value="+full[0].userSystem+">";
                    }},
                    { "sTitle":"角色名称","mData":"roleName","sDefaultContent":"","mRender":function(data,type,full){
                        return "<input style='width:350px;' class='form-control input-small' name='roleName' type='text' value="+full[1].role[0].name+">";
                    }},
                    { "sTitle":"邮件","mData":"email","sDefaultContent":"","mRender":function(data,type,full){
                        return "<input style='width:350px;' class='form-control input-small' name='email' type='text' value="+full[0].email+">";
                    }}
                ]
            });
            oTable.fnDraw();
            /**
             *  选择框选中事件
             * */
            jQuery('#import_user_data_table').on('change','tbody tr .checkboxes',function(){
                $(this).parents('span').toggleClass("checked");
            });
            /**
             *  全选 选择框选中事件
             * */
            jQuery('#import_user_data_table').on('change','thead tr .checkAllBox',function(){
                $(this).parents('span').toggleClass("checked");
                checkAllBox(this); //改变每一行选中事件
            });
            $('#import_user_data_table .dataTables_filter input').addClass("form-control input-medium input-inline"); // modify table search input
            $('#import_user_data_table .dataTables_length select').addClass("form-control"); // modify table per page dropdown
            /**
             *  实时上传导入文件
             * */
            $('#myForm').fileupload({
                autoUpload:true,
                method:'POST',
                url:'${rc.contextPath}/import/upload-excel',
                success:function(data){
                    var oTable=$('#import_user_data_table').dataTable();
                    oTable.fnClearTable();
                    if(data.objList){
                        oTable.fnAddData(data.objList);
                    }
                    var errorBack=data.errorBack;
                    if(null!=errorBack&&''!=errorBack){
                        checkStaffExcel(errorBack);
                    }
                }
            });
            /**
             * 移除信息
             */
            $('#toCloseInfo').on('click',function(){
                var ch=$("#import_user_data_table span.checked >input[name='checkBox']");
                var length=ch.length;
                if(length=="0"){
                    bootbox.alert("请选择需要移除的数据");
                    return false;
                }else{
                    if(ch){
                        ch.each(function(i,n){
                            var nRow=$(this).parents('tr')[0];
                            oTable.fnDeleteRow(nRow);
                        });
                    }
                }
            });
        });
        /**
         * 下载模板
         * @param url
         */
        function downLoadExcel(tip){
            location.href='${rc.contextPath}/import/down-load-excel?importType='+tip;
        }
        /**
         * 保存文件信息
         */
        $('#toSaveFile').on('click',function(){
            var ch=$("input[name='checkBox']");
            if(ch.length=='0'){
                bootbox.alert('上传数据为空,请先上传文件！');
                return false;
            }
            $.ajax({
                "dataType":'json',
                "type":"POST",
                "url":'${rc.contextPath}/import/save-user-list',
                "data":$('#myForm').serialize(),
                "success":function(msg){
                    if(msg.stat){
                        bootbox.alert('批量导入文件成功',function(){
                            var oTable=$('#import_user_data_table').dataTable();
                            oTable.fnClearTable();
                        })
                    }else{
                        bootbox.alert('批量导入文件失败');
                    }
                }
            });
        });
        /**
         * 验证导入的用户excel合法性
         */
        function checkStaffExcel(msg){
            var temp=(msg.indexOf("Error")!= -1);//有错误
            if(true==temp){//
                var errorFile=(msg.indexOf("errorFileError")!= -1);//后缀名检查
                var noNumber=(msg.indexOf("noNumberError")!= -1);
                var isEmpty=(msg.indexOf("isEmptyError")!= -1), messInf;//姓名和手机号码不能为空
                if(errorFile==true){
                    messInf="上传文件格式有误,正确格式必须后缀名为xls,xlsx结尾,并保证文档的公开性！";
                }else if(noNumber==true){
                    messInf="上传的Excel文件为空！";
                }else if(isEmpty==true){
                    var isEmptyArr=msg.split("_");
                    messInf="用户Id、账号、类型、来自系统,邮箱不能为空,请检查"+isEmptyArr[0]+"";
                }else if(msg=="failError"){
                    messInf="导入失败！";
                }else{
                    messInf="导入失败！";
                }
                bootbox.alert(messInf);
                return false;
            }else{
                return true;
            }
        }
    </script>
</content>
</html>
