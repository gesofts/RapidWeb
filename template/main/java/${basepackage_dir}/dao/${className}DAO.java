<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   
package ${basepackage}.dao;

import org.springframework.stereotype.Repository;

import ${basepackage}.common.EntityDAOImpl;
import ${basepackage}.model.${className}Model;


@Repository
public class ${className}DAO extends EntityDAOImpl<${className}Model, Long>
{
	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "${className}Mapper";
    }
}
