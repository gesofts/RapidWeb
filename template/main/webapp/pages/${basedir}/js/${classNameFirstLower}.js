<#include "/macro.include"/>
<#include "/custom.include"/>  
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#list table.pkColumns as column><#assign columnPk = column.columnName?uncap_first></#list>

var Page${className} = function(){
    return {
        defaultOption: {
            basePath:"",
            ${classNameLower}Grid : null
        },
        init :function ()
        {
            mini.parse();
            this.basePath = PageMain.basePath;
            this.${classNameLower}Grid = mini.get("${classNameLower}Grid");
            this.funSearch();
        },
        funSearch : function()
        {
        	var ${classNameLower}Form = new mini.Form("${classNameLower}Form");
        	this.${classNameLower}Grid.load(${classNameLower}Form.getData());
        },
        funReset : function()
        {
        	var ${classNameLower}Form = new mini.Form("${classNameLower}Form");
        	${classNameLower}Form.setData();
            this.${classNameLower}Grid.load();

        },
        funAdd : function()
        {
        	var paramData = {action: "add", row:{}, title:"新增数据"};
            this.funOpenInfo(paramData);
        },
        funModify : function()
        {
        	var row = this.${classNameLower}Grid.getSelected();
            if(row)
            {
            	var paramData = {action: "modify", row: row, title:"编辑数据"};
                this.funOpenInfo(paramData);
            }
            else
            {
            	PageMain.funShowMessageBox("请选择一条记录");
            }
        },
        funOpenInfo : function(paramData)
        {
        	var me = this;
        	mini.open({
                url: this.basePath + "/pages/${basedir}/${classNameLower}_add.jsp",
                title: paramData.title,
                width: 400,
                height: 30 *  ${table.columns?size} + 65,
                onload:function(){
                    var iframe=this.getIFrameEl();
                    iframe.contentWindow.Page${className}Add.funSetData(paramData);
                },
                ondestroy:function(action){
                	me.${classNameLower}Grid.reload();
                }
            })
        },
        funDelete : function()
        {
            var row = this.${classNameLower}Grid.getSelected();
            var me = this;
            if(row)
            {
                mini.confirm("确定要删除这条记录?", "提醒", function (action) {
                    if (action == "ok") 
                    {
                        $.ajax({
                            url : me.basePath + "/${classNameLower}/del",
                            type: 'POST',
                            data: {"${columnPk}": row.${columnPk}},
                            dataType: 'json',
                            success: function (data)
                            {
                            	mini.alert(data.msg, "提醒", function(){
                            		if(data.success)
                                    {
                            			 me.${classNameLower}Grid.reload();
                                    }
                                });
                                
                            },
                            error: function ()
                            {
                                mini.alert("删除记录失败");
                            }
                        });
                    }
                })
            }
            else
            {
                mini.alert("请先选择要删除的记录");
            }
        }
    }
}();

$(function(){
	Page${className}.init();
});