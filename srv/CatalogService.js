module.exports = cds.service.impl(async function ()  
  {
    const {POs} = this.entities;

    this.on('boost', async(req) => {
        console.log('action is executed');
    try {
        const ID = req.params[0];
        const tx = cds.tx(req);
        //CDS Query Language - 
        await tx.update(POs).with({
            GROSS_AMOUNT: { '+=' : 10}
        }).where(ID);

    } catch (error) {
        return "Error" + error.toStrign();
    }     
    });

    
    this.on('largestOrder', async(req) => {
        console.log('function  is executed');
    try {
        
        const tx = cds.tx(req);
        //Read the PO with highest gross amount 
        //Read orders desc by gross  + Get the first record 

        const recordData = tx.read(POs).orderBy({
          GROSS_AMOUNT: 'desc'
        }).limit(1);

         return recordData

    } catch (error) {
       return "Error" + error.toStrign();
    }     
    });


});