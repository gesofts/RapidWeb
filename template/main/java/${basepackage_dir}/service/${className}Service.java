<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ${basepackage}.common.EntityDAO;
import ${basepackage}.common.EntityService;
import ${basepackage}.dao.${className}DAO;
import ${basepackage}.model.${className}Model;

@Service
@Transactional
public class ${className}Service extends EntityService<${className}Model, Long>
{

	@Resource
	private ${className}DAO ${classNameLower}DAO;
	
	@Override
	protected EntityDAO<${className}Model, Long> getEntityDao()
	{
		return this.${classNameLower}DAO;
	}
}
