<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <!-- Bootstrap 插件 css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- Bootstrap 核心css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap TreeView css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-treeview/dist/bootstrap-treeview.min.css" rel="stylesheet">

    <!-- Bootstrap addTabs css -->
    <link href="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.css" rel="stylesheet">

    <!-- Bootstrap table css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">
    <!-- bootstrap-datetimepicker css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">

    <!-- bootstrap-dialog css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-dialog/dist/css/bootstrap-dialog.css" rel="stylesheet">
    <!-- bootstrap-fileinput css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-fileinput/css/fileinput.css" rel="stylesheet">
    <style type="text/css">
        .btn-group > .btn, .btn-group-vertical > .btn {
            position: relative;
            float: left;
            width: 50.9px;
            height: 34px;
        }
    </style>
</head>
<body>
<!--jQuery核心js  -->
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<!-- bootstrap 核心js文件 -->
<script src="<%=request.getContextPath() %>/js/bootstrap/js/bootstrap.min.js"></script>
<!-- bootStrap TreeView -->
<script src="<%=request.getContextPath() %>/js/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>



<!-- bootStrap table -->
<script src="<%=request.getContextPath() %>/js/bootstrap-table/dist/bootstrap-table.js"></script>
<!-- bootStrap table 语言包中文-->
<script src="<%=request.getContextPath() %>/js/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>

<!-- bootstrap-datetimepicker -->
<script src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<!-- bootstrap-dialog -->
<script src="<%=request.getContextPath() %>/js/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>
<!-- bootstrap-fileinput -->
<script src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/fileinput.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/locales/zh.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/chart-master/Chart.js"></script>


<table id="jueselist1" ></table>
<div class="modal fade" id="myModalyanzhengxinwen2" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <form  id="xinwenlista2">

                    <table class="table table-bordered"  >
                        <input type="hidden" name="newsid"/>

                        <tr>
                            <td>用户</td>
                            <td>
                                <input type="text" name="username"/>
                            </td>
                        </tr>
                        <tr>
                            <td>密码</td>
                            <td><input type="text" name="userpass"/></td>
                        </tr>
                    </table>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-success"  id="addxin">提交</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<section class="wrapper">
    <button type="button" class="btn btn-success" onclick="addxinwen()">添加</button>
    <table class="table" id="ppojjnj" border="1" ></table>
</section>

<div class="modal fade" id="modal-container-123456" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
    <form class="form-login" id="updateuser" action="index.jsp">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                    <h4 class="modal-title">修改页面</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="userid"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-5">
                            <input type="text" name="username">
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-5">
                            <input type="text" name="userpass">
                        </div>
                    </div>
                    <br>


                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
                    <button class="btn btn-primary" type="button" onclick="updateNews()">保存</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    function sou(){
        $("#jueselist1").bootstrapTable("refresh");
    }
    $(function(){
        $("#jueselist1").bootstrapTable({
            url:"<%=request.getContextPath()%>/userController/selectUserList",
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            columns:[
                {field:'userid',title:'序号',width:90},
                {field:'username',title:'客户名',width:90},
                {field:'userpass',title:'成交时间',width:90},
                {field:'act',title:'操作',width:390,
                    formatter: function(value,row,index){
                        return "<button href='#modal-container-123456'   data-toggle='modal' type='button' class='btn btn-primary' onclick='queryByIdNews("+row.userid+")'>修改</button>&nbsp;&nbsp;<button href='#modal-container-123456'  data-toggle='modal' type='button' class='btn btn-primary' onclick='deletexin("+row.userid+")'>删除</button>";
                    }
                },
            ]
        })
    })
    function   deletexin(userid){

        $.ajax({
            url:"<%=request.getContextPath()%>/userController/deleteuser",
            tpey:"post",
            data:{"userid":userid},
            success:function(){
                location.reload();
            }

        })
    }
    function   addxinwen(){
        $('#myModalyanzhengxinwen2').modal({
            keyboard:false,
            backdrop:false
        })
    }

    $("#addxin").click(function(){

        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/userController/addxinwen",
            data:$("#xinwenlista2").serialize(),
            success:function(){
                location.reload();
            },
            error:function(){

            }
        })
    })
    //回显
    function queryByIdNews(userid){
        $.ajax({
            url:"<%=request.getContextPath()%>/userController/queryByIdNews",
            type:"post",
            data:{"userid":userid},
            dataType:"json",
            async:false,
            success:function(news){
                $("[name='userid']").val(news.userid);
                $("[name='username']").val(news.username);
                $("[name='userpass']").val(news.userpass);
            },
            error:function(){
                alert("回显出错");
            }
        })
    }
    //修改
    function updateNews(){
        $.ajax({
            url:"<%=request.getContextPath()%>/userController/updateNews",
            type:"post",
            data:$("#updateuser").serialize(),
            dataType:"text",
            async:false,
            success:function(){
                location.reload();
            },
            error:function(){
                alert("修改出错");
            }
        })
    }
</script>
</body>
</html>