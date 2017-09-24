<#include "/macro.include"/> 
<#include "/custom.include"/> 
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
<#macro mapperEl value>${r"${"}${value}}</#macro>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/pages/common/top-include.jsp" %>
    <script type="text/javascript" src="<c:url value='/pages/${basedir}/js/${classNameLower}_add.js'/>"></script>
    <title></title>
    <style>
        .mini-grid-cell-inner, .mini-grid-headerCell-inner {
            padding: 3px 0 !important;
        }
        .mini-textbox-border{
            height: 24px;
        }
        .mini-textbox-input{
            height: 24px;
            line-height: 24px;
        }
        .mini-textbox{
            height: 27px;
        }

        html, body {
            margin: 0px;
            padding: 0;
            border: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
    </style>
</head>
<body>
<div class="mini-layout" style="width: 100%;height: 100%;" allowResize="false">
        <div title="center" region="center" allowResize="false" showSplit="true" showSplitIcon="false" allowUnselect="false" style="border:0 none;">
        <div id="${classNameLower}FormAdd">
       
            <#list table.columns as column>
                <#if column.htmlHidden>
                	<input id="${column.columnNameLower}" name="${column.columnNameLower}"  class="mini-hidden" />
                </#if>
            </#list>
            <table class="form-table" border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;">
                <#list table.columns as column>
                    <#if !column.htmlHidden>
                        <#if column.isDateTimeColumn>
                <tr>
                    <td class="form-label" style="text-align: right;width:16%;">${column.columnAlias}：</td>
                    <td style="width:32%;">
                    	<input name="${column.columnNameLower}" id="${column.columnNameLower}" class="mini-datepicker" style="width:200px;" format="yyyy-MM-dd"  nullValue="null"  emptyText="开始时间" allowInput="false"/>
                    </td>
                    
                    
                    
                </tr>
                            <#else>
                <tr>
                    <td class="form-label" style="text-align: right;width:16%;">${column.columnAlias}：</td>
                    <td style="width:32%;">
                        <input name="${column.columnNameLower}" id="${column.columnNameLower}" class="mini-textbox" style="width:200px;"  required="true" maxlength="${column.size}" requiredErrorText="${column.columnAlias}不能为空"/>
                    </td>
                </tr>
                        </#if>
                    </#if>
                </#list>
            </table>
         </div>
            
        </div>
        <div  region="south" showSplit="false" showSplitIcon="false" height="30" showHeader="false"  style="border: none">
	        <div class="mini-toolbar" style="position: fixed;left:0;bottom: 0;right:0;text-align: center;border-width: 1px 0 0 0" >
	            <a class="mini-button cursor" onclick="Page${className}Add.funSave()" iconCls="icon-save">保存</a>
	            <a class="mini-button cursor" onclick="Page${className}Add.funCancel()" iconCls="icon-cancel" style="margin:0 20px;">取消</a>
	        </div>
        </div>
    </div>
    <script type="text/javascript">
    	mini.parse();
    </script>
</body>
</html>
