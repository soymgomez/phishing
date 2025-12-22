<img src="https://github.com/Phishing-Database/assets/raw/master/phishing-logo.jpg" alt="Phishing Domain Status Testing Repo"/>

# Phishing.Database: Phishing <!-- omit in toc -->

This repository is the community contribution hub for the [Phishing.Database](https://github.com/Phishing-Database) project.
This is the central area for anyone to submit additions, report false positives, or suggest bypasses.

To maintain the integrity of our global feeds, direct pushes to the main database are prohibited. All community contributions are staged here, reviewed by our [Community Safekeepers](#community-safekeepers), and then automatically integrated into the project.

---

# Table of Contents <!-- omit in toc -->

- [Additions, False Positives and Bypasses](#additions-false-positives-and-bypasses)
- [File Guide](#file-guide)
  - [Additions](#additions)
  - [False Positives](#false-positives)
  - [Bypasses](#bypasses)
- [Additional External Resources](#additional-external-resources)
- [Repository Operations](#repository-operations)
  - [Synchronization](#synchronization)
  - [Bypass Handling](#bypass-handling)
- [Authors](#authors)
- [Community Safekeepers](#community-safekeepers)

---

# Additions, False Positives and Bypasses

Contributions are categorized by **Intent** (Directory) and **Timeframe** (Sub-directory).

**1. Intent**

| Directory         | Purpose                                                                                                                                       |
| ----------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `additions/`      | New phishing domains, links, and IPs.                                                                                                         |
| `falsepositives/` | Items to be whitelisted.                                                                                                                      |
| `bypasses/`       | Rules to override whitelisting (re-enabling items incorrectly ignored by the engine or [external resources](#additional-external-resources)). |

**2. Timeframe**

| Sub-directory | Purpose                                                                               |
| ------------- | ------------------------------------------------------------------------------------- |
| `permanent/`  | Contributions expected to remain valid indefinitely.                                  |
| `temporary/`  | Short-term entries. **Note:** These files are cleared at the beginning of each month. |

---

# File Guide

## Additions

We use these files to submit new malicious subjects.

| Data Type  | Filename                             | Description                                           |
| ---------- | ------------------------------------ | ----------------------------------------------------- |
| **Domain** | `additions/**/domains.list`          | Standard list of domains to be added.                 |
| **Domain** | `additions/**/domains.wildcard.list` | Domains to be treated as wildcards.                   |
| **Link**   | `additions/**/links.list`            | Specific phishing URLs / links.                       |
| **IP**     | `additions/**/ips.list`              | Malicious IP addresses.                               |
| **IP**     | `additions/**/ips.cidr.list`         | IPs in CIDR notation _(cf: RFC-5737)_.                |
| **IP**     | `additions/**/ips.arpa.list`         | IPs in ARPA/PTR format _(cf: RFC-5737)_.              |
| **IP**     | `additions/**/ips.cidr.arpa.list`    | IPs in CIDR notation in ARPA format _(cf: RFC-5737)_. |

---

## False Positives

We use these files to whitelist incorrectly flagged subjects.

> [!IMPORTANT]
> The Phishing.Database project uses the [Givilsta](https://github.com/funilrys/givilsta) project to process any files in the `falsepositives/` directory against the core data. Givilsta supports various flags for fine-tuned whitelisting that can help reduce the size of your submissions. Please keep that in mind when you are tempted to add huge lists of domains, links, or IPs.

| Data Type  | Filename                              | Description _(Givilsta Flags)_            |
| ---------- | ------------------------------------- | ----------------------------------------- |
| **Domain** | `falsepositives/**/domains.list`      | Standard 1:1 whitelist match.             |
| **Domain** | `falsepositives/**/domains.all.list`  | Prefixed with `ALL` flag.                 |
| **Domain** | `falsepositives/**/domains.reg.list`  | Prefixed with `REG` flag.                 |
| **Domain** | `falsepositives/**/domains.rzdb.list` | Prefixed with `RZDB` flag.                |
| **Link**   | `falsepositives/**/links.list`        | 1:1 link/URL whitelist match.             |
| **IP**     | `falsepositives/**/ips.list`          | 1:1 IP whitelist match.                   |
| **IP**     | `falsepositives/**/ips.cidr.list`     | CIDR notation whitelist _(cf: RFC-5737)_. |

---

## Bypasses

We use these rules to override a whitelist. This is necessary when our engine or a [external resource](#additional-external-resources) whitelists a service that is abused to host phishing.

> [!IMPORTANT]
> The Phishing.Database project uses the [Givilsta](https://github.com/funilrys/givilsta) project to process any files in the `bypasses/` directory against the core data. Givilsta supports various flags for fine-tuned whitelisting that can help reduce the size of your submissions. Please keep that in mind when you are tempted to add huge lists of domains, links, or IPs.

| Data Type  | Filename                        | Description _(Givilsta Flags)_            |
| ---------- | ------------------------------- | ----------------------------------------- |
| **Domain** | `bypasses/**/domains.list`      | Force-include a whitelisted domain (1:1). |
| **Domain** | `bypasses/**/domains.all.list`  | Force-include using `ALL` flag.           |
| **Domain** | `bypasses/**/domains.reg.list`  | Force-include using `REG` flag.           |
| **Domain** | `bypasses/**/domains.rzdb.list` | Force-include using `RZDB` flag.          |
| **Link**   | `bypasses/**/links.list`        | Force-include a whitelisted link (1:1).   |
| **IP**     | `bypasses/**/ips.list`          | Force-include a whitelisted IP (1:1).     |
| **IP**     | `bypasses/**/ips.cidr.list`     | Force-include CIDR range.                 |

---

# Additional External Resources

In addition to the false-positive files listed above, we also integrate external resources that are used for false positives. These resources are not directly part of the Phishing.Database project but are used to enhance the accuracy of our false-positive detection.

| Project                                                                            | Used Resource                                                                                 | Integration         |
| ---------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ------------------- |
| [PeterDaveHello/url-shorteners](https://github.com/PeterDaveHello/url-shorteners/) | [url-shorteners](https://raw.githubusercontent.com/PeterDaveHello/url-shorteners/master/list) | false positive list |

---

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

---

# Authors

- **Mitchell Krog** ([@mitchellkrogza](https://github.com/mitchellkrogza))
- **Nissar Chababy** ([@funilrys](https://github.com/funilrys))
- **Phishing.Database Contributors**

---

# Community Safekeepers

The **Safekeepers** team is entrusted with the day-to-day operation and maintenance of this repository. They are the primary reviewers of all community-driven changes, ensuring that every submission meets the project's core safety, accuracy and integrity.

These members have demonstrated exceptional trust through their direct contributions and ongoing support. We are honored to have them managing the heart of our data:

- **Jason Go** ([@jasongodev](https://github.com/jasongodev))
- **Martín Gómez** ([@soymgomez](https://github.com/soymgomez))
- **Samantha Fry** ([@benolot](https://github.com/benolot))
- **Scott Petty** ([@g0d33p3rsec](https://github.com/g0d33p3rsec))
- **[@flexmak](https://github.com/flexmak)**
- **[@ninjacatcher](https://github.com/ninjacatcher)**
- **[@spirillen](https://github.com/spirillen)**
- **[@Tomvivi](https://github.com/Tomvivi)**

> [!IMPORTANT]
> Their vigilance ensures that every community contribution is validated, keeping our threat intelligence accurate and reliable for everyone.
