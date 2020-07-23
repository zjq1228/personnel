<%--
  Created by IntelliJ IDEA.
  User: 文沛阳
  Date: 2020/7/22
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/res/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/ztree/jquery.ztree.all.min.js"></script>

    <script LANGUAGE="JavaScript">
        var setting = {
            edit: {
                enable: true
            },
            async:{
                enable: true,
                url: "<%=request.getContextPath()%>/base/list",
                autoParam: ["id"],
                dataFilter: ajaxDataFilter
            },
            data: {
                key: {
                    name: "baseName",
                    isParent: "parent"
                },
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "parentId",
                    rootPId: 0
                }
            },
            callback: {
                beforeDrag: beforeDrag,
                beforeRename: zTreeBeforeRename,
                beforeRemove: zTreeBeforeRemove
            }
        }

        function ajaxDataFilter(treeId, parentNode, responseData) {
            if (responseData) {
                for(var i =0; i < responseData.length; i++) {
                    responseData[i].name = responseData[i].baseName;
                }
            }
            return responseData;
        }

        function beforeDrag(treeId, treeNodes) {
            return false;
        }

        /**
         * 修改
         */
        function zTreeBeforeRename(treeId, treeNode, newName, isCancel){
            $.post("<%=request.getContextPath()%>/base/updateZtree",
                {"id" : treeNode.id, "baseName":newName},
                function(data){
                    if(data.data.code != 200){
                        return false;
                    }

                });
        }

        /**
         *
         *删除
         */
        function zTreeBeforeRemove(treeId, treeNode) {
            $.post("<%=request.getContextPath()%>/base/updateBaseIsdel",
                {"id" : treeNode.id},
                function(data){
                    if(data.data.code != 200){
                    }
                })
        }

        $(document).ready(function(){
            $.fn.zTree.init($("#demotree"), setting);
        });

    </script>
</head>
<body>
    <div id="demotree" class="ztree"></div>
</body>
</html>
