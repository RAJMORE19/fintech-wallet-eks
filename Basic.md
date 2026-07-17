**Route 53** = AWS DNS Service : It converts a domain name into an IP address so users can reach your application.++
**User types**: www.myapp.com => Amazon Route 53 =>  Finds IP Address => 54.12.34.56 (EC2/Load Balancer) => EKS / EC2 / ECS => Your Website Opens
**Common DNS Records**
**Record**	     **Purpose**
A	               Domain→ IPv4 address
AAAA	           Domain → IPv6 address
CNAME	           Domain → Another domain
MX	             →Mail server
TXT	             →SPF, DKIM, Domain verification
NS	             →Name servers for the domain
