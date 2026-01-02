using { satish.db.master,satish.db.transaction } from '../db/data-modal';

service CatalogService @(path: 'CatalogService') {

    entity BusinessPartner as projection on master.businesspartner;
    entity AddressSet as projection on master.address;
    entity Employeeset as projection on master.employees;
    entity ProductSet as projection on master.product;
    entity POs as projection on transaction.purchaseorder;
    entity POItems as projection on transaction.poitems;

}
