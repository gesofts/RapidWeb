<%@page import="${basepackage}.model.*" %>
<#include "/macro.include"/> 
<#include "/custom.include"/> 
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
<#assign actionExtension = "do"> 
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/WEB-INF/pages/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=${className}.TABLE_ALIAS%>管理</title>
	
	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	
	<script type="text/javascript" >
		$(document).ready(function() {
			window.simpleTable = new SimpleTable('queryForm',<@jspEl 'page.thisPageNumber'/>,<@jspEl 'page.pageSize'/>,'<@jspEl 'pageRequest.sortColumns'/>');
		});
	</script>
</rapid:override>

<rapid:override name="content">
	<form id="queryForm" name="queryForm" action="<c:url value="${actionBasePath}/list.${actionExtension}"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<div class="njty_title">
			<div class="njty_title_tip"><%=${className}.TABLE_ALIAS%>管理</div>
		</div>
		<table cellpadding="0" cellspacing="0" class="njty_search_table">
			<tr>
			<#list table.notPkColumns?chunk(1) as row>
				<#list row as column>
				<#if !column.htmlHidden>
				<td class="njty_td_bg"><%=${className}.ALIAS_${column.constantName}%>：</td>
 				<#if column.isDateTimeColumn>
 								
				<#else>
				<td class="njty_td_con-r"><input value="<@jspEl "query."+column.columnNameLower/>" id="${column.columnNameLower}" name="${column.columnNameLower}" maxlength="${column.size}"  class=""/></td>
				</#if> 
				</#if>  
				</#list> 
		    </#list>
				<td class="njty_td_con-r">
					<a href="javascript:void(0)" onclick="funClickSubmit('queryForm', '<@jspEl 'ctx'/>${actionBasePath}/list.${actionExtension}')" >
						<div class="icons-search"></div><div class="njty-btn-title">查询</div>
					</a>
				</td>
				<td class="njty_td_br">&nbsp;</td>
			</tr>
		</table>
	</div>
	
	<div class="gridTable">
		<ul class="njty-search_table_tool">
			<li><div class="icons-add" class="njty_btn_add" onclick="funClickSubmit('queryForm', '<@jspEl 'ctx'/>${actionBasePath}/create.${actionExtension}')">增加</div></li>
			<li><div class="icons-remove" onclick="batchDelete('<@jspEl 'ctx'/>${actionBasePath}/delete.${actionExtension}','items',document.forms.queryForm)">删除</div></li>
		</ul>
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr class="tableth">
				<th style="width:50px;">序号</th>
				<th style="width:50px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"/></th>
				
				<#list table.columns as column>
				<#if !column.htmlHidden>
				<th sortColumn="${column.sqlName}" ><%=${className}.ALIAS_${column.constantName}%></th>
				</#if>
				</#list>
	
				<th>详情</th>
				<th>修改</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="<@jspEl 'page.result'/>" var="item" varStatus="status">
		  	  
			  <tr class="<@jspEl "status.count % 2 == 0 ? 'odd' : 'even'"/>">
				<td><@jspEl 'page.thisPageFirstElementNumber + status.index'/></td>
				<td><input type="checkbox" name="items" value="<@generateIdQueryString/>"/></td>
				
				<#list table.columns as column>
				<#if !column.htmlHidden>
				<td><#rt>
					<#compress>
					<#if column.isDateTimeColumn>
					<c:out value='<@jspEl "item."+column.columnNameLower+"String"/>'/>&nbsp;
					<#else>
					<c:out value='<@jspEl "item."+column.columnNameLower/>'/>&nbsp;
					</#if>
					</#compress>
				<#lt></td>
				</#if>
				</#list>
				<td align="center" width="60px;">
					<a href="<@jspEl 'ctx'/>${actionBasePath}/show.${actionExtension}?<@generateIdQueryString/>" class="njty-list-detail" title="详情"></a>
				</td>
				<td align="center" width="60px;">
				    <a href="<@jspEl 'ctx'/>${actionBasePath}/edit.${actionExtension}?<@generateIdQueryString/>" class="njty-list-modify" title="修改"></a>
				</td>
			  </tr>
			  
		  	  </c:forEach>
		  </tbody>
		</table>
	
		<simpletable:pageToolbar page="<@jspEl 'page'/>">
		</simpletable:pageToolbar>
	</div>
	</form>
</rapid:override>

<%@ include file="/WEB-INF/pages/commons/base.jsp" %>

<#macro generateIdQueryString>
	<#if table.compositeId>
		<#assign itemPrefix = 'item.id.'>
	<#else>
		<#assign itemPrefix = 'item.'>
	</#if>
<#compress>
		<#list table.compositeIdColumns as column>
			<#t>${column.columnNameLower}=<@jspEl itemPrefix + column.columnNameLower/>&
		</#list>				
</#compress>
</#macro>