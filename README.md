<img src="https://github.com/Phishing-Database/assets/raw/master/phishing-logo.jpg" alt="Phishing Domain Status Testing Repo"/>

# Phishing.Database: Phishing <!-- omit in toc -->

This is the central repository for adding or removing domains, links, and IPs from the [Phishing.Database](https://github.com/Phishing-Database) project.

Since pushing to the main repository is prohibited, this repository serves as an
area for anyone to submit changes to the Phishing Database.

> [!CAUTION]
> The files in the top-level directories have been migrated to the new structure and are now deleted. For all future contributions and downloads, please use the new directory structure.

# Table of Contents <!-- omit in toc -->

- [Additions, False Positives and Bypasses](#additions-false-positives-and-bypasses)
  - [Additions](#additions)
    - [Domains](#domains)
    - [Links](#links)
    - [IPs](#ips)
  - [False Positives](#false-positives)
    - [Domains](#domains-1)
    - [Links](#links-1)
    - [IPs](#ips-1)
  - [Bypasses](#bypasses)
    - [Domains](#domains-2)
    - [Links](#links-2)
    - [IPs](#ips-2)
- [Additional External Resources](#additional-external-resources)
- [Repository Operations](#repository-operations)
  - [Synchronization](#synchronization)
  - [Bypass Handling](#bypass-handling)

# Additions, False Positives and Bypasses

We now categorize contributions into three main directories:

- `additions/`: Contains files for adding phishing domains, links, and IPs.
- `falsepositives/`: Contains files for whitelisting false positives.
- `bypasses/`: Contains files for bypassing any whitelisting rules from the project's very own engine or any [external resources](#additional-external-resources) of false positive.

Within these directories, we categorize contributions further into 2 timeframes:

- `permanent/`: For contributions that are expected to remain valid indefinitely.
- `temporary/`: For contributions that are expected to be valid for a short period of time. Please be aware that the content of the files in this directory will be removed at the beginning of each month.

Within the above directories, you can find the files listed bellow.

## Additions

### Domains

| Filename                             | Description                                                                                    |
| ------------------------------------ | ---------------------------------------------------------------------------------------------- |
| `additions/**/domains.list`          | Container a list of domains to be added to the Phishing.Database.                              |
| `additions/**/domains.wildcard.list` | Contains a list of domains to be added and considered as wildcards - as we meet them overtime. |

### Links

| Filename                  | Description                                                           |
| ------------------------- | --------------------------------------------------------------------- |
| `additions/**/links.list` | Contains a list of links / URLs to be added to the Phishing.Database. |

### IPs

| Filename                          | Description                                                                                                   |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `additions/**/ips.list`           | Contains a list of IPs to be added to the Phishing.Database.                                                  |
| `additions/**/ips.cidr.list`      | Contains a list of IPs to be added to the Phishing.Database in CIDR notation. _(cf: RFC-5737)_                |
| `additions/**/ips.arpa.list`      | Contains a list of IPs to be added to the Phishing.Database in ARPA/PTR format. _(cf: RFC-5737)_              |
| `additions/**/ips.cidr.arpa.list` | Contains a list of IPs to be added to the Phishing.Database in CIDR notation in ARPA format. _(cf: RFC-5737)_ |

## False Positives

> [!NOTE]
> The Phishing.Database project uses the [Givilsta](https://github.com/funilrys/givilsta) project to process any files in the `falsepositives/` directory against the main repository. Please keep that in mind when you are tented to add huge lists of domains, links, or IPs.

### Domains

| Filename                              | Description                                                                                                                                                         |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `falsepositives/**/domains.list`      | Contains a list of domains to be whitelisted as false positives. This is a 1:1 match.                                                                               |
| `falsepositives/**/domains.all.list`  | Contains a list of domains to be whitelisted as false positives. Any entry in this file will be prefixed with Givilsta's `ALL` flag _(cf: see Givilsta's readme)_.  |
| `falsepositives/**/domains.reg.list`  | Contains a list of domains to be whitelisted as false positives. Any entry in this file will be prefixed with Givilsta's `REG` flag _(cf: see Givilsta's readme)_.  |
| `falsepositives/**/domains.rzdb.list` | Contains a list of domains to be whitelisted as false positives. Any entry in this file will be prefixed with Givilsta's `RZDB` flag _(cf: see Givilsta's readme)_. |

### Links

| Filename                       | Description                                                                         |
| ------------------------------ | ----------------------------------------------------------------------------------- |
| `falsepositives/**/links.list` | Contains a list of links to be whitelisted as false positives. This is a 1:1 match. |

### IPs

| Filename                               | Description                                                                                                   |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `falsepositives/**/ips.list`           | Contains a list of IPs to be whitelisted as false positives. This is a 1:1 match.                             |
| `falsepositives/**/ips.cidr.list`      | Contains a list of IPs to be whitelisted as false positives in CIDR notation. _(cf: RFC-5737)_                |
| `falsepositives/**/ips.arpa.list`      | Contains a list of IPs to be whitelisted as false positives in ARPA/PTR format. _(cf: RFC-5737)_              |
| `falsepositives/**/ips.cidr.arpa.list` | Contains a list of IPs to be whitelisted as false positives in CIDR notation in ARPA format. _(cf: RFC-5737)_ |

## Bypasses

In addition to the false positives, a set of bypass rules are available to allow discussions and bypasses of any false positive that may come from the project's very own engine or any [external resources](#additional-external-resources) of false positive.

> [!NOTE]
> The Phishing.Database project uses the [Givilsta](https://github.com/funilrys/givilsta) project to process any files in the `bypass/` directory against the main repository. Please keep that in mind when you are tented to add huge lists of domains, links, or IPs.

### Domains

| Filename                        | Description                                                                                                                                                                   |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `bypasses/**/domains.list`      | Contains a list of domains to be bypassed when processing false positives. This is a 1:1 match.                                                                               |
| `bypasses/**/domains.all.list`  | Contains a list of domains to be bypassed when processing false positives. Any entry in this file will be prefixed with Givilsta's `ALL` flag _(cf: see Givilsta's readme)_.  |
| `bypasses/**/domains.reg.list`  | Contains a list of domains to be bypassed when processing false positives. Any entry in this file will be prefixed with Givilsta's `REG` flag _(cf: see Givilsta's readme)_.  |
| `bypasses/**/domains.rzdb.list` | Contains a list of domains to be bypassed when processing false positives. Any entry in this file will be prefixed with Givilsta's `RZDB` flag _(cf: see Givilsta's readme)_. |

### Links

| Filename                 | Description                                                                                   |
| ------------------------ | --------------------------------------------------------------------------------------------- |
| `bypasses/**/links.list` | Contains a list of links to be bypassed when processing false positives. This is a 1:1 match. |

### IPs

| Filename                         | Description                                                                                                             |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `bypasses/**/ips.list`           | Contains a list of IPs to be bypassed when processing false positives. This is a 1:1 match.                             |
| `bypasses/**/ips.cidr.list`      | Contains a list of IPs to be bypassed when processing false positives in CIDR notation. _(cf: RFC-5737)_                |
| `bypasses/**/ips.arpa.list`      | Contains a list of IPs to be bypassed when processing false positives in ARPA/PTR format. _(cf: RFC-5737)_              |
| `bypasses/**/ips.cidr.arpa.list` | Contains a list of IPs to be bypassed when processing false positives in CIDR notation in ARPA format. _(cf: RFC-5737)_ |

# Additional External Resources

In addition to the false-positive files listed above, we also integrate external resources that are used for false positives. These resources are not directly part of the Phishing.Database project but are used to enhance the accuracy of our false-positive detection.

| Project                                                                            | Used Resource                                                                                 | Integration         |
| ---------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ------------------- |
| [PeterDaveHello/url-shorteners](https://github.com/PeterDaveHello/url-shorteners/) | [url-shorteners](https://raw.githubusercontent.com/PeterDaveHello/url-shorteners/master/list) | false positive list |

# Repository Operations

## Synchronization

The state of the `master` branch will be automatically fetched every few hours and integrated into
the next update of the main repository. The latest state of the fetched data will
be reflected in the [frozen-dataset](https://github.com/Phishing-Database/frozen-datasets) repository.

## Bypass Handling

_**TL;DR:** The `bypasses/` directory is used to bypass any false positive that may come from the
project's very own engine or any [external resources](#additional-external-resources) of false positive._

---

Let's assume that `example.me` is a domain that is listed in one of our [external-resources](#additional-external-resources),
which is being used as a source for false positives. Being listed there means that `example.me` will be whitelisted and no
`example.me` links will be integrated into the Phishing.Database project.

What if `example.me` is now a threat? In this case, we would want to ensure that it is not whitelisted and that any links
containing `example.me` are processed as phishing links.

That's where [bypasses](#bypasses) come in. Since we assume that the source list is a simple list of domains with
[no extra rules](https://github.com/funilrys/givilsta?tab=readme-ov-file#no-flag-the-purest-form-of-ruling), we can add
`example.me` to the `bypasses/{timeframe}/domains.list` file.

Once the change is merged and pushed, our engine will download the file and effectively disable `example.me` from being
whitelisted. This means that any time one of our sources lists a link from `example.me`, it will be kept and handled accordingly.
