<%@page import="${basepackage}.model.*" %>
<#include "/macro.include"/> 
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/pages/commons/taglibs.jsp" %>

<#list table.columns as column>
<#if column.htmlHidden>
	<s:hidden id="${column.columnNameLower}" name="${column.columnNameLower}" />
</#if>
</#list>

<#list table.columns as column>
	<#if !column.htmlHidden>
	
	<#if column.isDateTimeColumn>
	<tr>	
		<td class="njty_tbg">
			<#if !column.nullable><span class="required">*</span></#if><%=${className}.ALIAS_${column.constantName}%>
		</td>	
		<td class="njty_tbl">
			<input value="<@jspEl 'model.'+column.columnNameLower+'String'/>" onclick="WdatePicker({dateFmt:'<%=${className}.FORMAT_${column.constantName}%>'})" id="${column.columnNameLower}String" name="${column.columnNameLower}String"  maxlength="0" class="${column.validateString}" />
		</td>
	</tr>
	<#else>
	<tr>	
		<td class="njty_tbg">
			<#if !column.nullable><span class="required">*</span></#if><%=${className}.ALIAS_${column.constantName}%>
		</td>	
		<td class="njty_tbl">
			<input value="<@jspEl 'model.'+column.columnNameLower/>" id="${column.columnNameLower}" name="${column.columnNameLower}" maxlength="${column.size}" value="%{model.${column.columnNameLower}}" cssClass="${column.validateString}" required="${(!column.nullable)?string}"  onblur="$(this).val($.trim($(this).val()))"/>
		</td>
	</tr>
	</#if>
	
	</#if>
</#list>