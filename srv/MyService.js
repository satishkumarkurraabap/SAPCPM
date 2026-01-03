module.exports = (srv) => {

    srv.on('pokymon', req => `Hello ${req.data.name}`);
}