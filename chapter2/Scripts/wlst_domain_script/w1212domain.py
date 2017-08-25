# Create WLS 12.1.2 Domain

# Read Template
print('Read Template')
readTemplate('/app/wls/wls1212/wlserver/common/templates/wls/wls.jar');

# Configure Administrative Username and Password
print('Configure Administrative Username and Password');
cd('Security/base_domain/User/weblogic');
set('Name','weblogic');
cmo.setPassword('welcome1');
# Domain Mode Configuration
print('Domain Mode Configuration');
cd('/');
set('ProductionModeEnabled','true');
# Set JDK
print('Set JDK');
setOption('JavaHome','/usr/jdk1.7.0_51');
# Configure the Administration Server
print('Configure the Administration Server');
cd('Servers/AdminServer');
set('Name','1212Admin');
set('ListenAddress','All Local Addresses');
set('ListenPort',7001);
# Create Domain
print('Create Domain');
cd('/');
writeDomain('/app/wls/wls1212/domains/v1212domain');
closeTemplate();
exit();