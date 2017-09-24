<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
package ${basepackage}.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ${basepackage}.model.${className}Model;
import ${basepackage}.model.MsgModel;
import ${basepackage}.service.${className}Service;


@Controller
@RequestMapping("/${classNameLower}")
public class ${className}Controller extends BaseController
{	
	private static final Logger logger = LoggerFactory.getLogger(${className}Controller.class);
	
	@Resource
	private ${className}Service ${classNameLower}Service;
	

	/**
	 * 描述信息：分页查询
	 * 创建时间：${now?string('yyyy-MM-dd HH:mm:ss')}
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/query", method=RequestMethod.POST)
	public @ResponseBody MsgModel search(${className}Model model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			${classNameLower}Service.findPageList(model, msgModel);
		}
		catch (Exception e)
		{
			logger.error("${className}Controller search error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：增加
	 * 创建时间：${now?string('yyyy-MM-dd HH:mm:ss')}
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public @ResponseBody MsgModel add(${className}Model model, HttpServletRequest request)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			setSessionUserId(model, request);
			if (${classNameLower}Service.save(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("${className}Controller add error：", e);
		}
		return msgModel;
	}

	
	/**
	 * 描述信息：修改
	 * 创建时间：${now?string('yyyy-MM-dd HH:mm:ss')}
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public @ResponseBody MsgModel modify(${className}Model model, HttpServletRequest request)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			setSessionUserId(model, request);
			if (${classNameLower}Service.update(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("${className}Controller modify error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：删除
	 * 创建时间：${now?string('yyyy-MM-dd HH:mm:ss')}
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/del", method=RequestMethod.POST)
	public @ResponseBody MsgModel delete(${className}Model model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			if (${classNameLower}Service.delete(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("${className}Controller delete error：", e);
		}
		return msgModel;
	}

}
