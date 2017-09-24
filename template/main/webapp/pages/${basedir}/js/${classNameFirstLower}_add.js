<#include "/macro.include"/>
<#include "/custom.include"/>  
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#list table.pkColumns as column><#assign columnPk = column.columnName?uncap_first></#list>

var Page${className}Add = function(){
    return {
        defaultOption: {
            basePath:"",
            action : "",
            ${classNameLower}Form : null
            
        },
        init :function ()
        {
            mini.parse();
            this.basePath = PageMain.basePath;
            this.${classNameLower}Form = new mini.Form("${classNameLower}FormAdd");
        },
        funSetData : function(data)
        {
        	var row = data.row;
        	this.action = data.action;
        	this.${classNameLower}Form.setData(row);
        },
        funSave : function()
        {
        	this.${classNameLower}Form.validate();
            if (!this.${classNameLower}Form.isValid()) 
            {
                 var errorTexts = form.getErrorTexts();
                 for (var i in errorTexts) 
                 {
                     mini.alert(errorTexts[i]);
                     return;
                 }
            }
            
            var me = this;
            var obj = this.${classNameLower}Form.getData(true);
            $.ajax({
               url : me.basePath + "/${classNameLower}/" + me.action + "?a="+Math.random(),
               type : 'POST',
               data : obj,
               dataType: 'json',
               success: function (data) 
               {
            	   mini.alert(data.msg, "提醒", function(){
	               		if(data.success)
	                    {
	               			PageMain.funCloseWindow("save");
	                    }
                   });
               },
               error: function (jqXHR, textStatus, errorThrown) 
               {
            	   PageMain.funShowMessageBox("操作出现异常");
               }
           });
        },
        funCancel : function()
        {
        	PageMain.funCloseWindow("cancel");
        }
    }
}();

$(function(){
	Page${className}Add.init();
});