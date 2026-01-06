const cds = require('@sap/cds');
const { SELECT } = require('@sap/cds/lib/ql/cds-ql');

const { employees }  = cds.entities("satish.db.master");
module.exports = (srv) => {

    srv.on('pokymon', req => `Hello ${req.data.name}`);
    
    
    srv.on('READ','ReadEmployeeSrv', async(req) => {
    // Exmaple of hardcoded data
        //     return {
    //         "ID": "2222-22",
    //         "nameFirst" : "pikachu"

    //     }
   
   // Example 2 Calling DB and adding extra logic 
//    const tx = await cds.tx(req);
//     //debugger; // optional
//    var  results = await tx.run(SELECT.from(employees).limit(5));
//    for (let i = 0; i < results.length; i++) {
//     const element = results[i];
//     element.nameMiddle = 'Badhiyal'
    
//    }
//    return results;
    //Example 3 working with conditions 
    const tx = await cds.tx(req);
    var whereCondition = req.data;
    if(whereCondition.hasOwnProperty("ID")){
        return await tx.run(SELECT.from(employees).where(whereCondition));
    }else{
        return await tx.run(SELECT.from(employees).limit(2).where({
            "sex" : 'F'
        }));
    }
 

 });
    
}