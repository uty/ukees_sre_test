# Scan Hosts Script

This bash script performs a network health check by pinging a list of hosts and logging the results to a file. 

## Usage

```bash
./scan_hosts.sh -f hosts_file -f FILE -o OUTPUT [-c COUNT] [-i INTERVAL]
```

## Options

- -f FILE      Name of the file containing the list of hosts"
- -o OUTPUT    Name of the output file"
- -c COUNT     Number of ping packets to send (default: 3)"
- -i INTERVAL  Time interval between ping packets in seconds (default: 1)"
- --help       Show this help message and exit"

## Example
Example host list
```bash
❯ cat test_host_list
8.8.8.8
youtube.com
456456456456456879789123.com
1.2.5.4  
```

Run result
```bash
❯ ./scan_hosts.sh -f test_host_list -o test_out
Pinging host: 8.8.8.8... OK
Pinging host: youtube.com... OK
Pinging host: 456456456456456879789123.com... Error
456456456456456879789123.com cannot be resolved
Pinging host: 1.2.5.4... DOWN

❯ cat test_out
2023-04-12 23:10:37 | 8.8.8.8 | OK | Sent: 3 | Received: 3 | Lost: 0.0%
2023-04-12 23:10:39 | youtube.com | OK | Sent: 3 | Received: 3 | Lost: 0.0%
2023-04-12 23:10:39 | 456456456456456879789123.com | UNRESOLVABLE | Sent: 0 | Received: 0 | Lost: n/a
2023-04-12 23:10:52 | 1.2.5.4 | DOWN | Sent: 3 | Received: 0 | Lost: 100.0%
```
