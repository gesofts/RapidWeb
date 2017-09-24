<#include "/macro.include"/>
<#include "/custom.include"/>  
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#assign actionExtension = "do"> 
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/pages/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=${className}.TABLE_ALIAS%>新增</title>
</rapid:override>

<rapid:override name="content">
	<div class="njty_title">
		<div class="njty_title_tip"><%=${className}.TABLE_ALIAS%>新增</div>
	</div>
	<s:form action="${actionBasePath}/save.${actionExtension}" method="post">
		<table class="formTable">
			<%@ include file="${jspFileBasePath}/form_include.jsp" %>
			<tr>
				<td class="njty_tbl" colspan="2" align="center" style="padding-top: 0px; padding-bottom: 0px;">
					<div class="njty_btn_bartool njty-border0" style="margin: 8px auto 0 auto;">
						<div style="width: 400px; margin: 0 auto; border: 0px solid red;">
							<input id="submitButton" name="submitButton" type="submit" value="提交" style="display: none;"/>
							<a href="javascript:void(0)" onclick="$('#submitButton').click()">
								<div class="njty_btn_save_tip"></div>
								<div class="njty_btn_html">提<span style="padding: 0 2px;"></span>交</div>
							</a>
							<a href="javascript:void(0)" onclick="window.location='<@jspEl 'ctx'/>${actionBasePath}/list.${actionExtension}'">
								<div class="njty_btn_back_tip"></div>
								<div class="njty_btn_html">返<span style="padding: 0 2px;"></span>回</div>
							</a>
							<div style="clear: both;"></div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</s:form>
<%-- 	<s:form action="${actionBasePath}/save.${actionExtension}" method="post">
		<table class="formTable">
			<%@ include file="${jspFileBasePath}/form_include.jsp" %>
		</table>
		
		<div class="njty_btn_bartool">
			<div style="width: 400px; margin: 0 auto;">
				<input id="submitButton" name="submitButton" type="submit" value="提交" style="display: none;"/>
				<a href="javascript:void(0)" class="njty_btn_save" onclick="$('#submitButton').click()"><div class="njty_btn_save_tip"></div></a>
				<a href="javascript:void(0)" class="njty_btn_back" onclick="window.location='<@jspEl 'ctx'/>${actionBasePath}/list.${actionExtension}'"><div class="njty_btn_back_tip"></div></a>
			</div>
		</div>
	</s:form> --%>
	
	<script>
		
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			return disableSubmit(finalResult,'submitButton');
		}});
	</script>
</rapid:override>
<%@ include file="/WEB-INF/pages/commons/base.jsp" %>