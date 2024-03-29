---
geometry: margin=1in
month: "December"
year: "2021"
preamble: |
csl: sa4ss.csl
output:
  sa4ss::techreport_pdf:
    default
  bookdown::pdf_document2:
    keep_tex: true
bibliography: sa4ss.bib
lang: en
papersize: letter
---



<!--chapter:end:00a.Rmd-->

---
author:
  - name: Brian J. Langseth
    code: 1
    first: B
    middle: J
    family: Langseth
  - name: Chantel R. Wetzel
    code: 1
    first: C
    middle: R
    family: Wetzel
  - name: Jason M. Cope
    code: 1
    first: J
    middle: M
    family: Cope
  - name: John E. Budrick
    code: 2
    first: J
    middle: E
    family: Budrick
author_list: Langseth, B.J., C.R. Wetzel, J.M. Cope, J.E. Budrick
affiliation:
  - code: 1
    address: Northwest Fisheries Science Center, U.S. Department of Commerce, National
      Oceanic and Atmospheric Administration, National Marine Fisheries Service, 2725
      Montlake Boulevard East, Seattle, Washington 98112
  - code: 2
    address: California Department of Fish and Wildlife, 1123 Industrial Rd., Suite 300,
      San Carlos, California 94070
address:
  - ^1^Northwest Fisheries Science Center, U.S. Department of Commerce, National Oceanic
    and Atmospheric Administration, National Marine Fisheries Service, 2725 Montlake
    Boulevard East, Seattle, Washington 98112
  - ^2^California Department of Fish and Wildlife, 350 Harbor Boulevard, Belmont,
    California 94002
---

<!--chapter:end:00authors.Rmd-->

---
title: Status of quillback rockfish (_Sebastes maliger_) in U.S. waters off the coast of California in 2021 using catch and length data
---

<!--chapter:end:00title.Rmd-->


\pagenumbering{roman}
\setcounter{page}{1}

\renewcommand{\thetable}{\roman{table}}
\renewcommand{\thefigure}{\roman{figure}}

\setlength\parskip{0.5em plus 0.1em minus 0.2em}

\vspace{500cm}

\pagebreak

<!--chapter:end:01a.Rmd-->

\pagebreak
\pagenumbering{arabic}
\setcounter{page}{1}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\setcounter{table}{0}
\setcounter{figure}{0}

<!--chapter:end:10a.Rmd-->

# Introduction

## Basic Information

This assessment reports the status of quillback rockfish (*Sebastes maliger*) off the California coast using data through 2020. 

The stock off the California coast was assessed as a separate stock from other populations off the U.S. West Coast based on the fairly sedentary nature of quillback rockfish [@HannahandRankin_rockfish_site_fidelity_2011; @tolimieri_home_2009], which likely limits movement of fish between California and Oregon. Additionally, the exploitation history and magnitude of removals off the California coast differ from those in Oregon. Although the population of quillback rockfish in California is assessed statewide, given the range of quillback rockfish, this assessment is primarily of quillback rockfish north of Point Conception. Catches of quillback rockfish south of Point Conception were rare, however, where available, these data were used within this assessment.      

<!-- Life history -->


## Life History

Quillback rockfish are a medium- to large-sized nearshore rockfish found from southern California to the Gulf of Alaska [@loveetal_2002]. Off the U.S. West Coast quillback rockfish are primarily located north of central California, with few observations south of Point Conception. Quillback rockfish have historically been part of both commercial and recreational fisheries throughout their range. 

Quillback rockfish are found in waters less than 274 meters in depth in nearshore kelp forests and rocky habitat [@loveetal_2002]. The diets of quillback rockfish consist primarily of benthic and pelagic crustaceans and fish [@Murie_diet_1995]. The body coloring of adult quillback rockfish is brown with yellow to orange blotching and light-colored dorsal saddle patches [@loveetal_2002]. As their name suggests, quillback rockfish have long dorsal fin spines.

Limited studies have evaluated genetic variation in quillback rockfish across the U.S. West Coast. Genetic work has revealed significant differences between Puget Sound and coastal stocks of quillback rockfish [@seeb_gene_1998; @Stoutetal_DPS_2001], however Seeb [-@seeb_gene_1998] did not find significant differentiation in populations of quillback rockfish between coastal Washington and Alaska. Significant population sub-division along the U.S. West Coast has been detected for the closely related, and more well-studied copper rockfish (*Sebastes caurinus*), indicating limited oceanographic exchange among geographically proximate locations [@seeb_gene_1998; @buonaccorsi_population_2002; @johansson_influence_2008]. High site-fidelity [@HannahandRankin_rockfish_site_fidelity_2011] and relatively small home ranges [@tolimieri_home_2009] for quillback rockfish suggests patterns of isolation-by-distance as found for other rockfish.

Quillback rockfish are a long-lived rockfish estimated to live up to 95 years [@loveetal_2002; @YamanakaandLacko_rockfish_2001]. Quillback rockfish was determined to have a vulnerability (V = 2.22) of major concern in a productivity susceptibility analysis [@cope_approach_2011]. This analysis calculated species specific vulnerability scores based on two dimensions: productivity characterized by the life history, and susceptibility characterized by how the stock is likely affected by the fishery in question.


## Historical and Current Fishery Information

_Commercial_

Quillback rockfish off the coast of California is caught in both the recreational and commercial fisheries. Recreational removals are the largest source of fishing mortality and represent approximately 70 percent of the total removals of quillback rockfish across all years (Table \ref{tab:allcatches} and Figure \ref{fig:catch}). The majority of the commercial landings for quillback rockfish occurred between 1990 and 2008, and apart from 1945-1946, in 1984, and in the last four years, commercial landings for quillback rockfish have been less than 2 mt per year. 

Prior to the development of the live-fish market in the 1980s, commercial catches of quillback rockfish were relatively low, and quillback rockfish were often landed dead for a relatively low ex-vessel price per pound. Most fish were caught using hook and line gear, though some were caught using traps, gill nets, and in some instances, trawl gear. Trawling within three miles of shore, where most of their habitat is found, has been prohibited since 1953, and gill nets were banned within three miles of shore in 1994. Whether from directed effort in the nearshore or as incidental catch while targeting other more valuable stocks such as lingcod, catches were below 0.5 mt from 1916 to 1980, with the exception of four of five years from 1944-1948.

With the development and expansion of the nearshore live-fish fishery during the late 1980s and early 1990s, new entrants in this open access fishery were drawn by premium ex-vessel prices for live fish, resulting in over-capitalization of the fishery. Since 2002, the California Department of Fish and Wildlife (CDFW) has managed 19 nearshore species in accordance with Nearshore Fisheries Management Plan [@Wilson-Vandenbergetal_2014]. In 2003, the CDFW implemented a Nearshore Restricted Access Permit system, including a requirement of a Deeper Nearshore Fishery Species Permit to retain quillback rockfish, with the overall goal of reducing the number of participants to a more sustainable level, and with permit issuance based on historical landings history by a retrospective qualifying date. The result was a reduction in permits issued, from 1,127 in 1999 to 505 in 2003, greatly reducing catch levels. In addition, reduced trip limits, seasonal closures in March and April and depth restrictions were implemented to address bycatch of overfished species and associated constraints from these species low ACLs.
 
As overfished shelf rockfish have rebuilt, resumed access to deeper depths has been allowed for Nearshore Permit holders as well as open access fisheries. While depth restrictions for waters deeper than 75 fm were implemented in 2019 south of Point Conception where yelloweye rockfish are uncommon, access in constrained north of Point Conception where, since 2003, depth restrictions at a range of depths starting between 20 and 40 fm, depending on the management area, have prohibited fishing in deeper waters (see separately provided Regulation History addendum). 

As open access fisheries are allowed to retain shelf rockfish species co-occurring with nearshore rockfish species within the open depths, there is growing concern regarding increased encounters by non-permit holders and greater discard mortality from bycatch in deeper depths given that discard mortality is 100% in depths greater than 30 fm. This is of particular concern given both increased trip limits for shelf rockfish species and less constraining depth restrictions allow increased access to these species, as well as drive increased participation in the open access fishery, and therefore increased total mortality. In addition, coverage rates for observers from the WCGOP on small vessels participating in these fisheries provide limited data to inform bycatch rates. Under National Standard 8, reduction of bycatch is a priority and increased observer coverage rates would improve data on discards as the open access fishery for shelf rockfish expands.

_Recreational_

The California recreational fishery in the early part of the 1900s was focused on nearshore waters near ports, but expanded further from port and into deeper depths over time [@Milleretal_2014]. Prior to the groundfish fishery disaster being declared in 2000, there was no time or areas closures for fishing groundfish. During this period, access to deeper depths led to effort being spread over a larger area and filled bag limits with a greater diversity of species from the shelf as well as the nearshore. This resulted in lower catch rates for nearshore rockfish relative to the period after 2000 when depth restrictions at a range of depths starting between 20 to 50 fm were put in place in various management areas north of Point Conception where quillback rockfish are commonly found. This shift of effort into the nearshore kept catch levels high for nearshore rockfish, including quillback rockfish (Figure \ref{fig:catch}), despite greatly reduced seasons. While the part of the stock that was available to the fishery in shallower depths was subject to higher fishing effort, the remainder of the stock (see [Appendix B](#append_b) for estimates of density at depth based on remotely operated vehicle observations) was subject to reduced fishing effort during more than a decade of depth restrictions in waters deeper than 20 to 30 fm that were put in place to facilitate rebuilding of yelloweye rockfish. 

As the yelloweye rockfish stock continues to rebuild, depth restrictions are expected to lessen, increasing access to more of the habitat for quillback rockfish. Once fishing is allowed in waters up to 60 fm, effort for quillback rockfish may decrease as overall effort shifts to the shelf and away from waters where quillback rockfish are most prevalent. Marine Protected Areas (MPAs) instituted between 2003 and 2012 now encompass 20-30% of the rocky reef habitat within 3 miles of shore in state waters (see [Appendix C](#append_c) for details), and provide refugia to spawning stock in a network designed to seed areas outside the MPAs.

<!-- Summary of Management History and Performance -->


## Summary of Management History and Performance

Quillback rockfish is managed by the Pacific Fishery Management Council (PFMC) as a part of the Minor Nearshore Rockfish North and Minor Nearshore Rockfish South complexes. The North and South complexes are split at N. 40$^\circ$ 10' Lat. off the U.S. West Coast. Each complex is managed based on a complex-level overfishing limit (OFL) and annual catch limit (ACL) that are determined by summing the species-specific OFL and ACL (ACLs set equal to the Acceptable Biological Catch) contributions for all stocks managed in the complex. Removals for species within each complex are managed and tracked against the complex total OFL and ACL, rather than on a species by species basis.

Quillback rockfish was most recently assessed in 2010 using Depletion-Based Stock Reduction Analysis (DB-SRA) to provide estimates of coastwide OFLs [@DickandMacCall_dbsra_2010]. The coastwide OFL was then apportioned to each management area based on the proportion of historical catches North and South of N. 40$^\circ$ 10' Lat. DB-SRA does not assess overfished status, but rather assumes that current depletion is distributed around the management target (e.g. 40%). The 2010 assessment found there was a 52% chance that quillback rockfish was experiencing overfishing, as recent coastwide catch of quillback rockfish slightly exceeded the median coastwide OFL estimate at the time. 

The current OFL contribution and implied ACL contribution for quillback rockfish South and North of 40$^\circ$ 10' Lat. N., the state specific ACL allocation (all of the South and 28.7% of the North contribution for California; Groundfish Management Team, pers. comm.), and the total removals are shown in Table \ref{tab:ofl}.

<!--chapter:end:11introduction.Rmd-->

# Data
The following types and sources of data were used in this assessment. Fishery catch and composition data were specific to California, however biological data were estimated coastwide and included Oregon, Washington, and California sources. 

1. Commercial landings, and length and weight data obtained from PacFIN, and the CDFW. Weight data were used to estimate biological parameters which were fixed inputs to the model.
2. Estimates of commercial discard length frequencies and fraction discarded in the fishery obtained from the West Coast Groundfish Observer Program (WCGOP).
3. Recreational landings, discards, and length and weight data obtained from the Marine Recreational Fisheries Statistics Survey (MRFSS) and the California Recreational Fisheries Survey (CRFS), which are available on the Recreational Fisheries Information Network (RecFIN). Weight data were used to estimate biological parameters which were fixed inputs to the model.
4. Historical reconstruction of commercial and recreational landings from Ralston et al. [-@ralston_documentation_2010].
5. Fishery independent biological data (length, weight, and age) from the Northwest Fisheries Science Center (NWFSC) West Coast Groundfish Bottom Trawl Survey (WCGBTS). These data were used to estimate biological parameters which were fixed inputs to the model.
6. Estimates of fecundity, maturity, and natural mortality from various sources.

A description of each data type is provided below, with timing of catch and composition data used in the base model shown in Figure \ref{fig:data-plot}.

<!--chapter:end:20data.Rmd-->

## Fishery-Dependent Data

### Commercial Fishery

#### Landings

Commercial landings for quillback rockfish were combined into a single fleet by aggregating across gear types and fish landed live vs. dead. This choice was driven by the limited length composition data for each gear type, and the fact that length distributions were similar by gear type. Additionally, commercial length data available in the Pacific Fisheries Information Network (PacFIN) database for California did not have the needed information to identify samples from live vs. dead fish (e.g., condition code), preventing the ability to evaluate the data based on live vs. dead landings. 

Commercial landings estimates for 1916 - 1969 from the California Catch Reconstruction [@ralston_documentation_2010] were queried from the Southwest Fisheries Science Center (SWFSC) catch reconstruction database. Landings in this database are divided into trawl, 'non-trawl', and 'unknown' gear categories, for various regions within California. Additional catches between 1948-1968 landed at California ports but caught off Oregon and Washington were added to the landings from the catch reconstruction to represent total catches landed at California ports. Estimated catches of quillback rockfish from this additional analysis were very small and totaled approximately 0.30 mt over all years, with no more than 0.08 mt in any one year.

In September 2005, the California Cooperative Groundfish Survey (CCGS) incorporated newly acquired commercial landings statistics from 1969 - 1979 into the CALCOM database. The data consisted of landing receipts ("fish tickets"), including mixed species categories for rockfish. In order to assign rockfish landings to individual species, the earliest available species composition samples were applied to the fish ticket data by port, gear, and quarter. These 'ratio estimator' landings are coded (internally) as market category 977 in the CALCOM database, and are used in this and past assessments as the best available landings for the time period 1969 - 1979 for all port complexes. Catches during this time for quillback rockfish are negligible. See Appendix A of Dick et al. [-@dick_status_2007] for further details.

Commercial fishery landings from 1984-2020 were obtained from PacFIN (extracted 2/21/2021). There were no quillback rockfish catches in PacFIN from 1981-1983 so landings of quillback rockfish from 1981-1983 were set equal to the average landings from the three years before (1978 - 1980) and after (1984 - 1986) this time period. 

The input catches in the model represent total removals, which equal landings plus discards (Table \ref{tab:allcatches} and Figure \ref{fig:catch}). Discards totals for the commercial fleet from 2002 - 2019 were determined based on WCGOP data provided in the Groundfish Expanded Mortality Multiyear (GEMM) product. The total coastwide observed discards were allocated to state and area based on the total observed landings observed by WCGOP. Discards were added to landings to obtain total removals for 2002-2019. Total removals prior to 2002, and for 2020 where no WCGOP data were yet available, were calculated using the average discard rates from WCGOP in 2002-2018 for California (3.6 percent).


#### Length Compositions 

Length data of quillback rockfish collected from commercial fisheries from 1978-2020 was extracted from PacFIN (Table \ref{tab:com-len-samps}, extracted 2/23/2021). Samples were very sparse prior to 1991 and consisted of only three samples, one each in 1978, 1984, and 1987, which were not used in model fitting (i.e. used as a 'ghost' fleet, not fit by the model but implied fits reflected in diagnostic output). Length samples were most numerous during the 1990s, while since 2002 the number of length samples has been relatively low. The sizes observed from 1991 - 2002 were relatively broad, ranging from approximately 20 - 50 cm (the largest data bin; Figure \ref{fig:com-len-data}). Since approximately 2003, the range of sizes observed have shrunk to around 30 - 45 cm, while tending toward larger sizes over time. This shift in observed sizes is also reflected in the mean lengths observed by year, which have increased from around 35 cm to above 40 cm since 2003 (Figure \ref{fig:mean-com-len-data}). The shift in mean size could be due to shifts in fishery behavior, sampling, changes in the population demographics (e.g., lack of strong recruitment), or a combination of multiple factors. 

The input sample sizes for the commercial length data were calculated via the Stewart method (Ian Stewart, personal communication) which incorporate the number of trips and fish by year:

\begin{centering}

Input effN = $N_{\text{trips}} + 0.138 * N_{\text{fish}}$ if $N_{\text{fish}}/N_{\text{trips}}$ is $<$ 44

Input effN = $7.06 * N_{\text{trips}}$ if $N_{\text{fish}}/N_{\text{trips}}$ is $\geq$ 44

\end{centering}


### Recreational / Sport Fishery

#### Landings

Recreational landings from 1928 - 1980 were obtained from the historical reconstruction [@ralston_documentation_2010]. Recreational removals from 1981 - 1989 were obtained from MRFSS. The MRFSS dataset also includes removals in 1980, however Ralston et al. [-@ralston_documentation_2010] considered their 1980 estimate to be more reliable than that of MRFSS, so landings from the historical reconstructions were preferred for 1980. The total removals for the missing years between the MRFSS and CRFS datasets, 1990 - 1992, were assumed by applying a linear ramp in removals between the 1989 and 1993 values. Removals in 1993 were some of the largest for the recreational fleet across all years, so the effects of assuming an average catch from 1989 and 1994 for 1993, and altering the ramp was explored as a Sensitivity (see Section \ref{sensitivity-analyses} for details). Both data sources, MRFSS and CRFS, provide total mortality which combined observed landings plus estimates of discarded fish. Discard estimates for the recreational fleet for years between 1928 - 1980 were calculated based on the discard rate (1.7 percent) from the MRFSS and CRFS data in years 1980-2004. A direct breakdown of the landed and discarded fish by weight was not available for these years, so the proportion by number of total dead catch that was unavailable to the sampler, which included dead discarded fish, was calculated and averaged across years.  

The recreational fishery is the main source of mortality for quillback rockfish in California (Table \ref{tab:allcatches} and Figure \ref{fig:catch}). Recreational removals peaked in the late 1970s and early 1980s, with two years of exceptionally large catches in 1984 and 1993. Removals declined sharply in 1994, but increased to levels similar to the late 1970s and early 1980s in the mid 2000s and again in recent years. 


#### Length Compositions 

Recreational length samples from MRFSS for years 1980 - 2003 and from CRFS for years 2004 - 2020 were obtained from the RecFIN website. Lengths of fish measured by samplers onboard Commercial Passenger Fishing Vessels (CPFV) prior to being released (Type 3d data) were also obtained from 2003 to 2020, however released samples (n = 23) were not used in length compositions for the base model. The number of length observations by year are shown in Table \ref{tab:len-samps}, with the highest number of samples occurring in years since 2004. The distribution of lengths of quillback rockfish observed by the recreational fleet have generally ranged between 20 and 50 cm (the maximum length data bin size) across all available years (Figure \ref{fig:rec-len-data}). Samples in years prior to 1989 generally were more uniformly distributed and had smaller samples sizes than in more recent years. The mean length observed each year was more variable within and among years prior to the mid 1990s, ranging from slightly above 40 cm to slightly below 30 cm (Figure \ref{fig:mean-rec-len-data}). Since 2005, mean length has been less variable across years, between 35 and 40 cm, with less variation within each year as well.

The input sample sizes for the recreational length data were set equal to the number of length samples available by year. 

<!--chapter:end:21f-.Rmd-->

## Fishery-Independent Data

No fishery-independent data sources that are commonly incorporated in West Coast groundfish assessments (as required by the data moderate Terms of Reference) had adequate sample sizes of quillback rockfish off the California coast to include abundance indices for this assessment. The WCGBTS, the Hook and Line survey, and the Triennial survey collect data off the California coast on rockfish biology and abundance. There were no more than ten positive tows of quillback rockfish in any one year coastwide in the WCGBTS, and typically fewer than five. Similarly there were no more than five positive tows of quillback rockfish in any one year coastwide for the Triennial survey. No quillback rockfish were captured in the Hook and Line survey. Given that indices of abundance were not calculated due to small sample sizes, length composition data from the WCGBTS (n = 26) and Triennial Survey (n = 1) off California were not included in the model. Biological data from the WCGBTS survey was used in external calculations of biological parameters, including growth and weight-at-length relationships. No ages or weights for quillback rockfish were available from the Triennial survey. 

<!--chapter:end:21s-.Rmd-->

<!-- Biological Data -->

## Biological Data

This assessment modeled quillback rockfish as a single sex. Growth and length-weight relationships were similar across sexes, and the literature provided limited evidence of sexual dimorphism in length [@LenarzandEcheverria_dimorphism_1991]. The sections below therefore describe combined male and female biological data. 

### Natural Mortality

Hamel [-@hamel_method_2015] developed a method for combining meta-analytic approaches relating instantaneous natural mortality rate ($M$) to other life-history parameters such as longevity, size, growth rate, and reproductive effort to provide a prior on $M$. Then et al. [-@then_evaluating_2015-1] provided an updated data set of estimates of $M$ and related life history parameters across a large number of fish species from which to develop an $M$ estimator for fish species in general. They concluded by recommending $M$ estimates be based on maximum age alone, based on an updated Hoenig non-linear least-squares estimator $M=4.899A^{-0.916}_{max}$. The approach of basing $M$ priors on maximum age alone was one that was already being used for West Coast rockfish assessments. However, in fitting the alternative model forms relating $M$ to $A_{\text{max}}$, Then et al. [-@then_evaluating_2015-1] did not consistently apply their transformation. In particular, in real space, one would expect substantial heteroscedasticity in both the observation and process error associated with the observed relationship of $M$ to $A_{\text{max}}$. Therefore, it would be reasonable to fit all models under a log transformation. This was not done. Re-evaluating the data used in Then et al. [-@then_evaluating_2015-1] by fitting the one-parameter $A_{\text{max}}$ model under a log-log transformation (such that the slope is forced to be -1 in the transformed space Hamel [-@hamel_method_2015]), the point estimate for $M$ is:

\begin{centering}

$M=\frac{5.4}{A_{\text{max}}}$

\end{centering}

The above is also the median of the prior suggested by Hamel [-@hamel_method_2015]. The prior is defined as a log-normal distribution with parameters $\mu = ln(5.4/A_{\text{max}})$ and $\sigma = 0.438$. Using a maximum age of 95 years, the point estimate and median of the prior for $M$ is 0.057 per year.

The maximum age assumed for calculating natural mortality in the base model was 95 years. The maximum age of 95 years was based on literature values for the U.S. West Coast examining the longevity of female quillback rockfish [@loveetal_2002; @Palssonetal_2009; @YamanakaandLacko_rockfish_2001]. Yamanaka and Lacko [-@YamanakaandLacko_rockfish_2001] found male longevity to be 76 years. Literature estimates were larger than the oldest aged quillback rockfish (73, 70, and 69) among data used in this assessment. These ages were from fish caught off the coast of Washington in 1999.

### Maturation and Fecundity

Maturity-at-length estimates were based on the work of Hannah and Blume [-@HannahandBlume_maturity_2011] which estimated the 50% size-at-maturity of 29.2 cm off the coast of Oregon with maturity asymptoting to 1.0 for larger fish (Figure \ref{fig:maturity}). A length at 50% maturity of 29.2 cm is consistent with other studies for quillback rockfish, which provide a range of 26-32 cm [@Echeverria_maturity_1987; @Rosenthaletal_maturity_1982].  

The fecundity-at-length was based on research by Dick et al. [-@dick_meta-analysis_2017]. The fecundity relationship for quillback rockfish was estimated equal to 3.93e-07$L$^3.7^ in millions of eggs where $L$ is length in cm. Fecundity-at-length is shown in Figure \ref{fig:fecundity}.

### Length-Weight Relationship

The length-weight relationship for quillback rockfish was estimated outside the model using available coastwide biological data collected from fishery-independent and fishery-dependent data sources (Figure \ref{fig:len-weight-survey}). Sources included the WCGBTS, and recreational and commercial samples from all states (Table \ref{tab:len-at-weight-samps}). Only directly measured weight and length values were used; any values with more than two decimal places were assumed to be calculated from another measurement and were excluded. This occurred for 32 percent of lengths and 20 percent of the weights in the MRFSS-era recreational samples. Weights from Oregon special projects samples taken from the Oregon recreational and commercial fleets (n = 241) were not included. The estimated length-weight relationship for quillback rockfish was $W$ = 1.963e-05$L$^3.02^ where $L$ is fork length in cm and $W$ is weight in kg (Figures \ref{fig:len-weight}).

### Growth (Length-at-Age)

The length-at-age relationship for quillback rockfish was estimated outside the model using data collected from fishery-dependent sources off the coast of Oregon and Washington collected between 1998-2019, and from a single coastwide fishery-independent source (WCGBTS) collected between 2005-2019 (Table \ref{tab:len-at-age-samps}). Ages from Oregon special projects samples taken from the Oregon commercial fleet (n = 30) were not included. Age data were generally sparse for quillback rockfish from any one source (Figure \ref{fig:len-age-data}). The fishery-dependent data had limited observations of young fish less than 5 years of age, but had observations of fish up to 73 years of age. The fishery-independent data had limited observations of old fish greater than 40 years of age, but had observations of fish as young as one year of age. Growth parameters for quillback rockfish were estimated at the following values:

\begin{centering}

$L_{\infty}$ = 43.04 cm; $k$ = 0.199; $t0$ = -0.067 cm  

\end{centering}

These values were fixed within the base model. The coefficient of variation (CV) around young and old fish was fixed at a value of 0.10. The length-at-age curve with the CV around length-at-age is shown in Figure \ref{fig:len-age-ss}. The estimate of $L_{\infty}$ is comparable to literature values, while the estimate of $k$ is on the higher side of literature values which vary from 0.06 - 0.19 [@YamanakaandLacko_rockfish_2001; @Palssonetal_2009; @Westetal_2014].

Table \ref{tab:growth-tab} shows the length-at-age, weight-at-age, maturity-at-age, and spawning output (the product of fecundity and maturity) assumed in the base model.

<!--chapter:end:22biology.Rmd-->

# Assessment Model

<!-- Summary of Previous Assessments and Bridging analysis -->


## Summary of Previous Assessments 

Quillback rockfish was last assessed in 2010 [@DickandMacCall_dbsra_2010]. The stock was assessed using Depletion-Based Stock Reduction Analysis (DB-SRA) which is a data-limited approach that incorporates catch data with priors on select parameters including natural mortality, the ratio of fishing mortality at maximum sustainable yield to natural mortality, current depletion, and the depletion at maximum sustainable yield to estimate overfishing status, but not overfished status. Quillback rockfish was assessed as a single coastwide stock to generate an overall OFL that was then apportioned to each management area based on the proportion of historical catches North and South of 40$^\circ$ 10' Lat. N.. Assuming that current depletion was at the management target on average (e.g. 40%), the 2010 assessment found that quillback rockfish had a 52% chance of experiencing overfishing coastwide. 

### Bridging Analysis

A direct bridging analysis was not conducted because the previous assessment was structured as a single coastwide model. The previous assessment also used DB-SRA, which uses different assumptions and data than the model used for this assessment, making a direct bridging analysis intractable.  

## Selection of Method

Quillback rockfish was assessed using a catch and length-based (SS-CL) data moderate method, as allowed within the Terms of Reference. Fishery-independent indices had inadequate sample sizes, as described in Section \ref{fishery-independent-data} above, so index-based methods were not selected. 

## Model Structure and Assumptions

California quillback rockfish was assessed using a one-sex model with life history parameters combined across sexes. The model assumed two fleets: 1) commercial and 2) recreational fleets with removals beginning in 1916. Selectivity for the commercial and recreational fleets was specified to be asymptotic using a six-parameter double normal parameterization. The ascending width and beginning size of maximum selectivity parameters were estimated for each fleet. Annual recruitment deviations were estimated within the base model.

<!-- Modeling Platform and Structure and Priors-->


### Modeling Platform and Structure

Stock Synthesis (SS) version 3.30.16 was used to estimate the parameters in the model [@methot_stock_2013]. The R package r4ss, version 1.41.0 [@r4ss_2021], along with R version 4.0.2 [@R_2020] were used to investigate and plot model fits. The NWFSC developed R packages nwfscSurvey_2.0 and PacFIN.Utilities_0.0.2.0000 were used for synthesis and processing of data for use in Stock Synthesis. 

### Priors

Fixed parameter values for natural mortality and steepness, based on prior distributions, were used in the base model.  The prior distribution for natural mortality was based on the Hamel [-@hamel_method_2015] meta-analytic approach with an assumed maximum age of 95 years. The prior assumed a log-normal distribution for natural mortality with a median of 0.057 and a standard deviation of 0.438. 

The prior for steepness assumed a beta distribution with mean of 0.72 and standard deviation of 0.158. The prior parameters are based on the Thorson-Dorn rockfish prior (commonly used in past West Coast rockfish assessments) conducted by James Thorson (personal communication, NWFSC, NOAA) which was reviewed and endorsed by the Scientific and Statistical Committee (SSC) in 2017. However, this approach was subsequently rejected for future analysis in 2019 when the new meta-analysis resulted in a mean value of approximately 0.95. In the absence of a new method for generating a prior for steepness the default approach reverts to the previously endorsed method, the 2017 value.

### Data Weighting

Length composition data for the commercial fishery started with a sample size determined from the equation listed in Section \ref{commercial-fishery} (Table \ref{tab:com-len-samps}). The input sample size for the recreational fishery length composition data was set equal to the number of length samples by year (Table \ref{tab:len-samps}). 

The base model was weighted using the McAllister-Ianelli method, which is based on equation 2.5 and 2.6 in Appendix 2 of McAllister et al. [-@mcallister_bayesian_1997]. The weightings applied using the McAllister-Ianelli method are provided in Table \ref{tab:dw}. This formulation accounts for a lack of independence in sampled fish by downweighting the number of samples. The amount of downweighting for a data set is calculated as the harmonic mean of the effective sample sizes across years. This method does not account for correlation in the data among years. Sensitivities were performed examining the difference in weighting using equation TA1.8 in Francis [-@francis_data_2011] and the Dirichlet Multinomial Weighting (Thorson et al. [-@thorson_model-based_2017]).

### Estimated and Fixed Parameters

There were 98 estimated parameters in the base model. These included one parameter for $R_0$, 4 parameters for selectivity, 81 annual recruitment deviations, and 12 forecast recruitment deviations (Table \ref{tab:params}). 

Fixed parameters in the model were as follows. Steepness was fixed at 0.72, and natural mortality was fixed at 0.057, as described above in Section \ref{priors}. Growth, maturity-at-length, and length-at-weight were fixed as described above in Section \ref{biological-data}. The standard deviation of recruitment deviates was fixed at 0.6. Likelihood profiles were performed for steepness, natural mortality, length at maximum size, vonBertalanffy growth coefficient, and the CV at maximum length.

Selectivity in the recreational and commercial fleets was fixed to be asymptotic with only ascending width and beginning size of maximum selectivity being estimated. During initial model development, the descending width and width of maximum selectivity parameters for the recreational and commercial fleets were estimated to identify appropriate fixed values consistent with the data, and then fixed at those estimates. Dome-shaped selectivity was explored for all fleets within the model as sensitivities (see [Sensitivity Analyses](#sensitivity-analyses) section). Older quillback rockfish are often found in deeper waters and may move into areas that limit their availability to fishing gear. Dome shaped selectivity can also occur under heterogeneous fishing pressure across space by fleets [@Waterhouseetal_spatialSelex_2014]. 

Given the depth closures in the recreational fishery off California it was initially assumed that large quillback rockfish would not be caught in the fishery indicating dome-shaped selectivity. However, lengths at depth of quillback rockfish from Remote Operated Vehicle data suggested larger quillback rockfish occur across depths and are not limited to depths closed to fishing (see [Appendix B](#append_b) for details). This information lead to the assumption of asymptotic selectivity for the recreational fleet for the base model.       

## Model Selection and Evaluation

The base assessment model for quillback rockfish was developed to balance parsimony and realism, with the goal of estimating a spawning output trajectory for the population of quillback rockfish off California. The model contains many assumptions to achieve parsimony and uses many different sources of data to estimate reality. A series of investigative model runs were done to achieve the final base model.


<!--chapter:end:30model.Rmd-->

<!-- Base Model Results -->


## Base Model Results

The base model parameter estimates along with approximate asymptotic standard errors are shown in Table \ref{tab:params} and the likelihood components are shown in Table \ref{tab:likes}. Estimates of derived reference points and approximate 95 percent asymptotic confidence intervals are shown in Table \ref{tab:referenceES}. Estimates of stock size and status over time are shown in Table \ref{tab:timeseries}. 

### Parameter Estimates
Estimated parameter values are provided in Table \ref{tab:params}. The value for ln($R_0$) was estimated at 3.17. The selectivity curves for the commercial and recreational fleet are shown in Figure \ref{fig:selex}. The selectivity was assumed to be asymptotic for the commercial fleet with an estimated peak in maximum selectivity starting at 41.6 cm. The selectivity for the recreational fleet was also assumed to be asymptotic with an estimated peak of the selectivity curve starting at 33.4 cm. Sensitivities to the shape of the commercial and recreational selectivity form and potential time blocking of the recreational fleet was explored (see below in Section \ref{sensitivity-analyses}).

The estimated annual recruitment and recruitment deviations are shown in Figures \ref{fig:recruits} and \ref{fig:rec-devs}. Strong recruitment events were estimated prior to 2000 and in 2011. Recruitment deviations in 1987, 1996, and 1999 were particularly strong and resulted in an increase in biomass during the early 2000s. While the largest recruitment deviations were estimated to have occurred in these three specific years, the surrounding years in the 1980s and 1990s also have above average recruitment estimated. Recruitment deviations in the 1980s and 1990s however were highly uncertain, with standard errors extending above the value of $\sigma_R$ (0.6), suggesting recruitment during these years is not strongly informed by the data. Recruitment deviations for 1996 and 1999 were less uncertain, with standard errors below that of $\sigma_R, suggesting these two recruitments were more informed by the data. Below average recruitment was estimated in all years since 2000, with the exception of 2011. Bias adjustment was applied to the annual estimates of recruitment deviations following the pattern of transformed variances in recent years as shown in Figure \ref{fig:bias-adj}.

The general pattern in recruitment deviations showed fairly close coherence with the recruitment deviations estimated in the separate Oregon model. The Oregon base model estimated above average recruitment in the late 1990s, though for fewer years, and a strong recruitment pulse in 2012. This may potentially suggest that quillback rockfish off the coast of California and Oregon experience similar drivers in recruitment.

The large recruitment pulses in the 1980s and 1990s primarily show up in the composition data for the commercial and recreational fleets as a steady range of sizes across years, but also as a pulse of young fish around 2000 and 2001 for the commercial and recreational fleets. The recruitment pulse in 1999 does not clearly show up as a single pulse of young fish in later years but is probably aggregated with the 1996 recruitment pulse to support the trend of increasing mean size for both the commercial and recreational fleets. The increasing mean size in the recreational and commercial fleet after 2005 along with minimal catches of smaller fish in the composition data supports the below average recruitment in the 2000s. The 2011 recruitment pulse shows up primarily in the composition data for the recreational fleet as pulses of smaller fish in 2015-2017 that are also reflected by declines in mean size. The commercial fleet also shows some pulses of smaller fish in 2017-2018 along with declines in mean size, with the later time frame likely being due to a right shifted selectivity curve compared to the recreational fleet. 

### Fits to the Data

Fits to the length data are shown based on the Pearson residuals-at-length, the annual mean lengths, and aggregated length composition data for each of the commercial and recreational fleets. Fits to the length composition data by year are provided in [Appendix D](#append_d).

The Pearson residuals for the commercial fishery have no discernible pattern of misfit to the length data across cohorts but show areas of misfit over time (Figure \ref{fig:com-pearson}). The residuals show that the peak of the composition is being underfit in many years since 2001, where sample sizes are lower and the distributions have a prominent peak (see [Appendix D](#append_d) for details). The mean lengths observed by the commercial fishery were variable by year, with higher variation since 2004 given smaller sample size, and showed an increase in mean length starting in 2007 and a decline after 2014 (Figure \ref{fig:com-mean-len-fit}). The increase in mean size estimated by the model was substantially less than the increase in mean size observed in the data, and likely a consequence of smaller sample size for commercial lengths compared to recreational lengths during this time.   

The Pearson residuals for the recreational length data were variable by year and indicate no discernible pattern of misfit to the length data (Figure \ref{fig:rec-pearson}). Positive residuals at the edges of the distribution in years before 2004 , which are the largest residuals, are indicative of widely spread distributions with lower sample size. In years since 2004, there are periods of positive and negative residuals in clusters over two to five years. The positive residuals indicate underfitting of peaked distributions (e.g. in 2006-2010, or in 2012-2014), whereas negative residuals indicate overfitting of the distribution as it skews to the left or right (e.g. 2005-2007 or 2015-2019; see [Appendix D](#append_d) for details). The mean length decreased from a high around 40cm in the early 1980s through the 1990s to under 30cm, and then increased slightly through 2004. After 2004, the variation in mean length was reduced, and mean length varied around 35 cm, with increases through 2013 and decline in 2015 and 2016 (Figure \ref{fig:rec-mean-len-fit}). The mean length was highly variable in 2002 due to low sample size (Table \ref{tab:len-samps}) and a flat length distribution. 

Aggregate fits by fleet are shown in Figure \ref{fig:agg-len-fit}. The model fits the aggregated lengths for both the commercial and recreational fleet well. Both fleets show similar ranges of sizes caught and a central tendency of 36 cm. The commercial fleet is more peaked compared to the recreational fleet, which has a more rounded peak around its central tendency and slight shift toward smaller sizes. The model expects a slightly higher proportion of the largest fish for both fleets relative to the data. This may indicate that the true selectivity of the recreational and commercial fleets may have some level of reduced selectivity for the largest fish (i.e. dome-shape). Sensitivities examining dome-shaped selectivity form were performed and presented in the [Sensitivity Analyses](#sensitivity-analyses) section below. 


### Population Trajectory

The predicted spawning output (in millions of eggs) is given in Table \ref{tab:timeseries} and plotted in Figure \ref{fig:ssb}. The estimates of spawning output across time are uncertain with the base model estimating a spawning output of 7.75 in 2021 with a 95 percent asymptotic confidence interval ranging from 1.65 - 13.84 millions of eggs. The predicted spawning output from the base model declines steadily until 1999, with the exception of a slight increase around 1990, and then increases due to several above average recruitment events that occurred in the to mid- to late-1990s. The population then increases until 2007 after which it remains level until 2016 and then declines through 2020. The estimate of total biomass over time is shown in Figure \ref{fig:tot-bio}.

The 2021 spawning output relative to unfished equilibrium spawning output is below the threshold of 25 percent of unfished spawning output (0.14, Figure \ref{fig:depl}). Approximate 95% confidence interval based on the asymptotic variance estimates show that the uncertainty in the estimated spawning output ranges between approximately 5 - 25 percent of unfished equilibrium spawning output.

The stock-recruit curve resulting from a value of steepness fixed at 0.72 is shown in Figure \ref{fig:bh-curve}. The estimated annual recruitment is shown in Figure \ref{fig:recruits}.

<!--chapter:end:33results.Rmd-->

## Model Diagnostics

### Convergence

Proper convergence was determined by starting the minimization process from dispersed values of the maximum likelihood estimates and adjusting phases of the estimated parameters to determine if the model found a better minimum. Starting parameters were first jittered by 10 percent. This was repeated 100 times with 64 out of 100 runs returning to the base model likelihood. A lower negative log-likelihood model fit was not found and all runs converged. When parameters were jittered by 25 percent, 57 of 100 runs returned to the base model likelihood. A lower negative log-likelihood model fit was again not found. Through the jittering done as explained and likelihood profiles (described below), we are confident that the base model as presented represents the best fit to the data given the assumptions made. There were no difficulties in inverting the Hessian to obtain estimates of variability throughout initial model attempts and all explorations resulted in a positive-definite Hessian. 

### Likelihood Profiles

Likelihood profiles were conducted for $R_0$, steepness, natural mortality, $L_{\infty}$, growth coefficient ($k$), and CV at maximum length values separately. These likelihood profiles were conducted by fixing the parameter at specific values and estimating the remaining parameters based on the fixed parameter value. 

In regards to values of $R_0$, the negative log-likelihood was minimized at a ln($R_0$) of 3.17 (Figure \ref{fig:r0-profile}). The commercial data supported lower ln($R_0$) values around 2.75 whereas the recreational data supported ln($R_0$) near the base model value. Increasing $R_0$ relative to the base model value resulted in an increase in stock scale (Figure \ref{fig:r0-ssb}) and status (Figure \ref{fig:r0-depl}). 

For steepness, values at the upper bound of 1.0 had the lowest negative log-likelihood (Figure \ref{fig:h-profile}). Assuming higher or lower steepness values than the fixed base model value of 0.72 affected spawning output estimates by approximately 20% at most (Figure \ref{fig:h-ssb}), and had relatively little effect on stock status for all but the highest values (Figure \ref{fig:h-depl}). The estimated relative final stock status was below 0.25 for all but the highest value of steepness.

The negative log-likelihood profile across natural mortality supported values at the upper range of profiled values (0.12; Figure \ref{fig:m-profile}). The estimated stock trajectories assuming lower or higher natural mortality values than the base model value of 0.057 varied up to 20% of the unfished and recent spawning output (Figures \ref{fig:m-ssb}). Higher values of $M$ reduced unfished spawning output but increased recent spawning output so the range of stock status varied from below the management precautionary zone (between 0.25 - 0.40) for lower values of $M$ to within and above the management precautionary zone for higher values of $M$ (Figure \ref{fig:m-depl}). 

A profile across a range of $L_{\infty}$ values was also conducted. The negative log-likelihood was minimized at 42 cm, near the fixed value of 43.04, though the negative log-likelihood for both 41 cm and 43 were greater than two units from the minimum (Figure \ref{fig:linf-profile}). The commercial data supported lower $L_{\infty}$ values, at the edge of the profiled range. The stock scale varied across alternative $L_{\infty}$ values where assuming lower values resulted in increased recent spawning output and assuming higher values resulted in increased unfished spawning output but decreased recent spawning output (Figure \ref{fig:linf-ssb}). Lower values of $L_{\infty}$ compared to the base resulted in a range of stock status from within, and above the management precautionary zone whereas higher $L_{\infty}$ resulted in greater levels of depletion (Figure \ref{fig:linf-depl}).

The negative log-likelihood profile across values of $k$ showed support for values between 0.11 and 0.14, and was minimized at 0.13, which is lower than the fixed value of 0.199 (Figure \ref{fig:k-profile}). The commercial data suggested lower estimate of $k$ to minimize negative log-likelihood but supported estimates between 0.10 and 0.16 while the recreational data suggested a minimum at 0.19, but supported values ranging from 0.12 to 0.23. The stock scale (Figure \ref{fig:k-ssb}) and status (Figure \ref{fig:k-depl}) increased under lower $k$ values.

Profiles for $L_{\infty}$ and $k$ indicate there may be information in the data to estimate growth parameters given that well defined minimums for each parameter exist among the profile values. Sensitivities estimating growth were performed and presented in the [Sensitivity Analyses](#sensitivity-analyses) section below. 

The negative log-likelihood profile across values for the CV at maximum length showed support for 0.08 and 0.09, with a minimum at 0.08, slightly lower than the base model value of 0.1 (Figure \ref{fig:cv2-profile}). The commercial data supported 0.08, while the recreational data supported 0.09. Higher variation around maximum length (i.e. higher values of CV) resulted in smaller unfished and recent spawning output (Figure \ref{fig:cv2-ssb}), and greater depletion (Figure \ref{fig:cv2-depl}), though differences with the base model were relatively small across profiled values.   

### Retrospective Analysis

A five-year retrospective analysis was conducted by running the model using data up to 2015, 2016, 2017, 2018, and 2019. The estimated spawning output (Figures \ref{fig:retro-ssb}) and stock status (Figure \ref{fig:retro-depl}) declined in comparison with the base model as recent years of data were removed. Removing years of data resulted in a steady decline is spawning output relative to the base model likely due to reducing the amount of information in the length comps about above average recruitment pulses (Figures \ref{fig:retro-recdevs}). 

### Sensitivity Analyses

A number of sensitivity analyses were conducted. Sensitivities were conducted as a single exploration from the base model assumptions and/or data, and were not performed in a cumulative fashion.

\begin{enumerate}
   
  \item Deterministic recruitment from the stock recruitment curve. 

  \item Data weighting according to the Francis method (Francis DW) using the weighting values shown in Table \ref{tab:dw}. 
  
  \item Data weighting according to the Dirichlet Multinomial method (DM DW) where the estimated parameters are shown in Table \ref{tab:dw}. 

  \item Estimate $L_{\infty}$.
  
  \item Estimate $k$.
  
  \item Estimate $L_{\infty}$ and $k$.

  \item Estimate the coefficient of variation in length of older fishes.

  \item Estimate natural mortality.
  
  \item Exclude composition data prior to 2004 for recreational fleet
  
  \item Exclude composition data prior to 1994 for recreational fleet

  \item Allow recreational selectivity form to be dome-shaped. 
  
  \item Allow commercial selectivity form to be dome-shaped.
  
  \item Estimate recreational selectivity block: 1979-1993 and 1994-2020 with asymptotic selectivity.  

  \item Adjust extreme catches for the commercial (in 1991) and recreational (in 1983 and 1993) fleets based on the average of the three years before and three years after the year of high catch. Adjusting recreational catches in 1993 results in changes to interpolated values in 1990-1992.     
  
\end{enumerate}

Likelihood values and estimates of key parameters from each sensitivity are available in Table \ref{tab:sensitivities}. Plots of the estimated time-series of spawning output, relative spawning output, and recruitment are shown in Figures \ref{fig:sens-ssb}, \ref{fig:sens-depl}, and \ref{fig:sens-recdev}, respectively.

The largest change from the base model occurred where large catches were adjusted downward, and when estimating natural mortality. Estimating $M$ resulted in a 24 percent lower estimate for initial spawning output and over two-fold higher estimate for recent spawning output compared to the base model. Stock status increased to above the management target of 0.4. The estimate for $M$ was 0.11, which according to the prior of Hamel [-@hamel_method_2015] would translate to a max age of around 50 years. Lowering the magnitude of large catches resulted in a 28 percent decline in unfished spawning output, but with a similar decline in recent spawning output such that stock status was similar. 

Six other sensitivities had either changes in initial spawning output near 10 percent or more, or resulted in depletion estimates within the precautionary zone (between 0.25 - 0.40). The sensitivities where recruitment deterministically followed the stock recruitment curve, and where data weighting was with the Dirichlet-Multinomial resulted in unfished spawning output increasing 10 percent, and declining 8 percent respectively, but similar stock status compared to the base model. Results for assuming deterministic recruitment were similar regardless of whether data weighting was updated. Estimating $L_{\infty}$, $k$, and $L_{\infty}$ and $k$ resulted in comparable estimates of unfished spawning output to that of the base model but higher recent spawning output. The two sensitivities estimating $k$ resulted in stock status between the target and threshold ratios, whereas the sensitivity estimating $L_{\infty}$ was slightly below 0.25 and more similar to the base model.  

All other sensitivities, including those estimating dome-shaped recruitment, resulted in similar estimates of unfished and recent spawning output, and thus had similar stock status, compared to the base model.

#### Additional Sensitivity Analyses and Data Explorations During Reviews

During the reviews of the quillback rockfish stock assessment at the SSC's Groundfish Subcommittee (GFSC) meetings on June 21-22, 2021 and August 17, 2021, a number of new additional sensitivities and data explorations were requested. These requests were grouped around exploration of additional length data, additional age data, and alternative selectivity blocks. Responses to these requests were described in reports presented at the August 17, 2021 meeting (Langseth -@Langseth_augrequests_2021 for requests made during the June 21-22 review) and the mop-up meeting on September 29-30, 2021 (Langseth -@Langseth_mopupgrowth_2021 for requests made during the August 17 review) but are also described herein so as to have a single source of information about quillback rockfish. Two additional requests were made at the June 21-22, 2021 meeting for i) updated California catch values and ii) estimating $L_{\infty}$ and $k$, but these were already addressed in the original sensitivity explorations, so are not repeated again. The model explorations to address the new requests were as follows:

\begin{enumerate}
\setcounter{enumi}{14}
   
  \item Add the length data from the historical onboard commercial passenger fishing vessels (CPFV) surveys from the 1980s and 1990s northern California survey conducted by CDFW.

  \item Evaluate alternative selectivity time blocking based on the timing of depth restrictions from 2001-present. In particular add a time block (allowing for dome-shaped selectivity) starting in 2001 and consider additional time blocks. Numerous sensitivity scenarios were explored to adddress this request including:
  
  \begin{enumerate}
  
  \item Blocking recreational selectivity from 1916-2000 assuming asymptotic selectivity, and 2001-2020 allowing for dome-shaped selectivity (due to depth restrictions starting in 2001).
  
  \item Blocking recreational selectivity from 1916-2000 assuming asymptotic selectivity, 2001-2016 allowing for dome-shaped selectivity, and 2017-2020 allowing for dome-shaped selectivity (due to depth restrictions starting in 2001 and a relaxation of those restrictions starting in 2017). For this sensitivity, the selectivity parameter (parameter 2) controlling the width of the peak hit its lower bound, which was resolved by fixing this parameter at its lower bound.
  
  \item Blocking selectivity from 1916-2000 assuming asymptotic selectivity, 2001-2002 allowing for dome-shaped selectivity, 2003-2007 allowing for dome-shaped selectivity, 2008-2016 allowing for dome-shaped selectivity, and 2017-2020 allowing for dome-shaped selectivity (due to depth restrictions starting in 2001, changes in the percent of area open to fishing in 2003 and again in 2008, and a relaxation of depth restrictions starting in 2017).
  
  \item Blocking selectivity from 1916-2000 assuming asymptotic selectivity, 2001-2004 allowing for dome-shaped selectivity, and 2005-2020 allowing for dome-shaped selectivity (due to depth restrictions starting in 2001, and a noticeable change in mean length in 2005).
  
  \item Blocking selectivity from 1916-2000 assuming asymptotic selectivity, 2001-2004 allowing for dome-shaped selectivity, 2005-2016 allowing for dome-shaped selectivity, and 2017-2020 allowing for dome-shaped selectivity (due to depth restrictions starting in 2001, a noticeable change in mean length in 2005, and a relaxation of depth restrictions starting in 2017).
  
  \item Blocking recreational selectivity from 1916-2000 assuming asymptotic selectivity, and 2001-2020 allowing for dome-shaped selectivity with the new CPFV length data (same as in item 16a above but with data from item 15 also included).
  
  \item Blocking recreational and commercial selectivity from 1916-2000 assuming asymptotic selectivity, 2001-2016 allowing for dome-shaped selectivity, and 2017-2020 allowing for dome-shaped selectivity (same as in item 16b above but with commercial selectivity as well).
  
  \item Blocking recreational and commercial selectivity from 1916-2000 assuming asymptotic selectivity, and 2001-2020 allowing for dome-shaped selectivity (same as in item 16a above but with commercial selectivity as well).
  
  \end{enumerate}

\end{enumerate}
  
The data explorations done outside the model to address the new requests were as follows:

\begin{enumerate}
\setcounter{enumi}{16}

  \item Age otoliths and use corresponding lengths from samples collected in California and compare results to the growth curve from samples collected in Oregon and Washington. Comparisons were done external to the stock assessment model.

\end{enumerate}

Additional length data for quillback rockfish were provided by California Department of Fish and Wildlife (CDFW) on July 12, 2021. These data were collected by observers onboard CPFV fishing in central California (@Reilly1998) from 1987-1998, and were not available for use in the base model that was reviewed and adopted in the June GFSC meeting. A total of 753 additional length observations for the recreational fleet from 1987-1998 (Table \ref{tab:debWV-len-data}) were added for this sensitivity. Length distributions from the new data were generally similar to existing length distributions within the adopted base model (Figure \ref{fig:sens-debWV-comp}). Given the use of new data, a scenario with and without data weighting was run. 

Likelihood values and estimates of key parameters from each additional sensitivity to address review requests based on internal model explorations (i.e. all but growth explorations) are available in Table \ref{tab:review-sensitivities}. Plots of the estimated time-series of spawning output, relative spawning output, and recruitment are shown in Figures \ref{fig:review-sens-ssb}, \ref{fig:review-sens-depl}, and \ref{fig:review-sens-recdev}, respectively.

Adding the new length data resulted in lower estimates of initial spawning output and recent spawning output compared to the adopted base model, and resulted in a slightly more depleted stock. This sensitivity did not suggest that important information was missing from the base model to warrant a change to the base model at the time of review, but it was recommended to explore use of the data for future assessments. The additional explorations on selectivity showed limited support for the additional complexity in blocking selectivity. Changes to both the recreational and commercial selectivity resulted in larger estimates of initial spawning output, and in the case of blocking both fleets at 2001 and 2017, lower estimates of recent spawning output and depletion. For all explorations, depletion remained below the management limit, thus estimates of status were robust to changes in selectivity blocks and form and were not affected by the addition of CPFV length data.

To address the requests regarding additional age data, CDFW provided otoliths from 35 quillback rockfish collected from the commercial (N = 6) and recreational (N = 29) fisheries, sampled nearly exclusively from Crescent City, California. In addition, 48 otoliths from CCFRP sampling near the Farallon Islands were provided. An additional 39 otoliths from port sampling efforts were provided by SWFSC staff, as were 123 otoliths from the Abrams collection housed at the SWFSC. Otoliths were sent to the NWFSC's aging lab in Newport, Oregon. Tables for the number of new otoliths by year (Table \ref{tab:age-year}) and by length bin (Table \ref{tab:age-bins}) are provided. These tables include the numbers at length from otoliths in the Abrams collection, which were not yet aged by the mop-up review, and show similar sized fish compared to those sources aged.

Length and age from the new samples were overlaid onto original length and age from samples used in the base model. Twenty-one samples from California were already available from the WCGBTS (Table \ref{tab:len-at-age-samps}) and were included within the growth curve used for the base model (red circles in Figure \ref{fig:review-length-age}). Of these samples, only 2 were less than 5 years, and none over 40 years. The age range of the 122 new California samples (blue and yellow circles in Figure \ref{fig:review-length-age}) was 4 - 51, with one age 4 sample, and two samples over 40 years (41 and 51). After extensive exploration, the paucity of young California fish to inform $K$ and $L0$ suggests the data are inconclusive at this time to robustly estimate a separate California-specific growth curve, and more data, particularly of young but also old fish would help inform whether growth in California differs from Washington and Oregon.  


### Unresolved Problems and Major Uncertainties

A primary uncertainty for the California quillback rockfish model is in treatment of growth parameters. The fixed value for k for quillback rockfish is on the higher end of other published studies, ranging between 0.06-0.19, and results in a low $M$/$k$ ratio, but one within the range of Beverton [-@Beverton_1992] for Sebastes. Profiles and sensitivities for $L_{\infty}$ and $k$ suggest estimating these parameters is possible, both separately and together, and result in estimates of $k$ nearer to the middle of the range of literature values and estimates of $L_{\infty}$ near to the fixed value. The choice also matters in the sense that estimating growth parameters results in a different stock status compared to the base model. Despite well defined profiles for $k$ and $L_{\infty}$, we decided to keep the fixed values in the base model given the relatively limited length composition data, concerns over whether length data on its own without age data can inform $k$, that the curve of estimated $k$ and $L_{\infty}$ values poorly fit the age and length data, and that growth estimates used in the model were based on data with young fish from the surveys to inform the estimate of $k$. New California age data did not resolve the uncertainty around growth. Current California data were insufficient to robustly estimate a separate California-specific length-age relationship given the limited sample size of young quillback rockfish from California. It is possible that more data would support a growth pattern in California that is similar to that shown by the additional data and thereby different than Oregon/Washington, but current data are too sparse to reliably estimate such a curve at this time. California growth remains an uncertainty that needs additional data to resolve. 

Variation in recruitment deviations remains an unresolved problem. Recruitment deviations in the 1980s and 1990s were highly variable, and variance was higher than the assumed value for ${\sigma}_R$. We explored numerous ways to account for this, with the only solution reducing recruitment deviations to below the value of ${\sigma}_R$ was by reducing the variability in size at older ages to very small values (~0.01). Under such a scenario, the trajectory of the population was very similar to the base model as was the pattern of stronger than average recruitment deviations in the 1980s and 1990s followed by weaker than average recruitment deviations in the 2000s. Consequently, this remains an unresolved problem that does not appear to greatly affect model results.

Lastly, catches of quillback rockfish were particularly high in a few years for both the recreational and commercial fleets. Although not affecting estimates of depletion, averaging out these high years of catches affected model scale and therefore estimates of sustainable yield. Changes to catches affecting model scale is true of all models that assume catch is well known, however for quillback rockfish in California the magnitude of the reduction in catch for these years was approximately 20 percent of the total removals. Better understanding the factors contributing to these high catches as well as potential resolutions, should they be needed, would aid in ensuring catch time series and resulting estimates of sustainable yield are accurate.  



<!--chapter:end:34diagnostics.Rmd-->

# Management 

## Reference Points

Reference points were calculated using the estimated selectivity and catch distributions among fleets in the most recent year of the model (2020, Table \ref{tab:referenceES}). Sustainable total yields  were 8.41 mt when using an $SPR_{50\%}$ reference harvest rate. The spawning output equivalent to 40 percent of the unfished spawning output ($SB_{40\%}$) was 24.58 millions of eggs. 

The 2021 spawning output relative to unfished equilibrium spawning output is below the threshold of 25 percent of unfished spawning output (Figure \ref{fig:depl}). The fishing intensity, $1-SPR$, has been above the harvest rate limit ($SPR_{50\%}$) in all years but four years from 1975-2009, and in all but three years since (Table \ref{tab:timeseries} and Figure \ref{fig:1-spr}). Figure \ref{fig:phase-plot} shows the phase plot of relative spawning output and fishing intensity. Table \ref{tab:referenceES} shows the full suite of estimated reference points for the base model and Figure \ref{fig:yield} shows the equilibrium curve based on a steepness value fixed at 0.72.

## Harvest Projections and Decision Tables

A ten year projection of the base model was estimated for years 2023-2032, with catches equal to the estimated Annual Catch Limit (ACL), which is based on the Acceptable Biological Catch (ABC) using the category 2 time-varying sigma and $P^*$ = 0.45 and the 40-10 harvest control rule, for years 2023-2032 (Table \ref{tab:project}). The removals in 2021 and 2022 were as specified by the PFMC Groundfish Management Team (GMT, personal communication). Removals in 2021 were set based on the combined total removals averaged from 2017-2019, and the removals in 2022 were set based on the trend in catches from 2017-2021 adjusted for updated 2022 management measures. The removals were apportioned to recreational and commercial catches based on the average proportion from 2017-2019 that each fleet contributed to the total catch. 

The axis of uncertainty for the decision table was based on a low and high state of nature for alternative values of natural mortality ($M$). Following guidance from the TOR, the 12.5 and 87.5 percentiles (i.e. 1.15 standard deviations) of spawning output in 2021, based on the uncertainty around the spawning output in 2021 ($\sigma$ = 0.39), were used to determine the values of $M$ corresponding to the states of nature. Once the values of 2021 spawning output at the 12.5 and 87.5 percentiles were identified, a search across natural mortality values was done to obtain the identified spawning output values. The values of $M$ corresponding to the low and high states of nature were 0.0464 (low) and 0.0744 (high). 

The same catch values from the base model projections were applied to the low and high states of nature to provide a range of projected catch quantities given alternative assumptions for $M$ (Table \ref{tab:decision-table}). Across alternative states, the fraction of unfished at the end of the 10 year projection period ranged 0.12 - 0.39. Only under the high state of nature did the fraction of unfished go above the management limit after 10 years, and nearly reached the management target. The fraction of unfished for the base state of nature was near the management limit after 10 years.     

<!-- Evaluation of Scientific Uncertainty -->


## Evaluation of Scientific Uncertainty

The estimated uncertainty in the base model around the 2021 spawning output is $\sigma$ = 0.39 and the uncertainty in the base model around the 2021 OFL is $\sigma$ = 0.37. The estimated model uncertainty was less than the category 2 groundfish data moderate assessment default value of  $\sigma$ = 1.0. 

# Research and Data Needs

The ability to estimate additional process and biological parameters for quillback rockfish was limited by data.  Collecting the following data would be beneficial to future assessments of the stock:

\begin{itemize}

  \item At the time of the assessment due to issues in California data in PacFIN (i.e., condition code) length samples landed live vs. dead from the commercial were unable to be identified. The ability to examine sample sizes and lengths from each type of landings would allow for future assessments to account for a greater range of commercial fishing behavior.
  
  \item Improved understanding of where recreational fishing is commonly occurring (areas and depths) and the range of sizes available by depth would better inform the selectivity form, which currently is the near the shape for maturity.  

	\item Age data were predominantly from Oregon and Washington waters. Collecting length and otolith samples from recreational and commercial catches in California would result in samples from the entire U.S. West Coast informing growth. Otoliths from the WCGBTS survey would also help inform growth. California otoliths identified and aged during model reivews were insufficient to robustly estimate a separate California-specific length-age relationship given the limited sample size of young quillback rockfish from California. More data, particularly of young and old fish, are needed to be able to robustly estimate a California-specific growth curve and confirm whether growth of quillback rockfish differs between California and Washington and Oregon. 
	
	\item Recruitment patterns showed lower than average recruitment in the 2000s. Additional data to support such patterns in recruitment would provide additional support for model estimates. 
	
	\item Catches of quillback rockfish were particularly high in a few years for both the recreational and commercial fleet. Better understanding the factors contributing to these high catches as well as potential resolutions, should they be needed, would aid in ensuring catch time series are accurate.  
	
\end{itemize}



<!--chapter:end:40management.Rmd-->

<!-- Acknowledgments -->

# Acknowledgments
Many people were instrumental in the successful completion of this assessment and their contribution is greatly appreciated. We are very grateful to all the agers at WDFW, ODFW, and the CAP lab for their hard work reading numerous otoliths and availability to answer questions when needed. Jason Jannot and Kayleigh Sommers assisted with data from the WCGOP and entertained our many questions. We would like to acknowledge the data team and their dedication to improving the assessments we do. John Harms, Brenda Erwin, and Jason Edwards were incredibly helpful in understanding the available data and resolving questions about its interpretation and use. All of the data moderate assessments this year were greatly benefited by the numerous individuals who took the time to participate in the pre-assessment data webinar. Gerry Richter, Merit McCrea, Louis Zimm, Bill James, and Daniel Platt provided insight to the data and the complexities of the commercial and recreational fisheries off the West Coast of the U.S. which were essential in the production of all of the quillback rockfish assessments conducted this year.

<!--chapter:end:41acknowledgments.Rmd-->

\clearpage

# References
<!-- If you want to references to appear somewhere before the end, add: -->
<div id="refs"></div>
<!-- where you want it to appear -->
<!-- The following sets the appropriate indentation for the references
  but it cannot be used with bookdown and the make file because it leads
  to a bad pdf.
\noindent
\vspace{-2em}
\setlength{\parindent}{-0.2in}
\setlength{\leftskip}{0.2in}
\setlength{\parskip}{8pt}
 -->

<!--chapter:end:49bibliography.Rmd-->

\clearpage
# Tables

<!-- ======================================================= -->
<!-- ***************    Catches      *********************** --> 
<!-- ======================================================= -->

<!-- tab:catch -->
\input{C:/Users/Brian.Langseth/Desktop/ca/write_up/tex_tables/Catches_All_Years.tex}

\newpage

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.57cm}>{\raggedright\arraybackslash}p{1.57cm}>{\raggedright\arraybackslash}p{1.57cm}>{\raggedright\arraybackslash}p{1.57cm}>{\raggedright\arraybackslash}p{1.57cm}>{\raggedright\arraybackslash}p{1.57cm}}
\caption{(\#tab:ofl)The OFL and ACL for quillback rockfish within the Minor Nearshore Rockfish North and South complexes, the ACL allocated to California across both complexes, and the total removals.}\\
\toprule
Year & OFL North & ACL North & OFL South & ACL South & CA ACL & CA Removals\\
\midrule
\endfirsthead
\caption[]{(\#tab:ofl)The OFL and ACL for quillback rockfish within the Minor Nearshore Rockfish North and South complexes, the ACL allocated to California across both complexes, and the total removals. \textit{(continued)}}\\
\toprule
Year & OFL North & ACL North & OFL South & ACL South & CA ACL & CA Removals\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2011 & 8.70 & 7.26 & 6.35 & 5.30 & 7.38 & 5.45\\
2012 & 8.70 & 7.26 & 6.35 & 5.30 & 7.38 & 7.99\\
2013 & 7.37 & 6.15 & 5.39 & 4.49 & 6.26 & 3.57\\
2014 & 7.37 & 6.15 & 5.39 & 4.49 & 6.26 & 2.97\\
2015 & 7.37 & 6.15 & 5.39 & 4.49 & 6.26 & 8.55\\
2016 & 7.37 & 6.15 & 5.39 & 4.49 & 6.26 & 9.46\\
2017 & 7.37 & 6.15 & 5.39 & 4.49 & 6.26 & 12.52\\
2018 & 7.37 & 6.15 & 5.39 & 4.49 & 6.26 & 12.84\\
2019 & 7.37 & 6.15 & 5.39 & 4.49 & 6.26 & 16.02\\
2020 & 7.37 & 6.15 & 5.39 & 4.49 & 6.26 & 12.34\\*
\end{longtable}
\endgroup{}
\endgroup{}

\newpage

<!-- ======================================================= -->
<!-- ***************       Data      *********************** --> 
<!-- ======================================================= -->


\input{C:/Users/Brian.Langseth/Desktop/ca/write_up/tex_tables/CA_Samples_Feb2021.tex}

\newpage


\input{C:/Users/Brian.Langseth/Desktop/ca/write_up/tex_tables/ca_rec_samples.tex}

\newpage


\input{C:/Users/Brian.Langseth/Desktop/ca/write_up/tex_tables/len_at_weight_data.tex}

\newpage


\input{C:/Users/Brian.Langseth/Desktop/ca/write_up/tex_tables/len_at_age_data.tex}

\newpage



<!-- ======================================================= -->
<!-- ***************    Biology      *********************** --> 
<!-- ======================================================= -->

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2.2cm}>{\raggedright\arraybackslash}p{2.2cm}>{\raggedright\arraybackslash}p{2.2cm}>{\raggedright\arraybackslash}p{2.2cm}}
\caption{(\#tab:growth-tab)Age, length, weight, maturity, and spawning output by age (product of maturity and fecundity) at the start of the year. Output for ages 51-95 is truncated as these ages have the same length, weight, maturity, and spawning output as at age 50.}\\
\toprule
Age & Length (cm) & Weight (kg) & Maturity & Spawning Output\\
\midrule
\endfirsthead
\caption[]{(\#tab:growth-tab)Age, length, weight, maturity, and spawning output by age (product of maturity and fecundity) at the start of the year. Output for ages 51-95 is truncated as these ages have the same length, weight, maturity, and spawning output as at age 50. \textit{(continued)}}\\
\toprule
Age & Length (cm) & Weight (kg) & Maturity & Spawning Output\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
0 & 4.00 & 0.00 & 0.00 & 0.00\\
1 & 8.23 & 0.01 & 0.00 & 0.00\\
2 & 14.51 & 0.06 & 0.00 & 0.00\\
3 & 19.66 & 0.16 & 0.00 & 0.00\\
4 & 23.88 & 0.29 & 0.05 & 0.00\\
5 & 27.34 & 0.44 & 0.30 & 0.03\\
6 & 30.17 & 0.59 & 0.60 & 0.09\\
7 & 32.49 & 0.73 & 0.79 & 0.14\\
8 & 34.40 & 0.87 & 0.89 & 0.19\\
9 & 35.96 & 1.00 & 0.94 & 0.23\\
10 & 37.23 & 1.11 & 0.97 & 0.27\\
11 & 38.28 & 1.20 & 0.98 & 0.30\\
12 & 39.14 & 1.29 & 0.98 & 0.32\\
13 & 39.84 & 1.36 & 0.99 & 0.35\\
14 & 40.42 & 1.42 & 1.00 & 0.37\\
15 & 40.89 & 1.47 & 1.00 & 0.38\\
16 & 41.28 & 1.51 & 1.00 & 0.40\\
17 & 41.60 & 1.55 & 1.00 & 0.41\\
18 & 41.86 & 1.58 & 1.00 & 0.42\\
19 & 42.07 & 1.60 & 1.00 & 0.42\\
20 & 42.25 & 1.62 & 1.00 & 0.43\\
21 & 42.39 & 1.64 & 1.00 & 0.44\\
22 & 42.51 & 1.65 & 1.00 & 0.44\\
23 & 42.60 & 1.66 & 1.00 & 0.44\\
24 & 42.68 & 1.67 & 1.00 & 0.45\\
25 & 42.75 & 1.68 & 1.00 & 0.45\\
26 & 42.80 & 1.68 & 1.00 & 0.45\\
27 & 42.84 & 1.69 & 1.00 & 0.45\\
28 & 42.88 & 1.69 & 1.00 & 0.46\\
29 & 42.91 & 1.70 & 1.00 & 0.46\\
30 & 42.93 & 1.70 & 1.00 & 0.46\\
31 & 42.95 & 1.70 & 1.00 & 0.46\\
32 & 42.97 & 1.70 & 1.00 & 0.46\\
33 & 42.98 & 1.71 & 1.00 & 0.46\\
34 & 42.99 & 1.71 & 1.00 & 0.46\\
35 & 43.00 & 1.71 & 1.00 & 0.46\\
36 & 43.01 & 1.71 & 1.00 & 0.46\\
37 & 43.01 & 1.71 & 1.00 & 0.46\\
38 & 43.02 & 1.71 & 1.00 & 0.46\\
39 & 43.02 & 1.71 & 1.00 & 0.46\\
40 & 43.03 & 1.71 & 1.00 & 0.46\\
41 & 43.03 & 1.71 & 1.00 & 0.46\\
42 & 43.03 & 1.71 & 1.00 & 0.46\\
43 & 43.03 & 1.71 & 1.00 & 0.46\\
44 & 43.03 & 1.71 & 1.00 & 0.46\\
45 & 43.03 & 1.71 & 1.00 & 0.46\\
46 & 43.04 & 1.71 & 1.00 & 0.46\\
47 & 43.04 & 1.71 & 1.00 & 0.46\\
48 & 43.04 & 1.71 & 1.00 & 0.46\\
49 & 43.04 & 1.71 & 1.00 & 0.46\\
50 & 43.04 & 1.71 & 1.00 & 0.46\\*
\end{longtable}
\endgroup{}
\endgroup{}

\newpage

<!-- ======================================================= -->
<!-- ***************  Data Weights   *********************** --> 
<!-- ======================================================= -->


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}}
\caption{(\#tab:dw)Data weights applied by each alternative data weighting method. The Dirichlet Multinomial weight is theta/(1+theta).}\\
\toprule
Method & Commercial Lengths & Recreational Lengths\\
\midrule
\endfirsthead
\caption[]{(\#tab:dw)Data weights applied by each alternative data weighting method. The Dirichlet Multinomial weight is theta/(1+theta). \textit{(continued)}}\\
\toprule
Method & Commercial Lengths & Recreational Lengths\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
McAllister-Ianelli & 0.3826330 & 0.1243430\\
Francis & 0.2778310 & 0.0975810\\
Dirichlet Multinomial & 0.9819261 & 0.5121594\\*
\end{longtable}
\endgroup{}
\endgroup{}


<!-- ======================================================= -->
<!-- ***********   Model Parameters     ******************** --> 
<!-- ======================================================= -->


\begingroup\fontsize{9}{11}\selectfont

\begin{landscape}\begingroup\fontsize{9}{11}\selectfont

\begin{longtable}[t]{>{\raggedright\arraybackslash}p{6cm}lllll>{\raggedright\arraybackslash}p{4cm}}
\caption{(\#tab:params)List of parameters used in the base model, including estimated values and standard deviations (SD), bounds (minimum and maximum), estimation phase (negative values not estimated), status (indicates if parameters are near bounds), and prior type information (mean and SD).}\\
\toprule
Parameter & Value & Phase & Bounds & Status & SD & Prior (Exp.Val, SD)\\
\midrule
\endfirsthead
\caption[]{(\#tab:params)List of parameters used in the base model, including estimated values and standard deviations (SD), bounds (minimum and maximum), estimation phase (negative values not estimated), status (indicates if parameters are near bounds), and prior type information (mean and SD). \textit{(continued)}}\\
\toprule
Parameter & Value & Phase & Bounds & Status & SD & Prior (Exp.Val, SD)\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
NatM p 1 Fem GP 1 & 0.057 & -2 & (0.01, 0.2) & NA & NA & Log Norm (-2.8647, 0.438)\\
L at Amin Fem GP 1 & 8.230 & -2 & (0, 10) & NA & NA & None\\
L at Amax Fem GP 1 & 43.040 & -2 & (25, 60) & NA & NA & None\\
VonBert K Fem GP 1 & 0.199 & -2 & (0.03, 0.3) & NA & NA & None\\
CV young Fem GP 1 & 0.100 & -2 & (0.01, 1) & NA & NA & None\\
CV old Fem GP 1 & 0.100 & -2 & (0.01, 1) & NA & NA & None\\
Wtlen 1 Fem GP 1 & 1.963e-05 & -9 & (0, 0.1) & NA & NA & None\\
Wtlen 2 Fem GP 1 & 3.016 & -9 & (2, 4) & NA & NA & None\\
Mat50\% Fem GP 1 & 29.230 & -9 & (10, 60) & NA & NA & None\\
Mat slope Fem GP 1 & -0.800 & -9 & (-2, 0) & NA & NA & None\\
Eggs scalar Fem GP 1 & 0.000 & -9 & (-3, 3) & NA & NA & None\\
Eggs exp len Fem GP 1 & 3.702 & -9 & (0, 6) & NA & NA & None\\
CohortGrowDev & 1.000 & -9 & (0, 1) & NA & NA & None\\
FracFemale GP 1 & 0.500 & -9 & (0.01, 0.99) & NA & NA & None\\
SR LN(R0) & 3.168 & 1 & (1, 20) & OK & 0.0770772 & None\\
SR BH steep & 0.720 & -7 & (0.2, 1) & NA & NA & Full Beta (0.72, 0.158)\\
SR sigmaR & 0.600 & -99 & (0.15, 0.9) & NA & NA & None\\
SR regime & 0.000 & -99 & (-2, 2) & NA & NA & None\\
SR autocorr & 0.000 & -99 & (0, 0) & NA & NA & None\\
Early RecrDev 1940 & -0.084 & 5 & (-5, 5) & act & 0.5765370 & dev (NA, NA)\\
Early RecrDev 1941 & -0.087 & 5 & (-5, 5) & act & 0.5755490 & dev (NA, NA)\\
Early RecrDev 1942 & -0.091 & 5 & (-5, 5) & act & 0.5745270 & dev (NA, NA)\\
Early RecrDev 1943 & -0.095 & 5 & (-5, 5) & act & 0.5734730 & dev (NA, NA)\\
Early RecrDev 1944 & -0.099 & 5 & (-5, 5) & act & 0.5723900 & dev (NA, NA)\\
Early RecrDev 1945 & -0.104 & 5 & (-5, 5) & act & 0.5712770 & dev (NA, NA)\\
Early RecrDev 1946 & -0.108 & 5 & (-5, 5) & act & 0.5701370 & dev (NA, NA)\\
Early RecrDev 1947 & -0.113 & 5 & (-5, 5) & act & 0.5689660 & dev (NA, NA)\\
Early RecrDev 1948 & -0.117 & 5 & (-5, 5) & act & 0.5677500 & dev (NA, NA)\\
Early RecrDev 1949 & -0.122 & 5 & (-5, 5) & act & 0.5665130 & dev (NA, NA)\\
Early RecrDev 1950 & -0.127 & 5 & (-5, 5) & act & 0.5652440 & dev (NA, NA)\\
Early RecrDev 1951 & -0.132 & 5 & (-5, 5) & act & 0.5639410 & dev (NA, NA)\\
Early RecrDev 1952 & -0.138 & 5 & (-5, 5) & act & 0.5626030 & dev (NA, NA)\\
Early RecrDev 1953 & -0.143 & 5 & (-5, 5) & act & 0.5612200 & dev (NA, NA)\\
Early RecrDev 1954 & -0.149 & 5 & (-5, 5) & act & 0.5597900 & dev (NA, NA)\\
Early RecrDev 1955 & -0.155 & 5 & (-5, 5) & act & 0.5583270 & dev (NA, NA)\\
Early RecrDev 1956 & -0.161 & 5 & (-5, 5) & act & 0.5568470 & dev (NA, NA)\\
Early RecrDev 1957 & -0.167 & 5 & (-5, 5) & act & 0.5553640 & dev (NA, NA)\\
Early RecrDev 1958 & -0.173 & 5 & (-5, 5) & act & 0.5538650 & dev (NA, NA)\\
Early RecrDev 1959 & -0.179 & 5 & (-5, 5) & act & 0.5523490 & dev (NA, NA)\\
Early RecrDev 1960 & -0.186 & 5 & (-5, 5) & act & 0.5507760 & dev (NA, NA)\\
Early RecrDev 1961 & -0.193 & 5 & (-5, 5) & act & 0.5491360 & dev (NA, NA)\\
Early RecrDev 1962 & -0.201 & 5 & (-5, 5) & act & 0.5474030 & dev (NA, NA)\\
Early RecrDev 1963 & -0.209 & 5 & (-5, 5) & act & 0.5455740 & dev (NA, NA)\\
Early RecrDev 1964 & -0.217 & 5 & (-5, 5) & act & 0.5436460 & dev (NA, NA)\\
Early RecrDev 1965 & -0.227 & 5 & (-5, 5) & act & 0.5415690 & dev (NA, NA)\\
Early RecrDev 1966 & -0.238 & 5 & (-5, 5) & act & 0.5393220 & dev (NA, NA)\\
Early RecrDev 1967 & -0.249 & 5 & (-5, 5) & act & 0.5368470 & dev (NA, NA)\\
Early RecrDev 1968 & -0.263 & 5 & (-5, 5) & act & 0.5341080 & dev (NA, NA)\\
Early RecrDev 1969 & -0.278 & 5 & (-5, 5) & act & 0.5310710 & dev (NA, NA)\\
Early RecrDev 1970 & -0.294 & 5 & (-5, 5) & act & 0.5277930 & dev (NA, NA)\\
Early RecrDev 1971 & -0.311 & 5 & (-5, 5) & act & 0.5244520 & dev (NA, NA)\\
Early RecrDev 1972 & -0.327 & 5 & (-5, 5) & act & 0.5212750 & dev (NA, NA)\\
Early RecrDev 1973 & -0.338 & 5 & (-5, 5) & act & 0.5188300 & dev (NA, NA)\\
Early RecrDev 1974 & -0.337 & 5 & (-5, 5) & act & 0.5176710 & dev (NA, NA)\\
Early RecrDev 1975 & -0.318 & 5 & (-5, 5) & act & 0.5175340 & dev (NA, NA)\\
Early RecrDev 1976 & -0.309 & 5 & (-5, 5) & act & 0.5173650 & dev (NA, NA)\\
Early RecrDev 1977 & -0.312 & 5 & (-5, 5) & act & 0.5172770 & dev (NA, NA)\\
Main RecrDev 1978 & -0.534 & 2 & (-5, 5) & act & 0.5332130 & dev (NA, NA)\\
Main RecrDev 1979 & -0.432 & 2 & (-5, 5) & act & 0.5476160 & dev (NA, NA)\\
Main RecrDev 1980 & -0.280 & 2 & (-5, 5) & act & 0.5697850 & dev (NA, NA)\\
Main RecrDev 1981 & -0.220 & 2 & (-5, 5) & act & 0.5818810 & dev (NA, NA)\\
Main RecrDev 1982 & -0.259 & 2 & (-5, 5) & act & 0.5866670 & dev (NA, NA)\\
Main RecrDev 1983 & -0.114 & 2 & (-5, 5) & act & 0.6362140 & dev (NA, NA)\\
Main RecrDev 1984 & 0.209 & 2 & (-5, 5) & act & 0.7592310 & dev (NA, NA)\\
Main RecrDev 1985 & 0.424 & 2 & (-5, 5) & act & 0.8586760 & dev (NA, NA)\\
Main RecrDev 1986 & 0.243 & 2 & (-5, 5) & act & 0.8878220 & dev (NA, NA)\\
Main RecrDev 1987 & 1.320 & 2 & (-5, 5) & act & 0.6410710 & dev (NA, NA)\\
Main RecrDev 1988 & 0.142 & 2 & (-5, 5) & act & 0.7857140 & dev (NA, NA)\\
Main RecrDev 1989 & 0.081 & 2 & (-5, 5) & act & 0.6363950 & dev (NA, NA)\\
Main RecrDev 1990 & 0.045 & 2 & (-5, 5) & act & 0.6687210 & dev (NA, NA)\\
Main RecrDev 1991 & 0.603 & 2 & (-5, 5) & act & 0.7970220 & dev (NA, NA)\\
Main RecrDev 1992 & 0.719 & 2 & (-5, 5) & act & 0.9165650 & dev (NA, NA)\\
Main RecrDev 1993 & 0.455 & 2 & (-5, 5) & act & 0.9926700 & dev (NA, NA)\\
Main RecrDev 1994 & 1.081 & 2 & (-5, 5) & act & 0.7119440 & dev (NA, NA)\\
Main RecrDev 1995 & 0.341 & 2 & (-5, 5) & act & 0.9701030 & dev (NA, NA)\\
Main RecrDev 1996 & 1.677 & 2 & (-5, 5) & act & 0.4381810 & dev (NA, NA)\\
Main RecrDev 1997 & -0.015 & 2 & (-5, 5) & act & 0.7002820 & dev (NA, NA)\\
Main RecrDev 1998 & 0.087 & 2 & (-5, 5) & act & 0.7606940 & dev (NA, NA)\\
Main RecrDev 1999 & 1.970 & 2 & (-5, 5) & act & 0.3034810 & dev (NA, NA)\\
Main RecrDev 2000 & -0.225 & 2 & (-5, 5) & act & 0.6211900 & dev (NA, NA)\\
Main RecrDev 2001 & -0.393 & 2 & (-5, 5) & act & 0.5500170 & dev (NA, NA)\\
Main RecrDev 2002 & -0.474 & 2 & (-5, 5) & act & 0.5208930 & dev (NA, NA)\\
Main RecrDev 2003 & -0.349 & 2 & (-5, 5) & act & 0.5245180 & dev (NA, NA)\\
Main RecrDev 2004 & -0.062 & 2 & (-5, 5) & act & 0.5431810 & dev (NA, NA)\\
Main RecrDev 2005 & 0.038 & 2 & (-5, 5) & act & 0.5014010 & dev (NA, NA)\\
Main RecrDev 2006 & -0.521 & 2 & (-5, 5) & act & 0.5020880 & dev (NA, NA)\\
Main RecrDev 2007 & -0.789 & 2 & (-5, 5) & act & 0.4708870 & dev (NA, NA)\\
Main RecrDev 2008 & -0.826 & 2 & (-5, 5) & act & 0.4649180 & dev (NA, NA)\\
Main RecrDev 2009 & -0.700 & 2 & (-5, 5) & act & 0.4845610 & dev (NA, NA)\\
Main RecrDev 2010 & -0.277 & 2 & (-5, 5) & act & 0.5397700 & dev (NA, NA)\\
Main RecrDev 2011 & 0.533 & 2 & (-5, 5) & act & 0.4310130 & dev (NA, NA)\\
Main RecrDev 2012 & -0.100 & 2 & (-5, 5) & act & 0.5199760 & dev (NA, NA)\\
Main RecrDev 2013 & -0.606 & 2 & (-5, 5) & act & 0.4766590 & dev (NA, NA)\\
Main RecrDev 2014 & -0.887 & 2 & (-5, 5) & act & 0.4600950 & dev (NA, NA)\\
Main RecrDev 2015 & -0.889 & 2 & (-5, 5) & act & 0.4712850 & dev (NA, NA)\\
Main RecrDev 2016 & -0.632 & 2 & (-5, 5) & act & 0.5173470 & dev (NA, NA)\\
Main RecrDev 2017 & -0.385 & 2 & (-5, 5) & act & 0.5736820 & dev (NA, NA)\\
Late RecrDev 2018 & -0.005 & 6 & (-5, 5) & act & 0.5983400 & dev (NA, NA)\\
Late RecrDev 2019 & 0.000 & 6 & (-5, 5) & act & 0.5999750 & dev (NA, NA)\\
Late RecrDev 2020 & 0.000 & 6 & (-5, 5) & act & 0.6000000 & dev (NA, NA)\\
Size DblN peak CA Commercial(1) & 41.568 & 2 & (15, 50) & OK & 1.8873100 & None\\
Size DblN top logit CA Commercial(1) & -1.274 & -2 & (-7, 7) & NA & NA & None\\
Size DblN ascend se CA Commercial(1) & 4.708 & 3 & (-10, 10) & OK & 0.2086120 & None\\
Size DblN descend se CA Commercial(1) & -0.517 & -4 & (-10, 10) & NA & NA & None\\
Size DblN start logit CA Commercial(1) & -20.000 & -9 & (-20, 30) & NA & NA & None\\
Size DblN end logit CA Commercial(1) & 10.000 & -3 & (-10, 10) & NA & NA & None\\
Size DblN peak CA Recreational(2) & 33.365 & 2 & (15, 50) & OK & 1.0225400 & None\\
Size DblN top logit CA Recreational(2) & -0.364 & -2 & (-7, 7) & NA & NA & None\\
Size DblN ascend se CA Recreational(2) & 3.946 & 3 & (-10, 10) & OK & 0.2288940 & None\\
Size DblN descend se CA Recreational(2) & -0.207 & -4 & (-10, 10) & NA & NA & None\\
Size DblN start logit CA Recreational(2) & -20.000 & -9 & (-20, 30) & NA & NA & None\\
Size DblN end logit CA Recreational(2) & 10.000 & -3 & (-10, 10) & NA & NA & None\\*
\end{longtable}
\endgroup{}
\end{landscape}
\endgroup{}

<!-- ======================================================= -->
<!-- ***********    Like Contributions  ******************** --> 
<!-- ======================================================= -->

<!-- tab:likes -->
\include{tex_tables/likelihoods.tex}


<!-- ======================================================= -->
<!-- ***********    Reference Points  ******************** --> 
<!-- ======================================================= -->

<!-- tab:referenceES -->
\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{r>{\centering\arraybackslash}p{2cm}>{\centering\arraybackslash}p{2cm}>{\centering\arraybackslash}p{2cm}}
\caption{(\#tab:referenceES)Summary of reference points and management quantities, including estimates of
the 95 percent intervals.}\\
\toprule
 & Estimate & Lower Interval & Upper Interval\\
\midrule
\endfirsthead
\caption[]{(\#tab:referenceES)Summary of reference points and management quantities, including estimates \textit{(continued)}}\\
\toprule
 & Estimate & Lower Interval & Upper Interval\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
Unfished Spawning Output & 55.08 & 46.76 & 63.4\\
Unfished Age 3+ Biomass (mt) & 443.01 & 376.09 & 509.94\\
Unfished Recruitment (R0) & 23.76 & 20.17 & 27.36\\
Spawning Output (2021) & 7.75 & 1.65 & 13.84\\
Fraction Unfished (2021) & 0.14 & 0.04 & 0.24\\
Reference Points Based SB40\textbackslash{}\% & - & - & -\\
Proxy Spawning Output SB40\textbackslash{}\% & 22.03 & 18.7 & 25.36\\
SPR Resulting in SB40\textbackslash{}\% & 0.46 & 0.46 & 0.46\\
Exploitation Rate Resulting in SB40\textbackslash{}\% & 0.05 & 0.05 & 0.05\\
Yield with SPR Based On SB40\textbackslash{}\% (mt) & 8.8 & 7.49 & 10.11\\
Reference Points Based on SPR Proxy for MSY & - & - & -\\
Proxy Spawning Output (SPR50) & 24.58 & 20.86 & 28.29\\
Exploitation Rate Corresponding to SPR50 & 0.04 & 0.04 & 0.04\\
Yield with SPR50 at SB SPR (mt) & 8.41 & 7.15 & 9.66\\
Reference Points Based on Estimated MSY Values & - & - & -\\
Spawning Output at MSY (SB MSY) & 15.44 & 13.1 & 17.77\\
SPR MSY & 0.35 & 0.35 & 0.35\\
Exploitation Rate Corresponding to SPR MSY & 0.07 & 0.07 & 0.07\\
MSY (mt) & 9.3 & 7.91 & 10.69\\*
\end{longtable}
\endgroup{}
\endgroup{}


<!-- \input{C:/Users/Brian.Langseth/Desktop/ca/write_up/tex_tables/e_ReferencePoints_ES.tex} -->

\newpage


<!-- ======================================================= -->
<!-- ***********       Time Series      ******************** --> 
<!-- ======================================================= -->

<!-- tab:timeseries -->
\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{c>{\centering\arraybackslash}p{1.22cm}>{\centering\arraybackslash}p{1.22cm}>{\centering\arraybackslash}p{1.22cm}>{\centering\arraybackslash}p{1.22cm}>{\centering\arraybackslash}p{1.22cm}>{\centering\arraybackslash}p{1.22cm}>{\centering\arraybackslash}p{1.22cm}>{\centering\arraybackslash}p{1.22cm}}
\caption{(\#tab:timeseries)Time series of population estimates from the base model.}\\
\toprule
Year & Total Biomass (mt) & Spawning Output & Total Biomass 3+ (mt) & Fraction Unfished & Age-0 Recruits & Total Mortality (mt) & 1-SPR & Exploitation Rate\\
\midrule
\endfirsthead
\caption[]{(\#tab:timeseries)Time series of population estimates from the base model. \textit{(continued)}}\\
\toprule
Year & Total Biomass (mt) & Spawning Output & Total Biomass 3+ (mt) & Fraction Unfished & Age-0 Recruits & Total Mortality (mt) & 1-SPR & Exploitation Rate\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
1916 & 444.71 & 55.08 & 443.01 & 1.00 & 23.77 & 0.02 & 0.00 & 0.00\\
1917 & 444.70 & 55.08 & 443.00 & 1.00 & 23.77 & 0.03 & 0.00 & 0.00\\
1918 & 444.67 & 55.08 & 442.97 & 1.00 & 23.77 & 0.07 & 0.00 & 0.00\\
1919 & 444.60 & 55.07 & 442.90 & 1.00 & 23.77 & 0.02 & 0.00 & 0.00\\
1920 & 444.59 & 55.07 & 442.89 & 1.00 & 23.77 & 0.02 & 0.00 & 0.00\\
1921 & 444.57 & 55.06 & 442.87 & 1.00 & 23.77 & 0.03 & 0.00 & 0.00\\
1922 & 444.55 & 55.06 & 442.85 & 1.00 & 23.77 & 0.03 & 0.00 & 0.00\\
1923 & 444.53 & 55.06 & 442.83 & 1.00 & 23.77 & 0.01 & 0.00 & 0.00\\
1924 & 444.53 & 55.06 & 442.83 & 1.00 & 23.77 & 0.02 & 0.00 & 0.00\\
1925 & 444.52 & 55.06 & 442.82 & 1.00 & 23.77 & 0.08 & 0.00 & 0.00\\
1926 & 444.46 & 55.05 & 442.76 & 1.00 & 23.77 & 0.07 & 0.00 & 0.00\\
1927 & 444.40 & 55.04 & 442.70 & 1.00 & 23.77 & 0.14 & 0.01 & 0.00\\
1928 & 444.29 & 55.03 & 442.58 & 1.00 & 23.77 & 0.18 & 0.01 & 0.00\\
1929 & 444.13 & 55.00 & 442.43 & 1.00 & 23.77 & 0.24 & 0.01 & 0.00\\
1930 & 443.92 & 54.98 & 442.22 & 1.00 & 23.76 & 0.32 & 0.02 & 0.00\\
1931 & 443.64 & 54.94 & 441.94 & 1.00 & 23.76 & 0.44 & 0.02 & 0.00\\
1932 & 443.26 & 54.89 & 441.56 & 1.00 & 23.76 & 0.42 & 0.02 & 0.00\\
1933 & 442.91 & 54.85 & 441.21 & 1.00 & 23.76 & 0.42 & 0.02 & 0.00\\
1934 & 442.57 & 54.80 & 440.87 & 0.99 & 23.76 & 0.45 & 0.02 & 0.00\\
1935 & 442.21 & 54.75 & 440.50 & 0.99 & 23.76 & 0.61 & 0.03 & 0.00\\
1936 & 441.71 & 54.69 & 440.01 & 0.99 & 23.75 & 0.64 & 0.03 & 0.00\\
1937 & 441.20 & 54.62 & 439.49 & 0.99 & 23.75 & 0.65 & 0.03 & 0.00\\
1938 & 440.69 & 54.55 & 438.99 & 0.99 & 23.75 & 0.70 & 0.03 & 0.00\\
1939 & 440.15 & 54.48 & 438.45 & 0.99 & 23.74 & 0.63 & 0.03 & 0.00\\
1940 & 439.70 & 54.42 & 438.01 & 0.99 & 21.84 & 0.70 & 0.03 & 0.00\\
1941 & 439.19 & 54.36 & 437.51 & 0.99 & 21.75 & 0.71 & 0.03 & 0.00\\
1942 & 438.59 & 54.30 & 437.03 & 0.99 & 21.67 & 0.44 & 0.02 & 0.00\\
1943 & 438.13 & 54.27 & 436.57 & 0.99 & 21.58 & 0.47 & 0.02 & 0.00\\
1944 & 437.45 & 54.24 & 435.90 & 0.98 & 21.49 & 1.16 & 0.05 & 0.00\\
1945 & 435.93 & 54.10 & 434.39 & 0.98 & 21.39 & 2.59 & 0.11 & 0.01\\
1946 & 432.88 & 53.75 & 431.35 & 0.98 & 21.29 & 2.92 & 0.13 & 0.01\\
1947 & 429.41 & 53.34 & 427.88 & 0.97 & 21.17 & 0.91 & 0.04 & 0.00\\
1948 & 427.78 & 53.15 & 426.26 & 0.96 & 21.07 & 1.86 & 0.09 & 0.00\\
1949 & 425.13 & 52.84 & 423.62 & 0.96 & 20.95 & 1.47 & 0.07 & 0.00\\
1950 & 422.79 & 52.55 & 421.28 & 0.95 & 20.84 & 1.54 & 0.08 & 0.00\\
1951 & 420.32 & 52.25 & 418.82 & 0.95 & 20.72 & 1.98 & 0.10 & 0.00\\
1952 & 417.39 & 51.89 & 415.90 & 0.94 & 20.59 & 1.72 & 0.08 & 0.00\\
1953 & 414.70 & 51.56 & 413.22 & 0.94 & 20.47 & 1.39 & 0.07 & 0.00\\
1954 & 412.33 & 51.27 & 410.86 & 0.93 & 20.34 & 1.92 & 0.09 & 0.00\\
1955 & 409.43 & 50.91 & 407.96 & 0.92 & 20.20 & 1.83 & 0.09 & 0.00\\
1956 & 406.61 & 50.55 & 405.16 & 0.92 & 20.07 & 2.07 & 0.10 & 0.01\\
1957 & 403.57 & 50.17 & 402.13 & 0.91 & 19.93 & 2.08 & 0.10 & 0.01\\
1958 & 400.54 & 49.80 & 399.11 & 0.90 & 19.79 & 3.61 & 0.17 & 0.01\\
1959 & 396.03 & 49.22 & 394.60 & 0.89 & 19.64 & 2.67 & 0.13 & 0.01\\
1960 & 392.48 & 48.78 & 391.07 & 0.89 & 19.49 & 2.21 & 0.11 & 0.01\\
1961 & 389.43 & 48.39 & 388.03 & 0.88 & 19.34 & 1.61 & 0.09 & 0.00\\
1962 & 387.00 & 48.09 & 385.61 & 0.87 & 19.18 & 1.82 & 0.10 & 0.00\\
1963 & 384.38 & 47.76 & 383.00 & 0.87 & 19.01 & 2.74 & 0.14 & 0.01\\
1964 & 380.86 & 47.32 & 379.49 & 0.86 & 18.82 & 2.23 & 0.12 & 0.01\\
1965 & 377.86 & 46.95 & 376.51 & 0.85 & 18.63 & 3.83 & 0.19 & 0.01\\
1966 & 373.31 & 46.38 & 371.97 & 0.84 & 18.41 & 4.29 & 0.21 & 0.01\\
1967 & 368.35 & 45.75 & 367.02 & 0.83 & 18.16 & 4.84 & 0.23 & 0.01\\
1968 & 362.91 & 45.06 & 361.59 & 0.82 & 17.89 & 4.95 & 0.24 & 0.01\\
1969 & 357.42 & 44.37 & 356.12 & 0.81 & 17.59 & 5.47 & 0.27 & 0.02\\
1970 & 351.47 & 43.62 & 350.20 & 0.79 & 17.27 & 7.45 & 0.34 & 0.02\\
1971 & 343.66 & 42.63 & 342.40 & 0.77 & 16.93 & 6.62 & 0.32 & 0.02\\
1972 & 336.76 & 41.75 & 335.53 & 0.76 & 16.62 & 9.47 & 0.41 & 0.03\\
1973 & 327.14 & 40.53 & 325.93 & 0.74 & 16.38 & 10.23 & 0.44 & 0.03\\
1974 & 316.91 & 39.24 & 315.73 & 0.71 & 16.33 & 11.31 & 0.47 & 0.04\\
1975 & 305.79 & 37.82 & 304.62 & 0.69 & 16.56 & 11.27 & 0.48 & 0.04\\
1976 & 294.93 & 36.43 & 293.75 & 0.66 & 16.63 & 12.83 & 0.53 & 0.04\\
1977 & 282.77 & 34.87 & 281.58 & 0.63 & 16.47 & 13.56 & 0.56 & 0.05\\
1978 & 270.21 & 33.25 & 269.03 & 0.60 & 13.10 & 13.19 & 0.56 & 0.05\\
1979 & 258.36 & 31.70 & 257.22 & 0.58 & 14.40 & 14.02 & 0.60 & 0.05\\
1980 & 245.94 & 30.10 & 244.98 & 0.55 & 16.63 & 15.13 & 0.63 & 0.06\\
1981 & 232.67 & 28.41 & 231.61 & 0.52 & 17.49 & 5.45 & 0.36 & 0.02\\
1982 & 229.28 & 27.98 & 228.08 & 0.51 & 16.78 & 5.60 & 0.37 & 0.02\\
1983 & 226.04 & 27.54 & 224.79 & 0.50 & 19.34 & 40.56 & 0.88 & 0.18\\
1984 & 188.81 & 22.73 & 187.56 & 0.41 & 25.74 & 13.56 & 0.67 & 0.07\\
1985 & 179.32 & 21.37 & 177.84 & 0.39 & 31.50 & 12.25 & 0.66 & 0.07\\
1986 & 172.18 & 20.26 & 170.27 & 0.37 & 25.98 & 13.26 & 0.70 & 0.08\\
1987 & 165.67 & 19.13 & 163.36 & 0.35 & 75.32 & 5.66 & 0.47 & 0.03\\
1988 & 168.47 & 19.05 & 166.06 & 0.35 & 23.16 & 2.13 & 0.23 & 0.01\\
1989 & 177.90 & 19.60 & 173.22 & 0.36 & 21.95 & 11.58 & 0.65 & 0.07\\
1990 & 180.53 & 19.28 & 178.89 & 0.35 & 21.09 & 17.55 & 0.76 & 0.10\\
1991 & 178.59 & 18.54 & 176.99 & 0.34 & 36.48 & 73.90 & 0.96 & 0.42\\
1992 & 123.22 & 11.85 & 121.50 & 0.22 & 36.10 & 35.41 & 0.94 & 0.29\\
1993 & 103.81 & 9.92 & 101.23 & 0.18 & 26.07 & 40.67 & 0.96 & 0.40\\
1994 & 78.69 & 7.12 & 76.20 & 0.13 & 42.59 & 23.90 & 0.93 & 0.31\\
1995 & 70.28 & 5.81 & 68.24 & 0.11 & 18.48 & 12.66 & 0.89 & 0.19\\
1996 & 73.59 & 5.85 & 70.74 & 0.11 & 70.50 & 15.56 & 0.91 & 0.22\\
1997 & 75.08 & 5.88 & 73.19 & 0.11 & 13.02 & 22.98 & 0.94 & 0.31\\
1998 & 71.18 & 5.29 & 66.93 & 0.10 & 13.66 & 14.98 & 0.91 & 0.22\\
1999 & 75.16 & 5.56 & 74.02 & 0.10 & 92.17 & 13.81 & 0.90 & 0.19\\
2000 & 80.00 & 6.02 & 78.15 & 0.11 & 10.68 & 13.31 & 0.88 & 0.17\\
2001 & 86.73 & 6.82 & 81.26 & 0.12 & 9.57 & 16.10 & 0.89 & 0.20\\
2002 & 91.47 & 7.39 & 90.73 & 0.13 & 8.86 & 5.96 & 0.70 & 0.07\\
2003 & 104.93 & 8.76 & 104.25 & 0.16 & 10.45 & 13.92 & 0.84 & 0.13\\
2004 & 108.84 & 9.75 & 108.18 & 0.18 & 14.50 & 5.64 & 0.60 & 0.05\\
2005 & 118.38 & 11.76 & 117.57 & 0.21 & 17.11 & 10.59 & 0.73 & 0.09\\
2006 & 121.11 & 12.85 & 120.05 & 0.23 & 10.06 & 14.55 & 0.79 & 0.12\\
2007 & 117.91 & 12.90 & 116.79 & 0.23 & 7.71 & 19.32 & 0.85 & 0.17\\
2008 & 108.25 & 11.93 & 107.56 & 0.22 & 7.25 & 11.05 & 0.75 & 0.10\\
2009 & 105.22 & 11.66 & 104.67 & 0.21 & 8.16 & 6.88 & 0.64 & 0.07\\
2010 & 104.97 & 11.80 & 104.42 & 0.21 & 12.50 & 3.56 & 0.46 & 0.03\\
2011 & 107.13 & 12.27 & 106.44 & 0.22 & 28.47 & 5.45 & 0.57 & 0.05\\
2012 & 106.95 & 12.39 & 105.87 & 0.22 & 15.17 & 7.99 & 0.68 & 0.08\\
2013 & 104.56 & 12.04 & 102.72 & 0.22 & 9.06 & 3.57 & 0.46 & 0.03\\
2014 & 106.98 & 12.13 & 105.99 & 0.22 & 6.86 & 2.97 & 0.41 & 0.03\\
2015 & 110.22 & 12.30 & 109.61 & 0.22 & 6.87 & 8.55 & 0.70 & 0.08\\
2016 & 107.80 & 12.00 & 107.30 & 0.22 & 9.00 & 9.46 & 0.73 & 0.09\\
2017 & 103.96 & 11.74 & 103.43 & 0.21 & 11.69 & 12.52 & 0.79 & 0.12\\
2018 & 96.59 & 11.06 & 95.90 & 0.20 & 17.10 & 12.84 & 0.81 & 0.13\\
2019 & 88.55 & 10.19 & 87.64 & 0.18 & 16.70 & 16.02 & 0.87 & 0.18\\
2020 & 77.52 & 8.78 & 76.30 & 0.16 & 15.78 & 12.34 & 0.85 & 0.16\\
2021 & 70.60 & 7.75 & 69.42 & 0.14 & 14.99 & 13.50 & 0.88 & 0.19\\
2022 & 63.18 & 6.61 & 62.06 & 0.12 & 13.97 & 13.50 & 0.90 & 0.22\\
2023 & 56.39 & 5.60 & 55.34 & 0.10 & 12.89 & 0.03 & 0.01 & 0.00\\
2024 & 63.27 & 6.29 & 62.28 & 0.11 & 13.65 & 0.34 & 0.12 & 0.01\\
2025 & 70.34 & 7.10 & 69.40 & 0.13 & 14.44 & 0.68 & 0.19 & 0.01\\
2026 & 77.37 & 7.98 & 76.38 & 0.14 & 15.18 & 1.03 & 0.25 & 0.01\\
2027 & 84.21 & 8.86 & 83.17 & 0.16 & 15.84 & 1.37 & 0.29 & 0.02\\
2028 & 90.82 & 9.70 & 89.72 & 0.18 & 16.40 & 1.69 & 0.31 & 0.02\\
2029 & 97.20 & 10.48 & 96.06 & 0.19 & 16.87 & 1.97 & 0.33 & 0.02\\
2030 & 103.37 & 11.23 & 102.19 & 0.20 & 17.28 & 2.23 & 0.35 & 0.02\\
2031 & 109.38 & 11.95 & 108.17 & 0.22 & 17.64 & 2.48 & 0.36 & 0.02\\
2032 & 115.25 & 12.65 & 114.01 & 0.23 & 17.96 & 2.72 & 0.37 & 0.02\\*
\end{longtable}
\endgroup{}
\endgroup{}
<!-- \input{C:/Users/Brian.Langseth/Desktop/ca/write_up/tex_tables/TimeSeries.tex} -->

\newpage

<!-- ======================================================= -->
<!-- ****************     Sensitivities      *************** --> 
<!-- ======================================================= -->

<!-- tab:sensitivities -->
\include{tex_tables/sensitivities.tex}

<!-- Table of lengths from debWV data -->
\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}}
\caption{(\#tab:debWV-len-data)Number of additional length samples by year (new lengths) from 1987-1998 for quillback rockfish onboard CPFVs in central California as provided by CDFW. The number of length samples in the base model (original lengths - Table 4) is provided for comparison.}\\
\toprule
Year & New lengths & Original lengths\\
\midrule
\endfirsthead
\caption[]{(\#tab:debWV-len-data)Number of additional length samples by year (new lengths) from 1987-1998 for quillback rockfish onboard CPFVs in central California as provided by CDFW. The number of length samples in the base model (original lengths - Table 4) is provided for comparison. \textit{(continued)}}\\
\toprule
Year & New lengths & Original lengths\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
1987 & 4 & 8\\
1988 & 87 & 7\\
1989 & 107 & 51\\
1990 & 37 & -\\
1991 & 6 & -\\
1992 & 43 & -\\
1993 & 61 & 57\\
1994 & 22 & 29\\
1995 & 164 & 18\\
1996 & 104 & 43\\
1997 & 73 & 79\\
1998 & 45 & 60\\*
\end{longtable}
\endgroup{}
\endgroup{}

<!-- tab:review-sensitivities -->
\include{tex_tables/review_sensitivities.tex}

\newpage

<!-- tab:sensitivities -->
\input{U:/Stock assessments/quillback_rockfish_2021/write_up/postSSC_responses/MopUp_response/age_year_table.tex}

<!-- tab:sensitivities -->
\input{U:/Stock assessments/quillback_rockfish_2021/write_up/postSSC_responses/MopUp_response/age_bins_table.tex}

\newpage

<!-- ======================================================= -->
<!-- ********  Reference Points & Management *************** --> 
<!-- ======================================================= -->

\begingroup\fontsize{10}{12}\selectfont

\begin{landscape}\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{0.79cm}>{\raggedright\arraybackslash}p{0.79cm}>{\raggedright\arraybackslash}p{0.79cm}>{\raggedright\arraybackslash}p{0.79cm}>{\raggedright\arraybackslash}p{0.79cm}>{\raggedright\arraybackslash}p{0.79cm}>{\raggedright\arraybackslash}p{0.79cm}>{\raggedright\arraybackslash}p{0.79cm}>{\raggedright\arraybackslash}p{0.79cm}>{\raggedright\arraybackslash}p{0.79cm}>{\raggedright\arraybackslash}p{0.79cm}>{\raggedright\arraybackslash}p{0.79cm}>{\raggedright\arraybackslash}p{0.79cm}}
\caption{(\#tab:project)Projections of potential OFLs (mt), ABCs (mt), resulting ACLs (mt) based on 40-10 rule, estimated spawning output, and fraction unfished for 2023-2032, with assumed removals in 2021 and 2022 provided by the GMT. Values provided by the GMT were based on the average total removals from 2017-2019 for 2021 values and trends in total removals from 2017-2021 adjusted for updated management measures for 2022 values. The OFL South and ACL South for 2021 and 2022 reflect adopted management limits for quillback rockfish for the area south of 40.10 Latitude N, and the OFL North and ACL North for the area north of 40.10 Latitude N. The CA ACL North is the California specific allocation of the total ACL for 2021 and 2022 north of 40.10 Latitude N. Total CA ACL is the sum of the ACL South and CA ACL North values.}\\
\toprule
Year & OFL South & ACL South & OFL North & ACL North & CA ACL North & Total CA ACL & Assumed removals & OFL & Buffer & ABC & ACL & Spawning Output & Fraction Unfished\\
\midrule
\endfirsthead
\caption[]{(\#tab:project)Projections of potential OFLs (mt), ABCs (mt), resulting ACLs (mt) based on 40-10 rule, estimated spawning output, and fraction unfished for 2023-2032, with assumed removals in 2021 and 2022 provided by the GMT. Values provided by the GMT were based on the average total removals from 2017-2019 for 2021 values and trends in total removals from 2017-2021 adjusted for updated management measures for 2022 values. The OFL South and ACL South for 2021 and 2022 reflect adopted management limits for quillback rockfish for the area south of 40.10 Latitude N, and the OFL North and ACL North for the area north of 40.10 Latitude N. The CA ACL North is the California specific allocation of the total ACL for 2021 and 2022 north of 40.10 Latitude N. Total CA ACL is the sum of the ACL South and CA ACL North values. \textit{(continued)}}\\
\toprule
Year & OFL South & ACL South & OFL North & ACL North & CA ACL North & Total CA ACL & Assumed removals & OFL & Buffer & ABC & ACL & Spawning Output & Fraction Unfished\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 5.39 & 4.19 & 7.37 & 5.73 & 1.65 & 5.84 & 13.5 & - & - & - & - & 7.75 & 0.14\\
2022 & 5.39 & 4.19 & 7.37 & 5.74 & 1.65 & 5.84 & 11.9 & - & - & - & - & 6.61 & 0.12\\
2023 & - & - & - & - & - & - & - & 2.11 & 0.874 & 1.85 & 0.11 & 5.78 & 0.10\\
2024 & - & - & - & - & - & - & - & 2.38 & 0.865 & 2.06 & 0.42 & 6.47 & 0.12\\
2025 & - & - & - & - & - & - & - & 2.67 & 0.857 & 2.29 & 0.75 & 7.28 & 0.13\\
2026 & - & - & - & - & - & - & - & 2.97 & 0.849 & 2.52 & 1.1 & 8.15 & 0.15\\
2027 & - & - & - & - & - & - & - & 3.26 & 0.841 & 2.74 & 1.44 & 9.02 & 0.16\\
2028 & - & - & - & - & - & - & - & 3.54 & 0.833 & 2.95 & 1.75 & 9.85 & 0.18\\
2029 & - & - & - & - & - & - & - & 3.8 & 0.826 & 3.14 & 2.03 & 10.63 & 0.19\\
2030 & - & - & - & - & - & - & - & 4.05 & 0.818 & 3.31 & 2.29 & 11.38 & 0.21\\
2031 & - & - & - & - & - & - & - & 4.29 & 0.81 & 3.47 & 2.53 & 12.09 & 0.22\\
2032 & - & - & - & - & - & - & - & 4.52 & 0.803 & 3.63 & 2.77 & 12.79 & 0.23\\*
\end{longtable}
\endgroup{}
\end{landscape}
\endgroup{}

\newpage

<!-- tab:decision-table -->
\input{C:/Users/Brian.Langseth/Desktop/ca/write_up/tex_tables/ca_decision_table.tex}

\newpage

<!--chapter:end:52tables.Rmd-->

\clearpage
# Figures

<!-- ====================================================================== -->  
<!-- ****************** Catches Used in the Model ************************* --> 
<!-- ====================================================================== -->  


![Total removals (mt) by fleet used in the base model.\label{fig:catch}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/catch2 landings stacked.png){width=100% height=100% alt="Stacked barchart showing landings in each year for two fleets."}

<!-- ====================================================================== --> 
<!-- ******************* Data Used in the Model *************************** --> 
<!-- ====================================================================== --> 


![Summary of data sources used in the base model.\label{fig:data-plot}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/data_plot.png){width=100% height=100% alt="Dot plot indicating the years where catch and length composition data were available for each fleet."}

<!-- ====================================================================== -->
<!-- ****************   Commercial Length Samples    ********************** --> 
<!-- ====================================================================== -->


![Length composition data from the commercial fleet.\label{fig:com-len-data}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/comp_lendat_bubflt1mkt0_page2.png){width=100% height=100% alt="Bubble plot indicating quantity of data by length bin in each year."}


![Mean length for commercial fleet with 95 percent confidence intervals.\label{fig:mean-com-len-data}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/comp_lendat_data_weighting_TA1.8_CA_Commercial.png){width=100% height=100% alt="Thin box plot showing mean and confidence intervals of length data in each year."}

<!-- ====================================================================== -->
<!-- **************** Recreational Length Samples    ********************** --> 
<!-- ====================================================================== -->


![Length composition data from the recreational fleet.\label{fig:rec-len-data}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/comp_lendat_bubflt2mkt0_page3.png){width=100% height=100% alt="Bubble plot indicating quantity of data by length bin in each year."}


![Mean length for recreational fleet with 95 percent confidence intervals.\label{fig:mean-rec-len-data}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/comp_lendat_data_weighting_TA1.8_CA_Recreational.png){width=100% height=100% alt="Thin box plot showing mean and confidence intervals of length data in each year."}


<!-- ====================================================================== -->
<!-- *************************     Biology     **************************** --> 
<!-- ====================================================================== -->


![Maturity as a function of length.\label{fig:maturity}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/bio6_maturity.png){width=100% height=100% alt="Line plot of the logistic shaped maturity-at-length relationship."}



![Fecundity as a function of length.\label{fig:fecundity}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/bio9_fecundity_len.png){width=100% height=100% alt="Line plot showing fecundity increase as a power function of length."}


![Observed sex-specific (red is female, blue is male, gray is unsexed) weight-at-length data from the individual sources with length and weight data, along with all sources combined with the estimated weight-at-length curves.\label{fig:len-weight-survey}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data/output biology/plots/Length_Weight_by_Sex_ForReport.png){width=100% height=100% alt="Four-panel dot plot showing the power-function shape of weight and length data across all data sources with the relationship plotted, and individually for the recreational, commercial, and survey data."}


![Weight-at-length relationship used in the model.\label{fig:len-weight}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/bio5_weightatsize.png){width=100% height=100% alt="Line plot showing weight increase as a power function of length."}


![Observed sex-specific (red is female, blue is male, gray is unsexed) length-at-age data from the individual sources with length and age data, along with all sources combined with the estimated length-at-age curves.\label{fig:len-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data/output biology/plots/Length_Age_by_Sex_ForReport.png){width=100% height=100% alt="Four-panel dot plot showing an increasing and then plateauing shape of length and age data across all data sources with the relationship plotted, and individually for the recreational, commercial, and survey data."}



![Length at age in the beginning of the year in the ending year of the model.\label{fig:len-age-ss}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/bio1_sizeatage.png){width=100% height=100% alt="Line plot showing length increasing and then plateauing with age."}


<!-- ====================================================================== -->
<!-- *********************    Selectivity            ********************** --> 
<!-- ====================================================================== -->


![Selectivity at length by fleet.\label{fig:selex}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/sel01_multiple_fleets_length1.png){width=100% height=100% alt="Line plot showing the logistic-shaped pattern of selectivity."}

<!-- ====================================================================== -->
<!-- *********************    Recruitment            ********************** --> 
<!-- ====================================================================== -->


![Estimated time series of age-0 recruits (1000s).\label{fig:recruits}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/ts11_Age-0_recruits_(1000s)_with_95_asymptotic_intervals.png){width=100% height=100% alt="A whisker plot showing mean and 95 percent confidence intervals of recruitment each year."}


![Estimated time series of recruitment deviations.\label{fig:rec-devs}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/recdevs2_withbars.png){width=100% height=100% alt="A whisker plot showing mean and 95 percent confidence intervals of log-recruitment deviations each year."}


![Recruitment bias adjustment applied in the base model.\label{fig:bias-adj}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/recruit_fit_bias_adjust_forReport.png){width=100% height=100% alt="A line plot with two lines, one showing model-estimated transformed variance by year and a second showing the suggested bias correction to apply by year."}


<!-- ====================================================================== -->
<!-- ****************** Fit to the Length Data **************************** --> 
<!-- ====================================================================== -->



![Pearson residuals for commercial fleet. Closed bubble are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:com-pearson}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/comp_lenfit_residsflt1mkt0_page2.png){width=100% height=100% alt="Bubble plot of residuals by length bins in each year."}


![Model estimated mean length in cm (blue line) overlaid on mean length of commercial lengths (gray circles) with 95 percent confidence intervals (thick bars) based on current samples sizes. The thin bars indicate the confidence interval if Francis weighting were used instead.\label{fig:com-mean-len-fit}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/comp_lenfit_data_weighting_TA1.8_CA_Commercial.png){width=100% height=100% alt="Box and whisker plot of mean length for each year that commercial length data were available, along with a line of model-fitted mean length."}


![Pearson residuals for recreational fleet. Closed bubble are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:rec-pearson}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/comp_lenfit_residsflt2mkt0_page3.png){width=100% height=100% alt="Bubble plot of residuals by length bins in each year."}


![Model estimated mean length in cm (blue line) overlaid on mean length for recreational lengths (gray circles) with 95 percent confidence intervals (thick bars) based on current samples sizes. The thin bars indicate the confidence interval if Francis weighting were used instead.\label{fig:rec-mean-len-fit}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/comp_lenfit_data_weighting_TA1.8_CA_Recreational.png){width=100% height=100% alt="Box and whisker plot of mean length for each year that recreational length data were available, along with a line of model-fitted mean length."}


![Aggregated length comps over all years.\label{fig:agg-len-fit}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/comp_lenfit__aggregated_across_time.png){width=100% height=100% alt="Two-panel density plot of length data with a line showing the model estimated density, where the top panel is for commercial data and the bottom panel is for recreational data."}


<!-- ====================================================================== -->
<!-- ******************      Time Series       **************************** --> 
<!-- ====================================================================== -->


![Estimated time series of spawning output.\label{fig:ssb}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/ts7_Spawning_output_with_95_asymptotic_intervals_intervals.png){width=100% height=100% alt="Line plot of spawning output by year, with lines for 95 percent confidence interval."}


![Estimated time series of total biomass.\label{fig:tot-bio}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/ts1_Total_biomass_(mt).png){width=100% height=100% alt="Line plot of total biomass by year."}


![Estimated time series of relative spawning output.\label{fig:depl}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/ts9_Relative_spawning_output_intervals.png){width=100% height=100% alt="Line plot of fraction of unfished, with lines for 95 percent confidence interval."}

<!-- ```{r, results = 'asis'} -->
<!-- add_figure( -->
<!-- filein = file.path(mod_loc, "plots", "UnavailableSpawningOutput.png"), -->
<!-- caption = "Proportion of biomass unavailable due to selectivity for small and large fish.", -->
<!-- label = 'unavail-bio') -->
<!-- ``` -->


![Stock-recruit curve. Point colors indicate year, with warmer colors indicating earlier years and cooler colors in showing later years.\label{fig:bh-curve}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/SR_curve.png){width=100% height=100% alt="Dot plot showing estimates of recruitment and spawning output in each year along with a curve showing the estimated recruitment relationship."}


<!-- ====================================================================== -->
<!-- ******************      Likelihoods      ***************************** --> 
<!-- ====================================================================== -->

<!-- R0 -->

![Change in the negative log-likelihood across a range of ln(R0) values.\label{fig:r0-profile}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_SR_LN(R0)/piner_panel_SR_LN(R0).png){width=100% height=100% alt="Two-panel line plot showing the change of three components of likelihood across a range of values. In the top panel the components are total, length, and recruitment. In the bottom panel the components are elements  of the length likelihood, and are broken down into total, recreational, and commercial."}


![Change in the estimate of spawning output across a range of ln(R0) values.\label{fig:r0-ssb}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_SR_LN(R0)/SR_LN(R0)_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Line plot showing different trajectories of spawning output by year."}


![Change in the estimate of fraction unfished across a range of ln(R0) values.\label{fig:r0-depl}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_SR_LN(R0)/SR_LN(R0)_trajectories_compare3_Bratio.png){width=100% height=100% alt="Line plot showing different trajectories of fraction of unfished by year."}

<!-- h -->

![Change in the negative log-likelihood across a range of steepness values.\label{fig:h-profile}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_SR_BH_steep/piner_panel_SR_BH_steep.png){width=100% height=100% alt="Two-panel line plot showing the change of three components of likelihood across a range of values. In the top panel the components are total, length, and recruitment. In the bottom panel the components are elements  of the length likelihood, and are broken down into total, recreational, and commercial."}


![Change in the estimate of spawning output across a range of steepness values.\label{fig:h-ssb}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_SR_BH_steep/SR_BH_steep_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Line plot showing different trajectories of spawning output by year."}


![Change in the estimate of fraction unfished across a range of steepness values.\label{fig:h-depl}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_SR_BH_steep/SR_BH_steep_trajectories_compare3_Bratio.png){width=100% height=100% alt="Line plot showing different trajectories of fraction of unfished by year."}

<!-- M -->

![Change in the negative log-likelihood across a range of natural mortality values.\label{fig:m-profile}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_NatM_p_1_Fem_GP_1/piner_panel_NatM_p_1_Fem_GP_1.png){width=100% height=100% alt="Two-panel line plot showing the change of three components of likelihood across a range of values. In the top panel the components are total, length, and recruitment. In the bottom panel the components are elements  of the length likelihood, and are broken down into total, recreational, and commercial."}


![Change in the estimate of spawning output across a range of natural mortality values.\label{fig:m-ssb}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_NatM_p_1_Fem_GP_1/NatM_p_1_Fem_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Line plot showing different trajectories of spawning output by year."}


![Change in the estimate of fraction unfished across a range of natural mortality values.\label{fig:m-depl}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_NatM_p_1_Fem_GP_1/NatM_p_1_Fem_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="Line plot showing different trajectories of fraction of unfished by year."}

<!-- Linf -->

![Change in the negative log-likelihood across a range of maximum length values.\label{fig:linf-profile}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_L_at_Amax_Fem_GP_1/piner_panel_L_at_Amax_Fem_GP_1.png){width=100% height=100% alt="Two-panel line plot showing the change of three components of likelihood across a range of values. In the top panel the components are total, length, and recruitment. In the bottom panel the components are elements  of the length likelihood, and are broken down into total, recreational, and commercial."}


![Change in the estimate of spawning output across a range of maximum length values.\label{fig:linf-ssb}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_L_at_Amax_Fem_GP_1/L_at_Amax_Fem_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Line plot showing different trajectories of spawning output by year."}


![Change in the estimate of fraction unfished across a range of maximum length values.\label{fig:linf-depl}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_L_at_Amax_Fem_GP_1/L_at_Amax_Fem_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="Line plot showing different trajectories of fraction of unfished by year."}

<!-- k -->

![Change in the negative log-likelihood across a range of k values.\label{fig:k-profile}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_VonBert_K_Fem_GP_1/piner_panel_VonBert_K_Fem_GP_1.png){width=100% height=100% alt="Two-panel line plot showing the change of three components of likelihood across a range of values. In the top panel the components are total, length, and recruitment. In the bottom panel the components are elements  of the length likelihood, and are broken down into total, recreational, and commercial."}


![Change in the estimate of spawning output across a range of k values.\label{fig:k-ssb}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_VonBert_K_Fem_GP_1/VonBert_K_Fem_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Line plot showing different trajectories of spawning output by year."}


![Change in the estimate of fraction unfished across a range of k values.\label{fig:k-depl}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_VonBert_K_Fem_GP_1/VonBert_K_Fem_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="Line plot showing different trajectories of fraction of unfished by year."}

<!-- CV-old -->

![Change in the negative log-likelihood across a range of CV at maximum length values.\label{fig:cv2-profile}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_CV_old_Fem_GP_1/piner_panel_CV_old_Fem_GP_1.png){width=100% height=100% alt="Two-panel line plot showing the change of three components of likelihood across a range of values. In the top panel the components are total, length, and recruitment. In the bottom panel the components are elements  of the length likelihood, and are broken down into total, recreational, and commercial."}


![Change in the estimate of spawning output across a range of CV at maximum length values.\label{fig:cv2-ssb}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_CV_old_Fem_GP_1/CV_old_Fem_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Line plot showing different trajectories of spawning output by year."}


![Change in the estimate of fraction unfished across a range of CV at maximum length values.\label{fig:cv2-depl}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_profile_CV_old_Fem_GP_1/CV_old_Fem_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="Line plot showing different trajectories of fraction of unfished by year."}


<!-- ====================================================================== -->
<!-- ******************     Retrospectives    ***************************** --> 
<!-- ====================================================================== -->


![Change in the estimate of spawning output when the most recent 5 years of data are removed sequentially.\label{fig:retro-ssb}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_retro/compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Line plot showing different trajectories of spawning output by year."}


![Change in the estimate of fraction unfished when the most recent 5 years of data are removed sequentially.\label{fig:retro-depl}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_retro/compare4_Bratio_uncertainty.png){width=100% height=100% alt="Line plot showing different trajectories of fraction of unfished by year."}


![Change in the estimate of annual recruitment deviations when the most recent 5 years of data are removed sequentially.\label{fig:retro-recdevs}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_baseProfile_retro/compare11_recdevs.png){width=100% height=100% alt="Dot plot showing different time series of estimated log-recruitment deviations by year."}

<!-- ====================================================================== -->
<!-- ******************       Sensitivity     ***************************** --> 
<!-- ====================================================================== -->


![Change in estimated spawning output by sensitivity.\label{fig:sens-ssb}](C:/Users/Brian.Langseth/Desktop/ca/sensitivities/base.710_sensitivities_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Line plot showing different trajectories of spawning output by year."}


![Change in estimated fraction unfished by sensitivity.\label{fig:sens-depl}](C:/Users/Brian.Langseth/Desktop/ca/sensitivities/base.710_sensitivities_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Line plot showing different trajectories of fraction of unfished by year."}


![Change in estimated annual recruitment deviation by sensitivity.\label{fig:sens-recdev}](C:/Users/Brian.Langseth/Desktop/ca/sensitivities/base.710_sensitivities_compare12_recdevs_uncertainty.png){width=100% height=100% alt="Whisker plot showing different time series of estimated mean and 95 percent confidence intervals of log-recruitment deviations each year."}


<!-- For additional exploration requests -->

![Length distributions of the additional data (red line) requested during the June review compared to the original base model data (blue line) in years where the additional data were available (1987-1998). Numbers indicate the number of lengths from each dataset for each year that are also shown in Table 14.\label{fig:sens-debWV-comp}](C:/Users/Brian.Langseth/Desktop/ca/postSSC_plots/ForReport/Comp_overlap.png){width=100% height=100% alt="Multi-panel density plot showing overlaid length distributions from two separate datasets. Each panel represents a separate year."}


![Change in estimated spawning output by additional sensitivity requests during model reviews.\label{fig:review-sens-ssb}](C:/Users/Brian.Langseth/Desktop/ca/write_up/figures/All_review_sensitivities_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Line plot showing different trajectories of spawning output by year."}


![Change in estimated fraction unfished by additional sensitivity requests during model reviews.\label{fig:review-sens-depl}](C:/Users/Brian.Langseth/Desktop/ca/write_up/figures/All_review_sensitivities_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Line plot showing different trajectories of fraction of unfished by year."}


![Change in estimated annual recruitment deviation by additional sensitivity requests during model reviews.\label{fig:review-sens-recdev}](C:/Users/Brian.Langseth/Desktop/ca/write_up/figures/All_review_sensitivities_compare12_recdevs_uncertainty.png){width=100% height=100% alt="Whisker plot showing different time series of estimated mean and 95 percent confidence intervals of log-recruitment deviations each year."}


![Length-age data for quillback rockfish. Black and red circles indicate samples used in the base model that are from Oregon and Washington (black) and California (red). Blue and yellow circles indicate new California samples identified and aged during review at the August 17, 2021 GFSC meeting (blue) and at the September 29-30, 2021 mopup meeting (yellow). The gray line indicates the growth curve used in the base model.\label{fig:review-length-age}](L:\Assessments\CurrentAssessments\DataModerate_2021\Quillback_Rockfish\data/mopup_data/comb_LA_data.png){width=100% height=100% alt="Dot plot showing new length-at-age data overlaid onto the larger set of length-at-age data used in the model."}

<!-- ====================================================================== -->
<!-- ******************    Reference Points    **************************** --> 
<!-- ====================================================================== -->


![Estimated 1 - relative spawning ratio (SPR) by year.\label{fig:1-spr}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/SPR2_minusSPRseries.png){width=100% height=100% alt="Line plot."}


![Phase plot showing the fraction unfished versus fishing intensity for each year. Each point shows the spawning output relative to the unfished spawning output and the SPR ratio for each year. Lines through the final point show the 95 percent confidence intervals based on the asymptotic uncertainty for each dimension. The shaded ellipse is a 95 percent confidence region which accounts for the estimated correlations between the spawning output and SPR ratios.\label{fig:phase-plot}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/SPR4_phase.png){width=100% height=100% alt="Biplot showing sequential estimates of fishing intensity and relative biomass over time. The plot is divided into two quadrants separated by 0.4 relative biomass."}


![Equilibrium yield curve for the base case model. Values are based on the 2020
fishery selectivity and with steepness fixed at 0.72.\label{fig:yield}](C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base/plots/yield2_yield_curve_with_refpoints.png){width=100% height=100% alt="Line plot showing the yield corresponding to a range of fraction of unfished values from 0 to 1, with reference lines at fraction of unfished values for management reference points of 0.4 and 0.25, and model quantities of SPR target and current 2021 value."}

\newpage

<!--chapter:end:53figures.Rmd-->

\clearpage

# Appendix

## Appendix A: Allocation of Yield Among Federal Management Areas{#append_a}

The 2021 California stock assessment for quillback rockfish represents U.S. waters between the California-Mexico border and the California-Oregon border 42$^\circ$ 00' N. lat. Federal management of the nearshore rockfish complex, that includes quillback rockfish, is based on areas north and south of 40$^\circ$ 10' N. lat. Therefore, yield estimates from the California base model must be divided between the northern and southern management areas in order to determine the contribution of quillback rockfish to the nearshore rockfish overfishing limit (OFL). 

Ideally, allocation by area would be based on calculations of habitat by area and/or estimates of biomass by area. Neither of these estimates were available for quillback rockfish at this time to inform allocations by area. In lieu of this information, historical catches by each region were used to recommend allocation percents by area. Total removals from the recreational and commercial fleets between 2005 - 2020 by areas north and south of 40$^\circ$ 10' N. lat. were calculated. The proportion of removals that are north of 40$^\circ$ 10' N in each year is shown by year in Figure \ref{fig:catch-4010}. During the entire 2005-2020 period, a total of 49.6 percent of all removals were from areas north of 40$^\circ$ 10' N. lat (horizontal dashed line on Figure \ref{fig:catch-4010}) . Based on this, the recommended allocation of the OFLs from the California model be 49.6 percent to the north minor nearshore rockfish complex and 50.4 percent to the south complex. 


![Proportion of total removals in the recreational and commercial fisheries that are north of 40 degrees 10 minutes N. lat. by year from 2005 to 2020. The horizontal dashed line is the proportion of total removals over the full 2005-2020 time period that is noth of 40 degrees 10 minutes N. lat.\label{fig:catch-4010}](C:/Users/Brian.Langseth/Desktop/ca/write_up/figures/catch_allocation_4010.png){width=100% height=100% alt="A dot plot showing proportions between years 2005 and 2020 that vary around 50 percent."}

\clearpage

## Appendix B: California ROV Survey Data Informing Selectivity{#append_b}

From 2013-2015, the CDFW in collaboration with Marine Applied Research and Exploration (MARE), conducted Remote Operated Vehicle (ROV) surveys along the full length of the California coastline inside MPAs and in reference sites outside for comparison. Density estimates were produced from the ratio of observed fish per unit area observed over the area of seafloor observed by the ROV in fish per meter squared. The percent relative density reflecting the proportion of the density observed in each depth bin was estimated relative to the sum of the density values in observed depths. A particular advantage of ROV data compared to other data sources is the accuracy of the depth of encounter of individual fish, providing useful information regarding selectivity of fishing gear relative to the depth distribution of fish observed by the ROV. Depth restrictions north of Point Conception varied from 20 to 40 fm for most of the last two decades. Densities were highest in the depths of 10 to 50 fm. Therefore, fish occur at depths greater than those that are open to fishing, indicating depth restrictions offer protection of quillback rockfish biomass (Table \ref{tab:ca-ROV}). 
 
In addition, length frequency distributions by depth were determined from fish observed by the ROV based on visual approximations using the distance between paired lasers. While future efforts to increase the precision of length estimates include using stereo-camera data and programs estimating length from trigonometric calculations, the trends in approximate length distribution with depth still provides useful information. The length frequency distribution by depth is provided in Figure \ref{fig:ca-ROV}. In reviewing both the density by depth and length by depth relative to ontogenetic migration, the patterns may not reflect the smaller fish using shallow rocky reef as juveniles in less than 10 fm, and only reflect the density and composition in deeper depths where ontogenetic migration to deeper depths has already taken place for nearshore species and is not as apparent. 

When examining the length composition data by depth inside and outside of MPAs north of Point Conception (Figure \ref{fig:ca-ROV}), no extreme differences in composition were observed, which is not surprising given the relatively recent implementation of MPAs north of Point Conception between 2007 and 2012. The MPAs make up 20-30% of the rocky reef habitat in state waters within three miles of shore and are intended to preserve the larger individuals as biomass accumulates in MPAs over time. The combination of MPAs and RCAs restrict a larger portion of habitat to fishing (see [Appendix C](#append_c) for details). 

The percentage of fish in 5 cm size categories among 10 fm depths bins north of Point Conception did not show clear signs of increasing size with depth in greater than 10 fm in either region or protected vs. reference sites (Figure \ref{fig:ca-ROV-percent}). This may be in part due to the fish having already moved from shallow kelp forest habitat where the ROV cannot operate to the adult depth distribution in greater than 10 fm by the time they are observed. Only in the shallower depth bins is there higher proportion of smaller individuals. This would indicate that selectivity may not be domed shaped as would be considered if the depth restrictions protected a larger proportion of adult biomass.

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2.2cm}>{\raggedright\arraybackslash}p{2.2cm}>{\raggedright\arraybackslash}p{2.2cm}>{\raggedright\arraybackslash}p{2.2cm}}
\caption{(\#tab:ca-ROV)Counts of fish, areas surveyed by the ROV, density (fish/meter square) and percent relative density by 10 fm depth.}\\
\toprule
Depth (fm) & Observed Area (m2) & Quillback Rockfish Observed & Quillback Rockfish Density (fish/m2) & Percent Relative Density\\
\midrule
\endfirsthead
\caption[]{(\#tab:ca-ROV)Counts of fish, areas surveyed by the ROV, density (fish/meter square) and percent relative density by 10 fm depth. \textit{(continued)}}\\
\toprule
Depth (fm) & Observed Area (m2) & Quillback Rockfish Observed & Quillback Rockfish Density (fish/m2) & Percent Relative Density\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
0-10 & 2905 & 0 & 0 & 0\\
10-20 & 124611 & 54 & 0.00043 & 0.17\\
20-30 & 106708 & 92 & 0.00086 & 0.34\\
30-40 & 86149 & 67 & 0.00078 & 0.3\\
40-50 & 49896 & 21 & 0.00042 & 0.16\\
50-60 & 16972 & 1 & 0.00006 & 0.02\\
60-70 & 1379 & 0 & 0 & 0\\
70-80 & 970 & 0 & 0 & 0\\
80-90 & 947 & 0 & 0 & 0\\
90-100 & 1257 & 0 & 0 & 0\\
100-110 & 608 & 0 & 0 & 0\\
110-120 & 696 & 0 & 0 & 0\\
120-130 & 415 & 0 & 0 & 0\\
130-140 & 777 & 0 & 0 & 0\\
140-150 & 1633 & 0 & 0 & 0\\
150-160 & 908 & 0 & 0 & 0\\
160-170 & 860 & 0 & 0 & 0\\
170-180 & 1268 & 0 & 0 & 0\\
180-190 & 912 & 0 & 0 & 0\\
190-200 & 735 & 0 & 0 & 0\\
200-210 & 604 & 0 & 0 & 0\\
210-220 & 167 & 0 & 0 & 0\\
220-230 & 54 & 0 & 0 & 0\\
230-240 & 100 & 0 & 0 & 0\\
Total & 401535 & 235 & - & -\\*
\end{longtable}
\endgroup{}
\endgroup{}


![Length frequency distribution in each 10 fm depth bin for quillback rockfish sampled by the ROV in reference locations open to fishing north of Point Conception (above) and State Marine Reserves prohibiting take (below).\label{fig:ca-ROV}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/quillback_rov_lengths.png){width=100% height=100% alt="Two-panel relative frequency stacked bar chart of length counts. Each bar represents a 10 fathom depth bin, and lengths are binned within each bar in 5 cm increments."}


![Percent composition of quillback rockfish length frequency in 5 cm size classes for each 10 fm depth bin from ROV observations north of Point Conception in reference locations where retention is allowed (above) and in State Marine Reserves where retention is prohibited (below).\label{fig:ca-ROV-percent}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/quillback_rov_barchart_length.png){width=100% height=100% alt="Two-panel three-dimensional bar chart of length counts. Length bins are 5 cm and mulitple groups of bar charts are plotted going into the page and reflect 10 fathom depth categories."}

\clearpage

## Appendix C: Percent of Habitat Area Closed to Fishing for Groundfish in the RCAs, CCAs and MPAs in California from 2001-2021{#append_c}

### Introduction
At present, stock assessments reliant on fishery dependent data only represent the areas open to fishing, unless there is a fishery independent data source providing information on the relative abundance and length composition in closed areas. A network of marine protected areas (MPAs) was established between 2003 to 2012 through a regional siting process. The length composition and relative abundance inside and outside MPAs in part results from the presence of MPAs prohibiting take of groundfish established prior to expansion of the current network, duration of existence of new areas, degree of effort prior to protection and criteria for selection focusing on high productivity reefs. These areas are established in perpetuity and will provide substantial protections to nearshore fish stocks for the foreseeable future. 

In addition to MPAs, extensive Rockfish Conservation Areas (RCAs) of varying depths over time and space, as well as the two cowcod conservation areas (CCAs) encompassing 4200 square miles of water area since 2001, were established to facilitate rebuilding of overfished species.  While the depth restrictions in these closed areas can change or be eliminated, the areas closed become refugia that reduce fishing mortality, allowing accumulation of biomass within them. There has long been interest in quantifying the area of reef habitat for each assessed species that resides in protected areas, but until very recently, there was insufficient data on the distribution of rocky reef habitat. This analysis provides the percentage of habitat area for copper and quillback rockfish closed to fishing in MPAs, RCAs and CCAs where the take of groundfish was prohibited in each year from 2001 to 2021. 

 
### Methods
#### Descriptions of the habitat layers 
A predictive substrate layer that identifies hard and soft substrate was used to analyze seafloor coverage within the 3 nautical miles from California’s shore. Substrate types were generated algorithmically using rugosity analysis, to identify areas likely to have rocky reefs. This layer was derived from bathymetric data of 2, 5 and 10 m resolution and bathymetric data were collected by California Seafloor Mapping Project (CSMP). Potential issues with this rugosity analysis include noise and artifacts resulting from unusual substrate structure, original mapping data, and steep slopes. In addition, hard substrate might be underestimated in areas with canyon slopes, deep water, over smooth rock and where sediments cover rock. 

Data from the CSMP is known to have nearshore data gaps referred to as the white zone. Contributors from The University of California Santa Cruz, California Ocean Science Trust, and California Department of Fish and Wildlife (CDFW) conducted a 30 m resolution interpolation analysis to estimate hard and soft substrate within the white zone. The interpolation analysis utilized data from the CSMP and National Oceanic and the National Oceanic and Atmospheric Administration Environmental Sensitivity Index (ESI). Accuracy of the interpolation is estimated to be best where the white zone bands are narrowest and worst where the white zone bands are widest. In addition, metadata indicates the interpolation is questionable at scales finer than 100 m.

Substrate data developed for an Essential Fish Habitat Review was incorporated into this analysis for seafloor occurring outside of California State Waters (3 nautical miles). This dataset was generated by Joe Bizarro of the National Marine Fisheries Service, Southwest Fisheries Science Center in Santa Cruz and was created by combining multiple sources of bathymetric data with varying resolutions including multibeam sonar, sidescan sonar, sediment grabs, core samples seismic reflection profiles, still photos and video. This habitat data is subject to georeferencing errors and data resolution errors. Currently this is the best available data that represents hard and soft substrate types offshore for the areas outside of California State waters. 

#### Boundaries of the CCAs, RCAs and MPAs 
Regulation histories for each type of closure were converted to Boolean fields with zeros and ones indicating absence and implementation, respectively from 2001-2020. The corresponding GIS layers were either available from previous CDFW GIS staff projects or approximated by the depth contour where specific weigh points were unavailable. The area in MPAs prohibiting take by the recreational and commercial fisheries were included in the estimates of area closed to fishing from the first year in which the MPA was in place for a full calendar year. The Western CCA area accounted for waters around islands and banks open to take of a limited suite of groundfish species including copper rockfish. The RCAs for commercial and recreational fisheries were based on the deeper of the depth restrictions for the sectors to reflect only areas where take was prohibited for both. Where the RCA lines for the stock in question were not available, depth contours were used to approximate the percent of area closed. 

#### Delineating Habitat in Restricted Areas and Open to Fishing
The depth range of habitat for copper and quillback rockfish was between shore to 100 m, covering the primary depth distribution of both stocks observed in the CDFW ROV survey (Budrick et al. -@Budricketal_rov_2019) or noted in Love et al. -@loveetal_2002). The latitudinal range was set from the California/Mexican border to the California/Oregon border (42$^\circ$ N. lat.), which was stratified north and south Point Conception (34$^\circ$ 27’ N. lat.). Quillback rockfish are relatively rare south of Point Conception, thus only estimates for the area north of Point Conception are pertinent to this stock. 
 
The distribution and area of rocky reef habitat within a species range was delineated in ArcGIS Pro (2.6) by extracting specific values from a 10 m bathymetric raster based on species depth and latitudinal ranges. The resulting raster layer was converted into a shapefile and merged with a coastal boundary of California to account for gaps in the bathymetric raster. Hard habitat within the species range was identified and isolated using the intersect tool to create species range shapefile. This process was repeated to identify overlapping coverage between the species range and hard substrate, as well as intersecting the species range with a combination of different types of regulatory boundaries. 

The area of the resulting shapefiles were calculated in GIS and exported into tables using Python script. The combination of area closures in a given year were overlayed on the habitat maps, with the area in MPAs and CCAs extracted first, then the habitat in the remaining RCAs estimated. The residual habitat still open to fishing after accounting for the closed areas was then estimated. The area of rocky reef habitat closed to fishing within a species range was converted to a percentage of the total habitat. This process for identifying overlapping boundaries and calculating areas were scripted in Python to reduce the possibility of human error. 

#### Examination of bottom type coverage relative to habitat 
The extent of existing substrate data within a given species range was examined through geospatial analysis. This included hard, soft, and unknown substrate for data from California Seafloor Mapping Project, and hard, mixed, and soft data from the EFH project. Both datasets were merged within the species range for copper and quillback rockfish. The resulting combination of substrate data was erased from the species range. 
 
### Results
The tables reflecting the percent of habitat area in RCAs, MPAs, CCAs closed to fishing for groundfish and waters open to fishing are provided for north of Point Conception (Table \ref{tab:ca-mpa}). The potential habitat within the primary depth range of the species, rocky reef habitat within the potential habitat, MPAs and CCAs are depicted for the entire state (Figure \ref{fig:ca-mpa-map}). 

We found minimal voids in coverage in habitat layers across the species range, with 0.13 square miles missing north of Point Conception and 4.95 square miles missing from the south of Point Conception. 

### Discussion
Current assessments do not account for length/age composition and differing fishing mortality rates inside and outside MPAs or waters in long-established CCAs and RCAs. As biomass accrues inside these areas, accounting for protections through area-based assessment methods or effects on selectivity should be considered as fishery dependent data will only reflect the length composition and density outside. There is the potential for future assessments to account for differences in length composition, fishing mortality and relative abundance in a two-area model in Stock Synthesis with available data from long-term MPA monitoring.  

Additional high resolution side scan sonar data in waters seaward of the CSMP coverage would improve coverage and resolution of habitat data. Similar analyses for each nearshore or shallower distributed shelf rockfish species (i.e. vermilion rockfish) would be a helpful addition to stock assessments to inform time blocking and selectivity considerations. The extent and design of the network to function in this way is unique to California and it’s efforts to conserve nearshore stocks. Until the closed areas can be accounted for explicitly in stock assessments, the substantial areas in MPAs should be taken into consideration as a buffer against overfishing, since they were established in the interest of preserving spawning stock to seed areas outside and other MPAs in the network.  
 

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}}
\caption{(\#tab:ca-mpa)Percent of rocky reef habitat protected for quillback and copper rockfish north or Point Conception by MPAs and RCAs, and the total percent habitat open to fishing.}\\
\toprule
Year & Percent Habitat Protected by MPA & Percent Habitat Protected by RCA & Percent Habitat Open to Fishing\\
\midrule
\endfirsthead
\caption[]{(\#tab:ca-mpa)Percent of rocky reef habitat protected for quillback and copper rockfish north or Point Conception by MPAs and RCAs, and the total percent habitat open to fishing. \textit{(continued)}}\\
\toprule
Year & Percent Habitat Protected by MPA & Percent Habitat Protected by RCA & Percent Habitat Open to Fishing\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2001 & 3 & 0 & 97\\
2002 & 3 & 0 & 97\\
2003 & 3 & 41 & 55\\
2004 & 3 & 23 & 73\\
2005 & 3 & 30 & 67\\
2006 & 3 & 30 & 67\\
2007 & 3 & 28 & 69\\
2008 & 11 & 27 & 62\\
2009 & 11 & 27 & 62\\
2010 & 11 & 33 & 56\\
2011 & 17 & 29 & 54\\
2012 & 17 & 29 & 54\\
2013 & 20 & 27 & 53\\
2014 & 20 & 27 & 53\\
2015 & 20 & 24 & 56\\
2016 & 20 & 24 & 56\\
2017 & 20 & 14 & 66\\
2018 & 20 & 14 & 66\\
2019 & 20 & 11 & 68\\
2020 & 20 & 13 & 67\\
2021 & 20 & 5 & 75\\*
\end{longtable}
\endgroup{}
\endgroup{}
\clearpage


![Copper and quillback rockfish potential depth range off California in red hatched polygon, hard substrate occurring within the potential range in pink, MPAs in dark blue outline, and the CCAs in light blue.\label{fig:ca-mpa-map}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/ca_mpa_rca_habitat_map.png){width=100% height=100% alt="Bathymetric map of the California coast highlighting locations of hard substrate and potential rockfish habitat, with insets showing areas near Monterey Bay, Cape Mendocino, and the Channel Islands."}

\clearpage

## Appendix D: Detailed Fit to Annual Length Composition Data{#append_d}



![Length comps, whole catch, CA_Commercial (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.\label{fig:comp_lenfit_flt1mkt0_page1}](C:/Users/Brian.Langseth/Desktop/ca/7_1_1_base_ghostCom/plots/comp_lenfit_flt1mkt0_page1.png){width=100% height=100% alt="Multi-panel density plot showing length distributions by year along with a line showing the model fit. Each panel represents a separate year."}

![Length comps, whole catch, CA_Commercial (plot 2 of 2).\label{fig:comp_lenfit_flt1mkt0_page2}](C:/Users/Brian.Langseth/Desktop/ca/7_1_1_base_ghostCom/plots/comp_lenfit_flt1mkt0_page2.png){width=100% height=100% alt="Multi-panel density plot showing length distributions by year along with a line showing the model fit. Each panel represents a separate year."}

![Length comps, whole catch, CA_Recreational (plot 1 of 3).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.\label{fig:comp_lenfit_flt2mkt0_page1}](C:/Users/Brian.Langseth/Desktop/ca/7_1_1_base_ghostCom/plots/comp_lenfit_flt2mkt0_page1.png){width=100% height=100% alt="Multi-panel density plot showing length distributions by year along with a line showing the model fit. Each panel represents a separate year."}

![Length comps, whole catch, CA_Recreational (plot 2 of 3).\label{fig:comp_lenfit_flt2mkt0_page2}](C:/Users/Brian.Langseth/Desktop/ca/7_1_1_base_ghostCom/plots/comp_lenfit_flt2mkt0_page2.png){width=100% height=100% alt="Multi-panel density plot showing length distributions by year along with a line showing the model fit. Each panel represents a separate year."}

![Length comps, whole catch, CA_Recreational (plot 3 of 3).\label{fig:comp_lenfit_flt2mkt0_page3}](C:/Users/Brian.Langseth/Desktop/ca/7_1_1_base_ghostCom/plots/comp_lenfit_flt2mkt0_page3.png){width=100% height=100% alt="Multi-panel density plot showing length distributions by year along with a line showing the model fit. Each panel represents a separate year."}

![Ghost length comps, whole catch, CA_Commercial.<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.\label{fig:comp_gstlenfit_flt1mkt0}](C:/Users/Brian.Langseth/Desktop/ca/7_1_1_base_ghostCom/plots/comp_gstlenfit_flt1mkt0.png){width=100% height=100% alt="Multi-panel density plot showing length distributions by year along with a line showing the model fit. Each panel represents a separate year."}


\clearpage


<!--chapter:end:54appendix.Rmd-->

