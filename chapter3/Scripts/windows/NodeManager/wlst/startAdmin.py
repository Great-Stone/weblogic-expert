print 'CONNECT TO NODE MANAGER';
nmConnect(node_manager_username, node_manager_password, node_manager_listen_address, node_manager_listen_port, domain_name, domain_home, node_manager_type);

print 'START ADMIN SERVER';
nmStart(admin_server_name);

print 'DISCONNECT FROM NODE MANAGER';
nmDisconnect();