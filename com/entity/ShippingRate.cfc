/*

    Slatwall - An e-commerce plugin for Mura CMS
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

*/
component displayname="Shipping Rate" entityname="SlatwallShippingRate" table="SlatwallShippingRate" persistent=true output=false accessors=true extends="slatwall.com.entity.BaseEntity" {
	
	// Persistant Properties
	property name="shippingRateID" ormtype="string" lenth="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="minWeight" ormtype="float";
	property name="maxWeight" ormtype="float";
	property name="minPrice" ormtype="float";
	property name="maxPrice" ormtype="float";
	property name="cost" ormtype="float";
	
	// Related Object Properties
	property name="shippingMethod" cfc="ShippingMethod" fieldtype="many-to-one" fkcolumn="shippingMethodID";
	property name="addressZone" cfc="AddressZone" fieldtype="many-to-one" fkcolumn="addressZoneID";
	
	public array function getAddressZoneOptions() {
		if(!structKeyExists(vriables, "addressZoneOptions")) {
			var smartList = new Slatwall.com.utility.SmartList(entityName="SlatwallAddressZone");
			smartList.addSelect(rawProperty="addressZoneName", aliase="name");
			smartList.addSelect(rawProperty="addressZoneID", aliase="id"); 
			smartList.addOrder("addressZoneName|ASC");
			variables.addressZoneOptions = smartList.getRecords();
		}
		return variables.addressZoneOptions;
	}
}
