using { satish.db.master,satish.db.transaction } from '../db/data-modal';

service CatalogService @(path: 'CatalogService') {

    @Capabilities:{Deletable}
    entity BusinessPartner as projection on master.businesspartner;
    entity AddressSet as projection on master.address;
    @readonly
    entity Employeeset as projection on master.employees;
    entity ProductSet as projection on master.product;
    entity POs as projection on transaction.purchaseorder
    actions{
        action boost() returns POs;
        function largestOrder() returns POs;
    };
    entity POItems as projection on transaction.poitems;

}
