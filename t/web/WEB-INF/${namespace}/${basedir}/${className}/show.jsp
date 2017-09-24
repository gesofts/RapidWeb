<%@page import="${basepackage}.model.*" %>
<#include "/macro.include"/> 
<#include "/custom.include"/> 
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#assign actionExtension = "do"> 
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/pages/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=${className}.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<div class="njty_title">
		<div class="njty_title_tip"><%=${className}.TABLE_ALIAS%>信息</div>
	</div>
	<s:form action="${actionBasePath}/list.${actionExtension}" method="post" theme="simple">
	<#list table.columns as column>
	<#if column.pk>
		<s:hidden name="${column.columnNameLower}" id="${column.columnNameLower}" value="%{model.${column.columnNameLower}}"/>
	</#if>
	</#list>
	
		<table class="formTable">
		<#list table.columns as column>
		<#if !column.htmlHidden>
			<tr>	
				<td class="njty_tbg"><%=${className}.ALIAS_${column.constantName}%>:</td>	
				<td class="njty_tbl"><#rt>
				<#compress>
				<#if column.isDateTimeColumn>
				<s:property value="%{model.${column.columnNameLower}String}" />
				<#else>
				<s:property value="%{model.${column.columnNameLower}}" />
				</#if>
				</#compress>
				<#lt></td>
			</tr>
		</#if>
		</#list>
		</table>
		
		<div class="njty_btn_bartool">
			<a href="javascript:void(0)" class="njty_btn_back" onclick="window.location='<@jspEl 'ctx'/>${actionBasePath}/list.${actionExtension}'"><div class="njty_btn_back_tip"></div></a>
		</div>
	</s:form>
</rapid:override>

<%@ include file="/WEB-INF/pages/commons/base.jsp" %>