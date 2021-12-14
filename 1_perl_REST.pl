#C:\_RZ\Strawberry\perl\bin\perl.exe

use warnings;
use strict;
use REST::Client;
use HTTP::Cookies;
use LWP::UserAgent;

	my $cookies = HTTP::Cookies->new();
	my $ua = LWP::UserAgent->new( cookie_jar => $cookies );
	my $client = REST::Client->new( { useragent => $ua });

# don't verify SSL certs
$client->getUseragent()->ssl_opts(verify_hostname => 0);
$client->getUseragent()->ssl_opts(SSL_verify_mode => 'SSL_VERIFY_NONE');

#Login
$client->POST('https://chaos:9443/rm/j_security_check?j_username=postman&j_password=postman&rememberUserId=no');
print $client->responseContent();

#Get module
$client->GET('https://chaos:9443/rm/publish/views?moduleURI=_t6LS4VwWEeyHXqtUdsbtnQ&viewURI=_111P8VwYEeyHXqtUdsbtnQ&projectURI=_IAn0IFwTEeyHXqtUdsbtnQ');
print $client->responseContent();
