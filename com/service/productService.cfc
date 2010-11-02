<cfcomponent extends="slat.com.service.baseService" accessors="true" >

	<cfproperty name="SkuDAO" type="any" />
	
	<cfset variables.entityName = "" />
	
	<cffunction name="init">
		<cfargument name="DAO" type="any" />
		<cfargument name="SkuDAO" type="any" />
		
		<cfset setDAO(arguments.DAO) />
		<cfset setSkuDAO(arguments.SkuDAO) />
	</cffunction>
	
	<cffunction name="getSmartList">
		<cfargument name="rc" />
				
		<cfset var SmartList = createObject("component","slat.com.entity.smartlist").init("product", arguments.rc) />
		
		<cfset SmartList.addKeywordColumn('ProductCode', 9) />
		<cfset SmartList.addKeywordColumn('ProductName', 4) />
		<cfset SmartList.addKeywordColumn('ProductDescription', 1) />
		<cfset SmartList.addKeywordColumn('Brand_BrandID', 6) />
		<cfset SmartList.addKeywordColumn('Brand_BrandName', 6) />
		
		<cfreturn getDAO().fillSmartList(SmartList) />
	</cffunction>
	
</cfcomponent>