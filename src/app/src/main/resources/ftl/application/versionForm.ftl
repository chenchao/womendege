<html>
<head>
    <title>应用版本新增/编辑</title>
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
                <a href="${rc.contextPath}/">应用管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="${rc.contextPath}/application/version">应用版本</a>
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
                    <i class="fa fa-gift"></i>应用版本<#if action?? && action == 'create'>新增</#if><#if action?? && action == 'update'>编辑</#if>
                </div>
            </div>
            <div class="portlet-body form">
                <form id="myForm" action="${rc.contextPath}/application/version/${action}" class="form-horizontal" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${knVersion.id}"/>
                    <input type="hidden" name="imgAddress" id="imgAddress" value="${knVersion.imgAddress}"/>
                    <input type="hidden" name="address" value="${knVersion.address}"/>
                    <input type="hidden" name="iosHttpsAddress" value="${knVersion.iosHttpsAddress}"/>
                    <input type="hidden" name="num" value="${knVersion.num}"/>

                    <div class="form-body">
                        <h3 class="form-section">基本信息</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">应用名称<span class="required">
											 *
										</span></label>

                                    <div class="col-md-10">
                                        <select name="applicationInfo.id" id="applicationInfo" class="form-control">
                                            <#list listApp as r>
                                                <option value="${r.id}">${r.title}</option>
                                            </#list>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">版本状态<span class="required">
											 *
										</span></label>

                                    <div class="col-md-10">
                                        <select name="workStatus" class="form-control" id="workStatus">
                                            <option value="usable">可用</option>
                                            <option value="prototype">原型</option>
                                            <option value="introduce">介绍</option>
                                            <option value="test">测试</option>
                                            <option value="unusable">不可用</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" id="platformDiv">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">运行平台<span class="required">
											 *
										</span></label>

                                    <div class="col-md-10">
                                        <select name="type" class="form-control" id="type">
                                            <option value="IPHONE">IPHONE</option>
                                            <option value="IPAD">IPAD</option>
                                            <option value="ANDROID">Android_手机版</option>
                                            <option value="ANDROID_PAD">Android_平板</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">安装包</label>

                                    <div class="col-md-10">
                                        <div class="col-md-4">
                                            <span class="btn green btn-file" style="width: 150px;">
                                                <i class="fa fa-search"></i>
                                                 <span class="fileinput-new">
                                                     选择安装包
                                                </span>
                                                 <input type="file" name="addressName" onchange="getFullPath(this,'localPath');">
                                            </span>
                                        </div>
                                        <span id="localPath" style="padding-left:25px;" class="file-block"></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">强制更新<span class="required">
											 *
										</span></label>

                                    <div class="col-md-10">
                                        <select name="forcedUpdate" class="form-control" id="forcedUpdate">
                                            <option value="0">否</option>
                                            <option value="1">是</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6" id="imageDiv">
                                <div class="form-group">
                                    <label class="control-label col-md-2">桌面图标</label>

                                    <div class="col-md-10">
                                        <div class="col-md-4" style="vertical-align: middle; height: 74px; line-height: 74px;">
                                            <span class="btn green btn-file" id="uploadFile_clone1" style="width: 150px;">
                                                 <i class="fa fa-search"></i>
                                                <span class="fileinput-new">
                                                      选择图标文件
                                                </span>

                                             <input type="file" name="imageFile" id="imageFile" onchange="javascript:setImagePreview('imageFile' ,'showIcon' ,'localImag' ,'74px' ,'74px' ,'74px' ,'74px')">
                                            </span>
                                            <span></span>
                                        </div>
                                        <div class="col-md-6">
                                            <div id="localImag">
                                                <img src="${rc.contextPath}${knVersion.imgAddress}" width="74px" height="74px" id="showIcon" name="showIcon"/>
                                                <span class="help-block" style="color: red;">图标最好为57*57,114*114png格式</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">验证方式</label>
                                    <div class="radio-list">
                                        <label class="radio-inline">
                                            <input type="radio" name="optionsRadios" id="optionsRadios_1" value="1" checked>无验证</label>
                                        <label class="radio-inline">
                                            <input type="radio" name="optionsRadios" id="optionsRadios_2" value="2"  <#if knVersion.applicationInfo.optionsRadios == '2'>checked</#if> > 登录验证 </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="optionsRadios" id="optionsRadios_3" value="3" <#if knVersion.applicationInfo.optionsRadios == '3'>checked</#if> >手机验证 </label>
                                        <label class="radio-inline">
                                            <a href="#" title="下载页面验证方式,选择无验证表示扫描二维码进入直接下载,无需验证;选择登陆验证表示进入时需要用户名密码进行登陆才能下载;手机验证表示进入时需要使用手机号接受验证码进行下载;"><img src="${rc.contextPath}/assets/global/img/help/help.png"></a>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">版本说明</label>

                                    <div class="col-md-10">
                                        <textarea class="form-control" style="resize:none;" rows="3" id="remark" name="remark">${knVersion.remark}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h3 class="form-section">其它信息</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-2">版本号</label>
                                    <div id="num">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-2">文件大小</label>
                                    <div id="versionSize">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-2">下载地址</label>
                                    <div id="address">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-2">IOS7地址</label>
                                    <div id="iosHttpsAddress">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-2">创建时间</label>
                                    <div id="createTime">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-2">更新时间</label>
                                    <div  id="updateTime">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green">保存</button>
                                <button type="button" class="btn default" onclick="javascript:window.location.href='${rc.contextPath}/application/version';">取消</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<content tag="script">
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/lang/summernote-zh-CN.js" type="text/javascript"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.js"></script>
    <script type="text/javascript">
        /**
         * 检测 表单所填是否符合规则
         */
        function checkInfo(){
            return $('#myForm').valid();
        }
        /**
         * 设置 应用版本回填信息
         */
        jQuery(function($){
            <#if action == 'update'>
            var appId="${knVersion.applicationInfo.id}", workStatus="${knVersion.workStatus}", type="${knVersion.type}", forcedUpdate="${knVersion.forcedUpdate}", address= "${knVersion.address}",iosHttpsAddress= "${knVersion.iosHttpsAddress}",createTime = "${knVersion.createTime}",updateTime= "${knVersion.updateTime}",num = "${knVersion.num}",versionSize= "${knVersion.versionSize}";
            $("#applicationInfo option[value="+appId+"]").attr('selected','true');
            $("#forcedUpdate option[value="+forcedUpdate+"]").attr('selected','true');
            if(workStatus&&workStatus.length){
                $("#workStatus option[value="+workStatus+"]").attr('selected','true');
                changWorkStatus(workStatus,type);
            }

            if(iosHttpsAddress && iosHttpsAddress.length){
                var a = iosHttpsAddress,b,c;
                iosHttpsAddress = factorial(iosHttpsAddress,70);
                b = iosHttpsAddress,c = '<span class="leftSize_d"><a href='+a+' >'+b+'</a></span>';;
                $('#iosHttpsAddress').html(c);
                $('#iosHttpsAddress').addClass("hiddenDiv");
            }
            if(address && address.length){
                $('#localPath').html(address.substr(address.lastIndexOf('/')+1));
                if(type.indexOf('IPHONE')!= -1||type.indexOf('iphone')!= -1||type.indexOf('IPAD')!= -1||type.indexOf('ipad')!= -1){
                    address = address.replace('.plist','.ipa');
                }
                address = getURL('${rc.contextPath}')+address;
                var a = address,b,c;
                address = factorial(address,70);
                b = address,c = '<span class="leftSize_d"><a href='+a+' >'+b+'</a></span>';;
                $('#address').html(c);
                $('#address').addClass("hiddenDiv");
            }
            if(createTime && createTime.length){
                $('#createTime').html(new Date(Number(createTime)).format('yyyy-MM-dd hh:mm'));
                $('#createTime').addClass("hiddenDiv");
            }
            if(updateTime && updateTime.length){
                $('#updateTime').html(new Date(Number(updateTime)).format('yyyy-MM-dd hh:mm'));
                $('#updateTime').addClass("hiddenDiv");
            }
            if(num && num.length){
                $('#num').html(num);
                $('#num').addClass("hiddenDiv");
            }
            if(versionSize && versionSize.length){
                var va = Number(versionSize);
                $('#versionSize').html((va/1024*1024).toFixed(0)+"M");
                $('#versionSize').addClass("hiddenDiv");
            }
            </#if>
        })
        /**
         * 功能状态选择
         */
        $('#workStatus').on('change',function(){
            changWorkStatus($(this).val(),null);
        });
        /**
         * @param 功能状态选择
         */
        function changWorkStatus(ws,deType){
            if('introduce'==ws){
                $('#imageDiv').attr('disabled','disabled').attr('hidden','hidden');
                $('#platformDiv').attr('disabled','disabled').attr('hidden','hidden');
            }else{
                $('#platformDiv').removeAttr('disabled').removeAttr('hidden');
                var type=$('#type').val();
                if(type==null){
                    type='';
                }
                if(deType!=null){
                    type=deType;
                }
                setImage(type);
            }
        }
        /**
         * 平台选择
         */
        $('#type').on('change',function(){
            var type=$(this).val();
            setImage(type);
        });
        /**
         * 抽离设置图片显示（非预览）方法
         * @param type
         */
        function setImage(type){
            if(type.indexOf('ANDROID')!= -1||type.indexOf('android')!= -1){
                $('#imageDiv').attr('disabled','disabled').attr('hidden','hidden');
            }else{
                $('#imageDiv').removeAttr('disabled').removeAttr('hidden');
            }
            $("#type option[value="+type+"]").attr('selected','true');
        }
    </script>
</content>
</html>
