Overview
--------

This is the landing page for the following research publication:

**Understanding Tor Usage with Privacy-Preserving Measurement**  
_Proceedings of the 18th ACM Internet Measurement Conference (IMC 2018)_  
by Akshaya Mani, T Wilson-Brown, [Rob Jansen](https://www.robgjansen.com), [Aaron Johnson](https://ohmygodel.com/), and [Micah Sherr](https://security.cs.georgetown.edu/~msherr/)  
\[[Full paper available here](https://www.robgjansen.com/publications/torusage-imc2018.pdf)\]  
\[[Appendix describing privacy action bounds available here](https://www.robgjansen.com/publications/torusage-imc2018-appendix.pdf)\]  
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

### AS Client Connection Count

We measured the client connection count for each AS using [PrivCount](https://github.com/privcount/privcount). We used the IPv4 and IPv6 datasets (dated 26th November 2017) from [CAIDA](http://data.caida.org/datasets/routing/routeviews-prefix2as/) to map client IP addresses to its autonomous system (AS). We ran the measurement in two phases, each consisting of four consecutive one-day measurements, and sum the measurements over all days. In the first phase, beginning on 2018-06-22, we included all ASes (59,597 in total), and in the second phase, beginning on 2018-06-27, we included only those 1,653 ASes that did not have zero in their confidence interval in at least one of the days in the first phase. Thus the first phase measurement acted as a filter to reduce the ASes under consideration to those with likely positive true counts.

Utilty: average the connection counts for the 1,653 ASes across all eight days. The new standard deviation can be computed as:

<a href="https://torusage-imc2018.github.io/data/as-client-formula.png"><img title="shadow_packet_flow" src="https://torusage-imc2018.github.io/data/as-client-formula.png" /></a>

| Measurement Description | Results file |
|-------------|--------------|
| ASNs in the CAIDA IPv4 and IPv6 datasets | [as-client-asn.txt](data/as-client-asn.txt) |
| Results from Phase 1 measurement | [as-client-2018-06-22.csv](data/as-client-2018-06-22.csv) |
| Results from Phase 2 measurement | [as-client-2018-06-27.csv](data/as-client-2018-06-27.csv) |
