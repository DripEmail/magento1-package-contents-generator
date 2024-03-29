# Magento 1 Package.xml Contents Generator

This is a fairly specific tool to regenerate the package.xml contents without going through the Magento 1 web UI.

This assumes that you send a file/dir listing into it via stdin:

```
app/
app/code/
app/code/community/
app/code/community/Drip/
app/code/community/Drip/Connect/
app/code/community/Drip/Connect/Block/
app/code/community/Drip/Connect/Block/Adminhtml/
app/code/community/Drip/Connect/Block/Adminhtml/System/
app/code/community/Drip/Connect/Block/Adminhtml/System/Config/
app/code/community/Drip/Connect/Block/Adminhtml/System/Config/Sync/
app/code/community/Drip/Connect/Block/Adminhtml/System/Config/Sync/Customers.php
app/code/community/Drip/Connect/Block/Adminhtml/System/Config/Sync/Customers/
app/code/community/Drip/Connect/Block/Adminhtml/System/Config/Sync/Customers/Reset.php
app/code/community/Drip/Connect/Block/Adminhtml/System/Config/Sync/Orders.php
app/code/community/Drip/Connect/Block/Adminhtml/System/Config/Sync/Orders/
app/code/community/Drip/Connect/Block/Adminhtml/System/Config/Sync/Orders/Reset.php
app/code/community/Drip/Connect/Block/Adminhtml/System/Config/Version.php
app/code/community/Drip/Connect/Helper/
app/code/community/Drip/Connect/Helper/Data.php
app/code/community/Drip/Connect/Helper/Order.php
app/code/community/Drip/Connect/Helper/Product.php
app/code/community/Drip/Connect/Helper/Quote.php
app/code/community/Drip/Connect/Model/
app/code/community/Drip/Connect/Model/ApiCalls/
app/code/community/Drip/Connect/Model/ApiCalls/Base.php
app/code/community/Drip/Connect/Model/ApiCalls/Helper.php
app/code/community/Drip/Connect/Model/ApiCalls/Helper/
app/code/community/Drip/Connect/Model/ApiCalls/Helper/Batches/
app/code/community/Drip/Connect/Model/ApiCalls/Helper/Batches/Events.php
app/code/community/Drip/Connect/Model/ApiCalls/Helper/Batches/Orders.php
app/code/community/Drip/Connect/Model/ApiCalls/Helper/Batches/Subscribers.php
app/code/community/Drip/Connect/Model/ApiCalls/Helper/CreateUpdateOrder.php
app/code/community/Drip/Connect/Model/ApiCalls/Helper/CreateUpdateProduct.php
app/code/community/Drip/Connect/Model/ApiCalls/Helper/CreateUpdateQuote.php
app/code/community/Drip/Connect/Model/ApiCalls/Helper/CreateUpdateRefund.php
app/code/community/Drip/Connect/Model/ApiCalls/Helper/CreateUpdateSubscriber.php
app/code/community/Drip/Connect/Model/ApiCalls/Helper/GetProjectList.php
app/code/community/Drip/Connect/Model/ApiCalls/Helper/GetSubscriberList.php
app/code/community/Drip/Connect/Model/ApiCalls/Helper/RecordAnEvent.php
app/code/community/Drip/Connect/Model/ApiCalls/Helper/UnsubscribeSubscriber.php
app/code/community/Drip/Connect/Model/ApiCalls/Request/
app/code/community/Drip/Connect/Model/ApiCalls/Request/Base.php
app/code/community/Drip/Connect/Model/ApiCalls/Response/
app/code/community/Drip/Connect/Model/ApiCalls/Response/Base.php
app/code/community/Drip/Connect/Model/Cron/
app/code/community/Drip/Connect/Model/Cron/Customers.php
app/code/community/Drip/Connect/Model/Cron/Orders.php
app/code/community/Drip/Connect/Model/Http/
app/code/community/Drip/Connect/Model/Http/Client.php
app/code/community/Drip/Connect/Model/Observer/
app/code/community/Drip/Connect/Model/Observer/Account.php
app/code/community/Drip/Connect/Model/Observer/Customer.php
app/code/community/Drip/Connect/Model/Observer/Order.php
app/code/community/Drip/Connect/Model/Observer/Product.php
app/code/community/Drip/Connect/Model/Observer/Quote.php
app/code/community/Drip/Connect/Model/Observer/Wishlist.php
app/code/community/Drip/Connect/Model/Restapi/
app/code/community/Drip/Connect/Model/Restapi/Abstract.php
app/code/community/Drip/Connect/Model/Restapi/Request/
app/code/community/Drip/Connect/Model/Restapi/Request/Interface.php
app/code/community/Drip/Connect/Model/Restapi/Response/
app/code/community/Drip/Connect/Model/Restapi/Response/Abstract.php
app/code/community/Drip/Connect/Model/Restapi/Response/Interface.php
app/code/community/Drip/Connect/Model/Source/
app/code/community/Drip/Connect/Model/Source/Behavior.php
app/code/community/Drip/Connect/Model/Source/SyncState.php
app/code/community/Drip/Connect/controllers/
app/code/community/Drip/Connect/controllers/Adminhtml/
app/code/community/Drip/Connect/controllers/Adminhtml/Config/
app/code/community/Drip/Connect/controllers/Adminhtml/Config/Sync/
app/code/community/Drip/Connect/controllers/Adminhtml/Config/Sync/CustomersController.php
app/code/community/Drip/Connect/controllers/Adminhtml/Config/Sync/OrdersController.php
app/code/community/Drip/Connect/controllers/CartController.php
app/code/community/Drip/Connect/data/
app/code/community/Drip/Connect/data/drip_connect_setup/
app/code/community/Drip/Connect/data/drip_connect_setup/data-upgrade-0.1.0-0.2.0.php
app/code/community/Drip/Connect/data/drip_connect_setup/data-upgrade-0.2.0-0.3.0.php
app/code/community/Drip/Connect/data/drip_connect_setup/data-upgrade-1.5.0-1.5.2.php
app/code/community/Drip/Connect/etc/
app/code/community/Drip/Connect/etc/adminhtml.xml
app/code/community/Drip/Connect/etc/config.xml
app/code/community/Drip/Connect/etc/system.xml
app/code/community/Drip/Connect/sql/
app/code/community/Drip/Connect/sql/drip_connect_setup/
app/code/community/Drip/Connect/sql/drip_connect_setup/upgrade-1.2.7-1.3.0.php
app/design/
app/design/adminhtml/
app/design/adminhtml/default/
app/design/adminhtml/default/default/
app/design/adminhtml/default/default/template/
app/design/adminhtml/default/default/template/drip/
app/design/adminhtml/default/default/template/drip/connect/
app/design/adminhtml/default/default/template/drip/connect/config/
app/design/adminhtml/default/default/template/drip/connect/config/sync/
app/design/adminhtml/default/default/template/drip/connect/config/sync/customers.phtml
app/design/adminhtml/default/default/template/drip/connect/config/sync/customers/
app/design/adminhtml/default/default/template/drip/connect/config/sync/customers/reset.phtml
app/design/adminhtml/default/default/template/drip/connect/config/sync/orders.phtml
app/design/adminhtml/default/default/template/drip/connect/config/sync/orders/
app/design/adminhtml/default/default/template/drip/connect/config/sync/orders/reset.phtml
app/design/frontend/
app/design/frontend/base/
app/design/frontend/base/default/
app/design/frontend/base/default/layout/
app/design/frontend/base/default/layout/drip/
app/design/frontend/base/default/layout/drip/connect.xml
app/design/frontend/base/default/template/
app/design/frontend/base/default/template/drip/
app/design/frontend/base/default/template/drip/footer_js.phtml
app/design/frontend/base/default/template/drip/pdp_tracking.phtml
app/etc/
app/etc/modules/
app/etc/modules/Drip_Connect.xml
modman
package.xml
```

We obtain this by running:

```bash
git archive --format=tar HEAD | tar -t | ruby package_generator.rb
```

I dump this into a text editor, reformat it, and then insert it into `package.xml` by hand.
