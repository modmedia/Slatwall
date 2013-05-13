<!---

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) 2011 ten24, LLC

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
 
    As a special exception, the copyright holders of this library give you
    permission to link this library with independent modules to produce an
    executable, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting executable under
    terms of your choice, provided that you also meet, for each linked
    independent module, the terms and conditions of the license of that
    module.  An independent module is a module which is not derived from
    or based on this library.  If you modify this library, you may extend
    this exception to your version of the library, but you are not
    obligated to do so.  If you do not wish to do so, delete this
    exception statement from your version.

Notes:

--->
<cfparam name="rc.shippingMethod" type="any" />

<cfoutput>
	<cf_HibachiListingDisplay smartList="#rc.shippingMethod.getShippingMethodRatesSmartList()#"
							   recordEditAction="admin:entity.editshippingmethodrate"
							   recordDeleteAction="admin:entity.deleteshippingmethodrate"
							   recordDetailAction="admin:entity.detailshippingmethodrate"
							   recorddeletequerystring="redirectAction=admin:entity.detailshippingmethod&shippingMethodID=#rc.shippingMethod.getShippingMethodID()#"
							   sortProperty="sortOrder"
							   sortContextIDColumn="shippingMethodID"
							   sortContextIDValue="#rc.shippingMethod.getShippingMethodID()#">
		<cf_HibachiListingColumn tdclass="primary" propertyidentifier="shippingMethodRateName" />
		<cf_HibachiListingColumn propertyidentifier="addressZone.addressZoneName" />
		<cf_HibachiListingColumn propertyidentifier="shipmentWeightRange" />
		<cf_HibachiListingColumn propertyidentifier="shipmentItemPriceRange" />
		<cf_HibachiListingColumn propertyidentifier="defaultAmount" />
	</cf_HibachiListingDisplay>
	
	<cf_HibachiActionCallerDropdown title="#request.slatwallScope.rbKey('define.add')# #request.slatwallScope.rbKey('entity.shippingmethodrate')#" icon="plus" buttonClass="btn-inverse">
		<cfset local.integrationOptions = rc.shippingMethod.getShippingMethodRateIntegrationOptions()>
		<cfloop array="#local.integrationOptions#" index="local.integration">
			<cf_HibachiActionCaller text="#local.integration['name']# #request.slatwallScope.rbKey('define.rate')#" action="admin:entity.createshippingmethodrate" type="list" queryString="shippingMethodID=#rc.shippingMethod.getShippingMethodID()#&integrationID=#local.integration['value']#" modal="true" />
		</cfloop>
		<cf_HibachiActionCaller action="admin:entity.createshippingmethodrate" type="list" queryString="shippingMethodID=#rc.shippingMethod.getShippingMethodID()#" modal="true" />
	</cf_HibachiActionCallerDropdown>
</cfoutput>