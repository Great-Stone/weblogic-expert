admin_server_url='t3://' + admin_server_listen_address + ':' + admin_server_listen_port;

print 'CONNECT TO ADMIN SERVER';
connect(admin_username, admin_password, admin_server_url);

print 'CONNECT TO NODE MANAGER';
nmConnect(node_manager_username, node_manager_password, node_manager_listen_address, node_manager_listen_port, domain_name, domain_home, node_manager_type);

print 'START MANAGED SERVER';
nmStart(managed_server_name1);

print 'DISCONNECT FROM NODE MANAGER ON ' + node_manager_listen_address + ':' + repr(node_manager_listen_port);
nmDisconnect();

print 'DISCONNECT FROM THE ADMIN SERVER';
disconnect();