using { satish.cds } from '../db/CDSViews';

using { satish.db.master } from '../db/data-modal';

service MyService @(path :'MyService') {

    function pokymon(name: String(20)) returns String;

    entity ProductOrdersSet as projection on cds.CDSViews.ProductOrders;

    
    entity ReadEmployeeSrv  as projection on master.employees;
    

}