# Phishing
Central Repository for Adding or Removing Domains / Links from the [Phishing.Database][PD] project

## Toc
<!-- TOC -->
* [Phishing](#phishing)
  * [Toc](#toc)
  * [Committing Phishing records](#committing-phishing-records)
    * [Add Phishing Domains](#add-phishing-domains)
    * [Add Phishing Uri - Links](#add-phishing-uri---links)
  * [Add phishing by IP](#add-phishing-by-ip)
  * [False Positives](#false-positives)
<!-- TOC -->

## Committing Phishing records

DNS systems can operate on the domain level (everything between the protocol and the first /) while IE Squid-proxy or uBlock Origin can operate on both sides of the slashes and protocol independently.

### Add Phishing Domains

| File                                                 | Contents                                                                                                                                                                                                                                                                                                                                      |
|------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [add-domain](../master/add-domain)                   | This list are matching a records `1 to 1` or this domain only (hosts file style RFC:952 and RFC:953)                                                                                                                                                                                                                                          |
| [add-wildcard-domain](../master/add-wildcard-domain) | This domain and all it's subdomains should be added. This means if an entire domain is being used for phishing i.e. `phishing.example.com`, then add it to the domain list (add-domain). If the phishing threat resides inside a subfolder of the domain i.e. `/sub/oath/phishing-script/payload.php` then add it to the url list (add-link). |

include the fully qualified domain name (fqdn) only (no protocol like http /
https) and no path (/something)

### Add Phishing Uri - Links

To add either a domain, subdomain or a number of URI's to the project, you should be understanding a bit about how it is working.

| File                           | Contents                    |
|--------------------------------|-----------------------------|
| [add-link](../master/add-link) | this URI, and only this URI |

## Add phishing by IP

| File                                                             | Contents                                                                                    |
|------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| [IP-addr.cidr.in-addr.arpa](../master/IP-addr.cidr.in-addr.arpa) | This is a list for blocking phishing by IP address in CIDR notated in-arpa style (rfc:5737) |
| [IP-addr.cidr.list](../master/IP-addr.cidr.list)                 | This is a list for blocking phishing by IP address in CIDR notation style (rfc:5737)        |
| [IP-addr.in-addr.arpa](../master/IP-addr.in-addr.arpa)           | This is a list for blocking phishing by IP address in in-arpa style (rfc:5737)              |
| [IP-addr.list](../master/IP-addr.list)                           | This is a list for blocking phishing by IP address in (strait forward) style (rfc:5737)     |

## False Positives

To be able to keep the whitelist as precise as possible, the Phishing DB are
using 4 types of list.

| File                                                 | Contents                                                                                                                                                                                                                                                    |
|------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The [first list](../master/falsepositive.list)       | Matching `1 on 1`. This means, should we only whitelist IE. `subdomain1.example.com` but not `subdomain2.example.com`, then this is the list.                                                                                                               |
| The [second list](../master/falsepositive_all.list)  | (ALL) is [wildcard] based. This means every subdomains from `example.net` and lover level such as `subdomain1.example.net` & `subdomain2.example.net`. This list also accepts full regex. Except from ending `$` and `\\` as this is done by automatically. |
| The [third list](../master/falsepositive_regex.list) | (REGEX) You are a fan of regex ? We are too! When working with highly volatile dataset, we want to simply use a regular expression (short regex) to do the task. [REG]                                                                                      |
| The [fourth list](../master/falsepositive_rzd.list)  | (RZD) will probably never be used... Read the full doc here before attempting to making changes to it: [RZD]                                                                                                                                                |

For better understanding of these specialities, you are welcome to read the tools [Readme](https://github.com/Ultimate-Hosts-Blacklist/whitelist/tree/script#special-markers).

[PD]: https://github.com/Phishing-Database/Phishing.Database

[REG]: https://github.com/funilrys/tivilsta?tab=readme-ov-file#reg--the-regular-expression-rule

[wildcard]: https://github.com/funilrys/tivilsta?tab=readme-ov-file#all--the-ends-with-rule

[RZD]: https://github.com/funilrys/tivilsta?tab=readme-ov-file#rzd--the-broad-and-powerful-rule
