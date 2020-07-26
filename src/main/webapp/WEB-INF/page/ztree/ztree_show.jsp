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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/res/ztree//demo.css" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/ztree/jquery.ztree.all.min.js"></script>
    <script type="text/javascript" src = "<%=request.getContextPath()%>/res/layer/layer.js"></script>

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
            view: {expandSpeed:"",
                addHoverDom: addHoverDom,
                removeHoverDom: removeHoverDom,
                selectedMulti: false
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
        /**
         * 增加
         */
        var newCount = 1;
        function addHoverDom(treeId, treeNode) {
            var sObj = $("#" + treeNode.tId + "_span");
            if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='add node' onfocus='this.blur();'></span>";
            sObj.after(addStr);
            var btn = $("#addBtn_"+treeNode.tId);
            if (btn) btn.bind("click", function(){
                layer.open({
                    type: 2,
                    title: '添加信息',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['380px', '90%'],
                    content: '<%=request.getContextPath()%>/base/toAdd?parentId='+treeNode.id //iframe的url
                });
                return false;
            });
        };
        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_"+treeNode.tId).unbind().remove();
        };

        $(document).ready(function(){
            $.fn.zTree.init($("#treeDemo"), setting);
        });

    </script>
    <style type="text/css">
        .ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
    </style>
</head>
<body>



        <div id="treeDemo" class="ztree"></div>




</body>
</html>
