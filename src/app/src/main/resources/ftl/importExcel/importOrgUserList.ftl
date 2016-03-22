<html>
<head>
    <title>导入组织用户列表</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css" type="text/css"/>
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
                <a href="#">组织用户导入</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>组织用户导入列表</div>
            </div>
            <div class="portlet-body">
                <div class="table-container">
                    <div class="row" id="tableDatas">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <button type="button" class="btn blue start" onclick="downLoadExcel(9)">
                                    <i class="fa fa-long-arrow-down"></i>
                                            <span>
                                                 下载模板
                                            </span>
                                </button>
                                <form style="margin-top: 5px;margin-bottom: 5px;" action="" enctype="multipart/form-data" method="post" class="form-horizontal" id="myForm">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <input type="hidden" name="importType" value="9"/>
                                            <div class="fileinput fileinput-new" data-provides="fileinput" id="uploadFile_old">
                                                <span class="btn green btn-file" id="uploadFile_clone">
                                                    <i class="fa fa-long-arrow-down"></i>
                                                    <span class="fileinput-new">
                                                          上传文件
                                                    </span>
                                                    <input type="file" name="uploadFile" id="uploadFile"  onchange="getFullPath(this,'zipLocalPath')">
                                                </span>
                                            </div>
                                            <span id="zipLocalPath" class="file-block">请选择要导入的文件.</span>
                                        </div>
                                    </div>
                                    <button style="margin-top: 5px;"  type="button" class="btn green" onclick="save();">
                                        <i class="fa fa-long-arrow-down"></i>
                                            <span>
                                                 保存上传
                                            </span>
                                    </button>
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
    <script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/scripts/datatable.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/lib/jquery.form.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/localization/messages_zh.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jstree/dist/jstree.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/common/common.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/common/ajaxfileupload.js" type="text/javascript"></script>
    <script type="text/javascript">
        function save(){
           Metronic.startPageLoading();
            $.ajaxFileUpload
            (
               {
                    url:'${rc.contextPath}/import/upload-save-excel',
                    secureuri:false,
                    fileElementId:'uploadFile',
                    dataType: 'json',
                    data:{"importType":"9"},
                    success:function(data)
                    {
                        Metronic.stopPageLoading();
                        successMsg();
                    },
                    error: function (data, status, e)
                    {
                        Metronic.stopPageLoading();
                        var errMsg=data.responseText;
                            errMsg = errMsg.replace("<pre style=\"word-wrap: break-word; white-space: pre-wrap;\">", "");
                            errMsg = errMsg.replace("</pre>", ""); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
                            //将String字符串转换成json
                            var obj = eval('(' + errMsg + ')');
                            if(obj.stat){
                                successMsg();
                            }else{
                                checkStaffExcel(obj.msg);
                            }
                    }
               }
            );
        }

        function successMsg(){
            bootbox.dialog({
                message: '批量导入成功，是否进行查看?',
                title: '导入数据',
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
                            location.href='${rc.contextPath}/system/organization';
                        }
                    }
                }
            });
        }

        //获取上传文件的名字
        function getFullPath(obj,id){
            if(obj){
                var path=obj.value;
                var index=path.lastIndexOf("\\")+1;
                if(index>0){
                    $('#'+id).html(path.substr(index));
                }else{
                    $('#'+id).html(path);
                }
            }
        }

        /**
         * 下载模板
         * @param url
         */
        function downLoadExcel(tip){
            location.href='${rc.contextPath}/import/down-load-excel?importType='+tip;
        }

        /**
         * 验证导入OA的用户excel合法性
         */
        function checkStaffExcel(msg){
            var temp=(msg.indexOf("Error")!= -1);//有错误
            if(true==temp){//
                var isValidatorError=(msg.indexOf("isValidatorError")!= -1);//有相同的用户名
                var errorFile=(msg.indexOf("errorFileError")!= -1);//后缀名检查
                var noNumber=(msg.indexOf("noNumberError")!= -1);
                var isEmpty=(msg.indexOf("isEmptyError")!= -1), messInf;//姓名和手机号码不能为空
                if(errorFile==true){
                    messInf="上传文件格式有误,正确格式必须后缀名为xls,xlsx结尾,并保证文档的公开性！";
                }else if(noNumber==true){
                    messInf="上传的Excel文件为空！";
                }else if(isEmpty==true){
                    var isEmptyArr=msg.split("_");
                    messInf="用户Id、账号、类型、来自系统不能为空,请检查"+isEmptyArr[0]+"";
                }else if(msg=="failError"){
                    messInf="导入失败！";
                }else if(isValidatorError==true){
                    messInf=msg.replace("@isValidatorError","登录名已存在,请重新编辑");
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
