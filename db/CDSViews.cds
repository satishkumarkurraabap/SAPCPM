namespace satish.cds;
using { satish.db.master,satish.db.transaction } from './data-modal';

context CDSViews {

    define view![POWorklist] as 
           select from transaction.purchaseorder{
            key PO_ID as![PurchaseOrderNo],
            key Items.PO_ITEM_POS as![Position],
            PARTNER_GUID.BP_ID as ![VendorId],
            PARTNER_GUID.COMPANY_NAME as ![CompanyName],
            Items.GROSS_AMOUNT as ![GrossAmount],
            Items.NET_AMOUNT as ![NetAmount],
            Items.TAX_AMOUNT as ![TaxAmount],
            case OVERALL_STATUS
                 when 'N' then 'New'
                 When 'D' then 'Delivered'
                 when 'P' then 'Pending'
                 when 'A' then 'Approved'
                 when 'X' then 'Rejected'
                 end as ![Status],
            Items.PRODUCT_GUID.DESCRIPTION as ![Product],
            PARTNER_GUID.ADDRESS_GUID.COUNTRY as ![Country]
           };

     define view![ProductVH] as 
          select from master.product{
               @EndUserText.label:[
                    {
                          language: 'EN',
                         text: 'Product Id'
                    },
                    {
                          language: 'DE',
                         text: 'Prodekt Id'
                    },
                   
               ]
               PRODUCT_ID as![ProductId],
               @EndUserText.label:[
                    {
                          language: 'EN',
                         text: 'Product Name'
                    },
                           {
                          language: 'DE',
                         text: 'Prodekt Name'
                    },
                   
               ]
               DESCRIPTION as![ProductName]
          }

     define view![ItemView] as  
          select from transaction.poitems{
               PARENT_KEY.PARTNER_GUID.NODE_KEY as![VendorId],
               PRODUCT_GUID.NODE_KEY as![ProductId],
               CURRENCY as![Currency],
               GROSS_AMOUNT as![GrossAmount],
               NET_AMOUNT as![NetAmount],
               TAX_AMOUNT as![TaxAmount],
               PARENT_KEY.OVERALL_STATUS as![Status]
          }
     define view ProductOrders as select from master.product
     //Mixin key word provided  by CAPM to perform lazy loding 
     // It same like association concept in ABAP CDS view - lazy of loading of dependent data
     mixin{
          PO_ORDERS:Association[*] to ItemView on PO_ORDERS.ProductId = $projection.ProductKey
     } into {
          NODE_KEY as![ProductKey],
          DESCRIPTION as![ProductName],
          PRICE as![Price],
          SUPPLIER_GUID.BP_ID as![SupplierId],
          SUPPLIER_GUID.COMPANY_NAME as![SupplierName],
          //Exposed association like ABAP which will lazy load orders of given product 
          //at run time  on demand
          PO_ORDERS 
     }

     }



