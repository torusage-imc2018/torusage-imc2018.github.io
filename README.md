Overview
--------

This is the landing page for the following research publication:

**Understanding Tor Usage with Privacy-Preserving Measurement**  
_Proceedings of the 18th ACM Internet Measurement Conference (IMC 2018)_  
by Akshaya Mani, T Wilson-Brown, [Rob Jansen](https://www.robgjansen.com), [Aaron Johnson](https://ohmygodel.com/), and [Micah Sherr](https://security.cs.georgetown.edu/~msherr/)  
\[[Full paper available here](paper.pdf)\]  
\[[Appendix describing privacy action bounds available here](appendix.pdf)\]  
\[[Tor Research Safety Board (TRSB) feedback available here](data/trsb-feedback.txt)\]

If you reference this paper, or use any of its results or the data provided on this page, please cite the paper. Here is a bibtex entry for latex users:

```
@inproceedings{torusage-imc2018,
author = {Akshaya Mani and T Wilson-Brown and Rob Jansen and Aaron Johnson and Micah Sherr},
title = {Understanding {Tor} Usage with Privacy-Preserving Measurement},
booktitle = {18th ACM Internet Measurement Conference (IMC)},
year = {2018},
note = {See also \url{https://torusage-imc2018.github.io}},
}
```

Project Description
-------------------

This project (a collaboration between researchers at Georgetown University, the University of New South Wales and the U.S. Naval Research Laboratory) conducts a detailed privacy-preserving measurement study of Tor, to better understand how the network is being (mis)used.

The Tor network is difficult to measure because, if not done carefully, measurements could risk the privacy (and potentially the safety) of the network's users. Recent work has proposed the use of differential privacy and secure aggregation techniques to safely measure Tor. We significantly enhance two such tools - PrivCount and Private Set-Union Cardinality (PSC)-in order to support the safe exploration of three major aspects of Tor usage: how many users connect to Tor and from where do they connect, with which destinations do users most frequently communicate, and how many onion services exist and how are they used.

Code
----

We significantly extended Tor and the PrivCount and PSC measurement tools to conduct our measurements. Our code has been merged to the respective open source repositories is available as follows:

  * Tor: [https://github.com/privcount/tor](https://github.com/privcount/tor)
  * PrivCount: [https://github.com/privcount/privcount](https://github.com/privcount/privcount)
  * PSC: [https://github.com/AkshayaMani/PSC](https://github.com/AkshayaMani/PSC)

Data
----

In addition to the auxiliary material linked above (the [Appendix](https://www.robgjansen.com/publications/torusage-imc2018-appendix.pdf) and [TRSB feedback](data/trsb-feedback.txt)), we also make the following raw PrivCount measurement results available:

## Exit Measurements

These results were measured from relays in a position to observe Tor's egress traffic. The mean combined exit weight of the measurement relays (taken over the consensuses that were active during the measurement) are specified under each measurement. Researchers who want to reproduce the paper's findings (i.e., the extrapolation to the entire Tor network) must divide all values by the combined mean exit weight.

### Exit Stream Measurements

_Combined Mean Exit Weight_ - 0.015

Our PrivCount stream measurements were conducted between 2018-01-04 and 2018-01-05. We measured the number of streams of various types observed from our relays over a 24 hour period. We focused on initial streams that provide hostnames and target destination ports, traditionally associated with web content (i.e., port 80 or 443). The rationale behind this is explained clearly in Section 4.2 of our paper.

The results with 95% confidence interval are as follows:

| Measurement Description | Results file |
|-------------|--------------|
| Exit stream measurement | [exit-stream-2018-01-04.csv](data/exit-stream-2018-01-04.csv) |

Figure 1 in the paper plots the raw values shown in the csv.

### Exit Domain Measurements

We now provide the results from our measurements of the number of domains observed in initial streams that also provide a hostname and a web port. To ease presentation, we refer to them as _primary domains_ or simply _domains_.

#### Alexa Rank Measurement

_Combined Mean Exit Weight_ - 0.022

The Alexa rank measurement was conducted between 2018-01-31 and 2018-02-01. We use the [Alexa top 1 million sites list](https://www.alexa.com/topsites) to help us understand which sites are visited by Tor users. We sorted the sites by rank and split them into six sets of increasing size: set i = 0 contains the first 101 sites and set i > 0 contains the first 10<sup>i +1</sup> sites excluding those in set i − 1. We used a separate set for torproject.org since early measurements revealed a significant number of accesses to that domain.

The results with 95% confidence interval are as follows:

| Measurement Description | Results file |
|-------------|--------------|
| Alexa top 1M sites | [exit-domain-alexa1M.txt](data/exit-domain-alexa1M.txt) |
| Alexa rank measurement | [exit-domain-alexarank-2018-01-31.csv](data/exit-domain-alexarank-2018-01-31.csv) |

To reproduce the percentages shown in Figure 2(top) in the paper, divide the value in each bin in the csv file in the table above by the total number of initial streams we measured during the same period. (No full network extrapolation is required since we are computing percentages.)

The total number of streams during the Alexa rank measurement was `2215609`. Then. for example, the percentage for the `(0,10]` bin is:
  * `185978 / 2215609 * 100 = 8.393990095 ~= 8.4`

#### Alexa Sibling Measurement

_Combined Mean Exit Weight_ - 0.021

The Alexa siblings measurement was conducted between 2018-02-01 and 2018-02-02. In the Alexa siblings measurement, we created a set for each of the top 10 sites in the [Alexa top 1 million sites list](https://www.alexa.com/topsites). For each such site we stripped the top level domain to produce a site basename (e.g., google), and then added all entries from the top 1 million sites list that contained the basename into the corresponding set. We also used distinct sets for duckduckgo (rank 342, the default search engine in Tor Browser) and torproject (rank 10,244, developer of Tor Browser).

The results with 95% confidence interval are as follows:

| Measurement Description | Results file |
|-------------|--------------|
| Alexa siblings list | [domain-siblings-all.txt](data/exit-domain-alexa-siblings/domain-siblings-all.txt) |
| Alexa siblings measurement | [exit-domain-alexasiblings-2018-02-01.csv](data/exit-domain-alexasiblings-2018-02-01.csv) |

To reproduce the percentages shown in Figure 2(bottom) in the paper, divide the value in each bin in the csv file in the table above by the total number of initial streams we measured during the same period. (No full network extrapolation is required since we are computing percentages.)

The total number of streams during the Alexa sibling measurement was `2207358`. Then. for example, the percentage for the `google(1)` bin is:
  * `51897 / 2207358 * 100 = 2.351091214 ~= 2.4`

#### Top-Level Domain Measurements

We measured the frequency with which all top-level domain (TLD) names that are contained in more than 104 entries in the [Alexa top 1 million sites list](https://www.alexa.com/topsites) also appeared in the observed primary domains. The measured TLDs include three main TLDs (.com, .org, and .net) as well as 11 country-specific TLDs.

##### TLDs of Alexa domains

_Combined Mean Exit Weight_ - 0.023

We measure the TLDs of only those primary domains that appear in the [Alexa top 1 million sites list](https://www.alexa.com/topsites) using wildcards between 2018-01-30 and 2018-01-31. We measured torproject.org using a separate counter.

The results with 95% confidence interval are as follows:

| Measurement Description | Results file |
|-------------|--------------|
| Alexa TLDs list | [domain-alexa-tlds-all.tar.xz](data/exit-domain-alexa-tlds/domain-alexa-tlds-all.tar.xz) |
| Alexa TLDs measurement | [exit-domain-alexadomainTLDs-2018-01-30.csv](data/exit-domain-alexadomainTLDs-2018-01-30.csv) |

To reproduce the percentages shown in Figure 3(Alexa Top 1 Million Sites) in the paper, divide the value in each bin in the csv file in the table above by the total number of initial streams we measured during the same period. (No full network extrapolation is required since we are computing percentages.)

The total number of streams during the Alexa Top 1M Sites measurement was `2235050`. Then. for example, the percentage for the `.com` bin is:
  * `595450 / 2235050 * 100 = 26.64146216 ~= 26.6`

##### TLDs of primary domains

_Combined Mean Exit Weight_ - 0.024

We measured the TLDs of all primary domains using wildcards between 2018-02-02 and 2018-02-03.

The results with 95% confidence interval are as follows:

| Measurement Description | Results file |
|-------------|--------------|
| Primary TLDs list | [exit-domain-tlds.txt](data/exit-domain-tlds.txt) |
| Primary TLDs measurement | [exit-domain-primarydomainTLDs-2018-02-02.csv](data/exit-domain-primarydomainTLDs-2018-02-02.csv) |

To reproduce the percentages shown in Figure 3(All Sites) in the paper, divide the value in each bin in the csv file in the table above by the total number of initial streams we measured during the same period. (No full network extrapolation is required since we are computing percentages.)

The total number of streams during the All Sites measurement was `2196406`. Then. for example, the percentage for the `.com` bin is:
  * `817645 / 2196406 * 100 = 37.226496376 ~= 37.2`

## Client Measurements

### AS Client Connection Count

We measured the client connection count for each AS using [PrivCount](https://github.com/privcount/privcount). We used the IPv4 and IPv6 datasets (dated 26th November 2017) from [CAIDA](http://data.caida.org/datasets/routing/routeviews-prefix2as/) to map client IP addresses to its autonomous system (AS). We ran the measurement in two phases, each consisting of four consecutive one-day measurements, and sum the measurements over all days. In the first phase, beginning on 2018-06-22, we included all ASes (59,597 in total), and in the second phase, beginning on 2018-06-27, we included only those 1,653 ASes that did not have zero in their confidence interval in at least one of the days in the first phase. Thus the first phase measurement acted as a filter to reduce the ASes under consideration to those with likely positive true counts.

Utilty: average the connection counts for the 1,653 ASes across all eight days. The new standard deviation can be computed as:

<a href="https://torusage-imc2018.github.io/data/as-client-formula.png"><img title="shadow_packet_flow" src="https://torusage-imc2018.github.io/data/as-client-formula.png" /></a>

| Measurement Description | Results file |
|-------------|--------------|
| ASNs in the CAIDA IPv4 and IPv6 datasets | [as-client-asn.txt](data/as-client-asn.txt) |
| Results from Phase 1 measurement | [as-client-2018-06-22.csv](data/as-client-2018-06-22.csv) |
| Results from Phase 2 measurement | [as-client-2018-06-27.csv](data/as-client-2018-06-27.csv) |
