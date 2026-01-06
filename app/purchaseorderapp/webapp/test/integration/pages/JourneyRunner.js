sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/po/purchaseorderapp/test/integration/pages/POsList",
	"com/po/purchaseorderapp/test/integration/pages/POsObjectPage",
	"com/po/purchaseorderapp/test/integration/pages/POItemsObjectPage"
], function (JourneyRunner, POsList, POsObjectPage, POItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/po/purchaseorderapp') + '/test/flp.html#app-preview',
        pages: {
			onThePOsList: POsList,
			onThePOsObjectPage: POsObjectPage,
			onThePOItemsObjectPage: POItemsObjectPage
        },
        async: true
    });

    return runner;
});

