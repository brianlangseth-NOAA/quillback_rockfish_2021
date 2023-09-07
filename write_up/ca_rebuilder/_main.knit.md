---
month: "September"
year: "2023"
preamble: |
csl: canadian-journal-of-fisheries-and-aquatic-sciences.csl
disclaimer: true
output:
  sa4ss::techreport_pdf:
    default
  bookdown::pdf_document2:
    keep_tex: true
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
author_list: Langseth, B.J
affiliation:
  - code: 1
    address: Northwest Fisheries Science Center, U.S. Department of Commerce, National
      Oceanic and Atmospheric Administration, National Marine Fisheries Service, 2725
      Montlake Boulevard East, Seattle, Washington 98112
address: ^1^Northwest Fisheries Science Center, U.S. Department of Commerce, National
  Oceanic and Atmospheric Administration, National Marine Fisheries Service, 2725
  Montlake Boulevard East, Seattle, Washington 98112
---

<!--chapter:end:00authors.Rmd-->

---
bibliography:
  - sa4ss.bib
  - quillback.bib
---

<!--chapter:end:00bibliography.Rmd-->

---
title: DRAFT 2023 Rebuilding analysis for quillback rockfish (_Sebastes maliger_) in U.S. waters off the coast of California based on the 2021 stock assessment
---

<!--chapter:end:00title.Rmd-->

\pagebreak
\pagenumbering{roman}
\setcounter{page}{1}

\renewcommand{\thetable}{\roman{table}}
\renewcommand{\thefigure}{\roman{figure}}

\setlength\parskip{0.5em plus 0.1em minus 0.2em}

\pagebreak



<!--chapter:end:01a.Rmd-->

# Summary{-}

This rebuilding analysis is for the stock of quillback rockfish (_Sebastes maliger_) in waters off California. The analysis is based on the 2021 stock assessment [@Langseth_status_2021]. The 2021 assessment model estimated the quillback rockfish population to be at 14% of the unexploited equilibrium spawning output at the start of 2021. This rebuilding analysis compares the results of applying a suite of potential management actions to the stock for 2025 and beyond based on updated catch values for 2021--2024 as provided by the Groundfish Management Team (GMT). This rebuilding analysis uses the standard suite of management scenarios as described in the rebuilding Terms of Reference (TOR; @pfmc_rebuildingTOR_2022), along with five SPR strategies ranging from SPR = 0.50 to SPR = 0.90 in increments of 0.10 and two additional SPR strategies at SPR = 0.55 and SPR = 0.65.

The results of the analysis show that the value for $\text{T}_\text{MIN}$, the median year for rebuilding to the target level in the absence of fishing since the year of declaration (2025), was 2045. The estimated generation time for quillback rockfish was 26 years. In conjunction with $\text{T}_\text{MIN}$ and the mean generation time, $\text{T}_\text{MAX}$ was estimated to be 2071. An SPR = 0.586 harvest rate leads to a 50% probability of recovery by $\text{T}_\text{MID}$ where $\text{T}_\text{MID}$ was 2058, an intermediate year between $\text{T}_\text{MIN}$ and $\text{T}_\text{MAX}$.

<!--chapter:end:01executive.Rmd-->

\pagebreak
\setlength{\parskip}{3mm plus1mm minus1mm}
\pagenumbering{arabic}
\setcounter{page}{1}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\setcounter{table}{0}
\setcounter{figure}{0}

<!--chapter:end:10a.Rmd-->

# Introduction

The 2021 assessment of quillback rockfish (_Sebastes maliger_) in California waters documented that the population of quillback rockfish in 2021 was below the Minimum Stock Size Threshold (MSST), which is 25$\%$ of unfished spawning output for rockfish stocks [@Langseth_status_2021]. The population declined below MSST starting in 1992, reached it lowest values in the mid-1990s, increased to near the MSST in the 2000s and early 2010s, and declined in recent years. 

A draft rebuilding analysis was done in 2021 based on the results of the 2021 stock assessment and was used to inform catch levels (i.e. ACLs) for 2023--2024 using an SPR = 0.55 [@langseth_rebuild_2022]. However, no status declaration of quillback rockfish in California waters was made because quillback rockfish were defined in the Fisheries Management Plan (FMP) at the time as a coastwide stock, and therefore a rebuilding plan for California quillback rockfish was not required. Since the 2021 assessment, Amendment 31 to the FMP has been proposed that, if approved, would define quillback rockfish along the U.S. west coast as three stocks [@fed_registry_2023]: Washington, Oregon, and California.

Given the assumed levels of depletion for quillback rockfish in California waters a range of alternative rebuilding strategies were examined, and are described in this report. This analysis updates the draft 2021 rebuilding analysis and contains new estimates for removals of quillback rockfish in California waters in 2021--2024. The years by which rebuilding occurred ranged from 2045 -- 2072 based on various SPR harvest rates from 0.5 to 1 (no harvest). 


# Overview of the 2021 stock assessment

The 2021 assessments of quillback rockfish assessed the stock as three separate sub-stocks along the U.S. west coast: Washington, Oregon, and California. These were the first assessments of quillback rockfish conducted within Stock Synthesis [@methot_stock_2013] that used catch and length composition data to inform model estimates around stock size and status. The previous assessment of quillback rockfish, conducted in 2010, was a coastwide assessment modeled using Depletion-Based Stock Reduction Analysis (DB-SRA) to provide estimates of coastwide overfishing limits (OFLs) based on data and biological information [@DickandMacCall_dbsra_2010]. DB-SRA is a catch-only method and does not assess overfished status; the 2010 assessment assumed that current depletion was distributed around the management target of 40$\%$. The 2010 assessment found there was a 52$\%$ chance that quillback rockfish was experiencing overfishing, as recent coastwide catch of quillback rockfish slightly exceeded the median coastwide OFL estimate at the time. Recent catches of quillback rockfish for the current assessment also exceed the annual catch limit (ACL) contributions for the species in all modeled areas. Estimates of depletion in 2021 for the stocks off Washington and Oregon were above the MSST threshold, but the estimate of depletion for the sub-stock off California was 14$\%$ [@Langseth_status_2021].

California quillback rockfish was assessed using a single-sex model with coastwide life history parameters combined across sexes [@Langseth_status_2021]. Life history parameters were estimated externally and then fixed within the model. Natural mortality and steepness were both fixed, at the median and mean of the priors, respectively. Annual recruitment deviations were estimated within the base model. The model for quillback rockfish in California waters included two fishing fleets, a commercial and a recreational fleet. The majority of the removals and length composition data arose from the recreational fleet. Recreational removals peaked in the late 1970s and early 1980s, with two years of large catches in 1984 and 1993. Removals declined sharply in 1994, but increased to levels similar to the late 1970s and early 1980s during the mid 2000s and again in recent years. Commercial removals peaked in the mid to late 1990s, with one year of exceptionally large catches in 1991. Removals declined through the mid 2010s, but increased in recent years. Selectivity for the commercial and recreational fleets was specified to be asymptotic. The assessment model decision table explored uncertainty around stock size and status using lower ($M$ = 0.0464 yr$^{-1}$) and higher ($M$ = 0.0744 yr$^{-1}$) natural mortality ($M$) values relative to the base model ($M$ = 0.057 yr$^{-1}$).

Sensitivities to modeling choices, catch history, and parameter values were explored and showed general support for the base model estimates of stock status and depletion. Sensitivities to the von Bertalanffy growth coefficient ($k$, whether estimated on its own or along with $L_\infty$) and natural mortality showed that model estimates of depletion were sensitive to these parameter choices.  

# Management performance under rebuilding

No rebuilding plan exists for quillback rockfish in waters off the coast of California.

<!-- This is the first rebuilding plan for quillback rockfish in waters off the coast of California. -->


<!--chapter:end:11introduction.Rmd-->

# Rebuilding calculations

This rebuilding analysis was conducted in August and September, 2023 using software developed by A. Punt (version 3.12j, December 2021). The input file for the analysis is provided in [Appendix A](#append_a). The steps followed were: 

\begin{enumerate}
	\item Define how equilibrium spawning output ($\text{SB}_0$) will be calculated. 
	\item Define how future recruitment will be generated.
	\item Define the biological information on which future projections will be based.
	\item Define the fishery selectivity and allocation to be applied during rebuilding. 
	\item Decide how to include uncertainty in input parameters from the stock assessment in the rebuilding analysis. 
	\item Identification and analysis of alternative harvest strategies for rebuilding. 
\end{enumerate}


## Definition of Equilibrium Spawning Output

The equilibrium spawning output ($\text{SB}_0$) used in this rebuilding analysis is calculated via the stock-recruitment, growth, maturity, and fecundity relationships from the 2021 assessment in order to be consistent with assessment model results. Equilibrium spawning output was estimated to be 55.08 millions of eggs in the assessment model, which dictates a rebuilding relative spawning output target ($\text{SB}_{40\%}$) of 22.035 millions of eggs (Table \ref{tab:ref-points}). Estimates of spawning output presented in this report are female spawning output only. 


## Generation of future recruitment

The estimated parameters of the stock recruitment relationship including the unexploited equilibrium recruitment (ln($R_0$) = 3.168), steepness ($h$ = 0.72), and degree of recruitment variability ($\sigma_R = 0.60$) from the 2021 assessment were used to generate future recruitments in the rebuilding analysis.


## Population biology

The biological parameters used for the rebuilding analysis were based on the values from the 2021 assessment. Biological parameters in the assessment were aggregated across sex and constant across time. The rebuilding analysis was based on a single sex model. 


## Fishery selectivity, and removal allocations

The selectivity used in the rebuilding analysis was obtained from the 2021 assessment. Selectivity in the assessment model was constant across time for each fishing fleet. The relative allocation of catch among fleets in the rebuilding analysis was informed using the relative fishing mortality from the assessment averaged over recent years (2017--2019). This choice provides some consistency between recent model results and forecasts from the rebuilding analysis, accounting for the unique dynamics in 2020 caused by the COVID-19 pandemic. 

Removals for 2021--2024 were entered as fixed values within the analysis and were provided by the Groundfish Management Team (GMT). Removals in these years were allocated among fleets based on the fleet-specific values as provided by the GMT and not based on relative fishery mortality from 2017--2019.   


## Inclusion of uncertainty

Model and parameter uncertainty is included in the rebuilding analysis via 1,000 random simulations of stochastic future recruitment strengths and integration over alternative low ($M$ = 0.0464 yr$^{-1}$) and high ($M$ = 0.0744 yr$^{-1}$) states of nature for values of natural mortality ($M$). Other potential states of nature were explored for the assessment, including for low and high ln($R_0$) and high and low $L_{\infty}$, but alternative values of natural mortality encapsulated a slightly wider range of depletion estimates compared to the other states of natures. The base model was given 50$\%$ of the weight (500 simulations) and each alternative natural mortality state of nature was given 25$\%$ of the weight (250 simulations). 


## Alternate rebuilding strategies analyzed

Assuming that a constant rate of harvest will be applied throughout a rebuilding period, the basis for rebuilding alternatives can be divided into two approaches: 1) strategies based on selection of a constant harvest rate (SPR rate), or 2) strategies based on selection of a target year for 50$\%$ probability of recovery. This rebuilding analysis presents the following alternate strategies, which are a combination of those specified in Section 2.5 of the rebuilding Terms of Reference (TOR; @pfmc_rebuildingTOR_2022) and additional strategies. The additional strategies are based on the selection of a SPR harvest rate, and rebuilding by a selected target year $\text{T}_\text{MID}$.  

\begin{enumerate}
	\item Eliminate all harvest, F = 0, starting in the next management cycle, 2025, the same as setting a constant SPR harvest rate of 1.0.
	\item Apply the harvest rate that would generate the ACL contributions specified for the current year (i.e., the latest year specified in regulations). 
	\item Apply a range of SPR values: 
	\begin{enumerate}
	 \item SPR = 0.50,
	 \item SPR = 0.55
	 \item SPR = 0.60,
	 \item SPR = 0.65,
	 \item SPR = 0.70,
	 \item SPR = 0.80, and
	 \item SPR = 0.90. 
	\end{enumerate}
	\item Apply SPR harvest rates that are estimated to lead to a 50$\%$ probability of recovery by alternative target years: 
	\begin{enumerate}
	 \item by $\text{T}_\text{MAX}$ from the current cycle, and 
	 \item by $\text{T}_\text{MID}$ from the current cycle, which is the year midway between $\text{T}_\text{MIN}$ and $\text{T}_\text{MAX}$.
	\end{enumerate}
	\item Apply the default harvest policy based on the 40:10 harvest control rule with time-varying sigma ($\sigma$ = 1.0 as the basis for the time-varying sigmas) and $P^*$ = 0.45.
	\item Apply the ABC harvest rate with time-varying sigma ($\sigma$ = 1.0 as the basis for the time-varying sigmas) and $P^*$ = 0.45.
\end{enumerate}

The estimated removal in 2025 from applying an SPR of 0.5 was smaller than the 2024 ACL contributions (1.93 mt) for quillback rockfish in California waters. This implies that an SPR rate of below 0.5 would be needed to achieve the current ACL contributions, so results from this strategy (strategy 2 above) are not provided in this report. The SPR harvest rate to achieve a 50$\%$ probability of recovery by $\text{T}_\text{MAX}$ from the current cycle was 0.5039, essentially equal to that of the SPR = 0.5 strategy. Consequently, results fom the $\text{T}_\text{MAX}$ strategy (strategy 5a above) are not presented in this report.

No current rebuilding plan exists for quillback rockfish in California waters so the alternatives related to the results of a previous rebuilding plan as specified in Section 2.5 of the rebuilding TOR could not be done. These include:

\begin{itemize}
 \item Apply the spawning potential ratio or relevant harvest control run in the current rebuilding plan (strategy 3 in TOR). 
 \item Apply the harvest rate that is estimated to lead to a 50$\%$ probability of recovery by the current $\text{T}_\text{TARGET}$ (strategy 4 in TOR).
 \item Apply the harvest rate that is estimated to lead to a 50$\%$ probability of recovery by the $\text{T}_\text{MAX}$ from the previous cycle (strategy 6 in TOR).
\end{itemize}

All of the above rebuilding strategies were conducted assuming removals of 15.58 mt in 2021, 18.11 mt in 2022, 11.12 mt in 2023, and 10.62 mt in 2024, as recommended by the GMT. 


<!--chapter:end:20rebuilding.Rmd-->

# Results

## Rebuilding reference points

Reference points calculated based on this rebuilding analysis are given in Table \ref{tab:ref-points}. The minimum time required for rebuilding, $\text{T}_\text{MIN}$, with no fishing (F=0) starting in 2025 was estimated to be 20 years, corresponding to the stock being rebuilt by 2045, assuming the default removals for 2021--2024. The mean generation time was estimated to be 26 years. The maximum time allowed for rebuilding, $\text{T}_\text{MAX}$, is defined as the $\text{T}_\text{MIN}$ plus the mean generation time for stocks that require more than 10 years to rebuild.  Quillback rockfish was unable to rebuild within 10 years so the estimated $\text{T}_\text{MAX}$ was 2071. $\text{T}_\text{TARGET}$ and $\text{SPR}_\text{TARGET}$ are not specified because no rebuilding plan for quillback rockfish exists so these values have not been set via the Council's process.

A rebuilding strategy is presented below that includes a rebuilding target year termed $\text{T}_\text{MID}$, which equals 2058 and is the mid-point between $\text{T}_\text{MIN}$ and $\text{T}_\text{MAX}$. The Council may opt to select a $\text{T}_\text{TARGET}$ earlier or later than this $\text{T}_\text{MID}$ value based on fishery, economic, or other factors.

## Alternative harvest policy projections

Summary results from the rebuilding analysis are presented in Table \ref{tab:reb-options}. Within Table \ref{tab:reb-options}, estimated catch values for 2025--2026 from the rebuilding analysis are labeled as ACL values. Detailed results for all runs are presented in Tables \ref{tab:prob-mat}--\ref{tab:rel-ssb-mat} and Figures \ref{fig:prob-fig}--\ref{fig:ssb-fig}.

The target rebuilding year based on the various rebuilding strategies ranged from 2045 -- 2072 (Table \ref{tab:reb-options}). The probability of rebuilding by year steadily increased across the alternative SPR values with full rebuilding (reaching a probability of greater than 50$\%$) by 2072 when the lowest SPR of 0.50 was applied (Table \ref{tab:prob-mat} and Figure \ref{fig:prob-fig}). Note, however, that this year is beyond the year associated with $\text{T}_\text{MAX}$. The recommended removals in 2025, the first year of rebuilding, were low, ranging between 0 -- 1.48 mt across strategies excluding the no-harvest strategy (Table \ref{tab:acl-mat}). Zero catches were observed for the first three years under the 40-10 strategy because spawning output relative to unfished spawning output was below the 10$\%$ limit through 2027. The recommended removals slowly increased by year during the rebuilding period (Figure \ref{fig:acl-fig}). The estimated overfishing limits (OFLs) for each rebuilding alternative are given in Table \ref{tab:ofl-mat}. The change in spawning output by year relative to the spawning output target, 40$\%$ of unfished, under each of the alternatives are shown by year in Table \ref{tab:rel-ssb-mat} and Figure \ref{fig:rel-ssb-fig}. 
<!-- The harvest rate to obtain a 50% probability of recovery by $\text{T}_\text{MAX}$ corresponds to an SPR that is lower than 0.5, which represents catch that is greater than the OFL, so is not provided in the tables.  -->

<!--chapter:end:30results.Rmd-->

# Acknowledgements
Thank you to the Groundfish Management Team for providing catch estimates for 2021--2024. Owen Hamel (NOAA) provided assistance in understanding and applying the rebuilder program for this cycle, and Chantel Wetzel (NOAA) provided comments on drafts of the analysis. 

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

<!-- ## Rebuilding reference points and summary of alternatives -->

## Rebuilding reference points and policy projections

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2cm}}
\caption{(\#tab:ref-points)Summary of the rebuilding reference points.}\\
\toprule
Quantity & 2021 Assessment Values\\
\midrule
\endfirsthead
\caption[]{(\#tab:ref-points)Summary of the rebuilding reference points. \textit{(continued)}}\\
\toprule
Quantity & 2021 Assessment Values\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
SB\textsubscript{0} (millions of eggs) & 55.08\\
SB\textsubscript{40\%} (millions of eggs) & 22.03\\
SB\textsubscript{2021} (millions of eggs) & 7.75\\
Year rebuilding begins & 2025\\
Current year & 2021\\
T\textsubscript{MIN} & 2045\\
Mean generation time (years) & 26\\
T\textsubscript{MAX} & 2071\\
T\textsubscript{MID} & 2058\\
T\textsubscript{F=0} & 2045\\
T\textsubscript{TARGET} & TBD\\
SPR\textsubscript{TARGET} & TBD\\
Current SPR (2021) & 0.1\\*
\end{longtable}
\endgroup{}
\endgroup{}


<!-- ## Summary of alternatives -->

<!-- Base rebuilder -->
\begingroup\fontsize{10}{12}\selectfont

\begin{landscape}\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}}
\caption{(\#tab:reb-options)Results of rebuilding strategies based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021--2024. SPR for the ABC and 40-10 strategies is provided as a dash (-) because these strategies do not have a constant SPR value.}\\
\toprule
Quantity & SPR= .500       & SPR= .550       & SPR= .600       & SPR= .650       & SPR= .700       & SPR= .800       & SPR= .900       & Yr= T\textsubscript{MID} & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:reb-options)Results of rebuilding strategies based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021--2024. SPR for the ABC and 40-10 strategies is provided as a dash (-) because these strategies do not have a constant SPR value. \textit{(continued)}}\\
\toprule
Quantity & SPR= .500       & SPR= .550       & SPR= .600       & SPR= .650       & SPR= .700       & SPR= .800       & SPR= .900       & Yr= T\textsubscript{MID} & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 Assumed Removals (mt) & 15.58 & 15.58 & 15.58 & 15.58 & 15.58 & 15.58 & 15.58 & 15.58 & 15.58 & 15.58 & 15.58\\
2022 Assumed Removals (mt) & 18.11 & 18.11 & 18.11 & 18.11 & 18.11 & 18.11 & 18.11 & 18.11 & 18.11 & 18.11 & 18.11\\
2023 Assumed Removals (mt) & 11.12 & 11.12 & 11.12 & 11.12 & 11.12 & 11.12 & 11.12 & 11.12 & 11.12 & 11.12 & 11.12\\
2024 Assumed Removals (mt) & 10.62 & 10.62 & 10.62 & 10.62 & 10.62 & 10.62 & 10.62 & 10.62 & 10.62 & 10.62 & 10.62\\
2025 ACL (mt) & 1.48 & 1.24 & 1.02 & 0.84 & 0.68 & 0.4 & 0.18 & 1.08 & 0 & 0 & 1.27\\
2026 ACL (mt) & 1.71 & 1.43 & 1.2 & 0.98 & 0.8 & 0.48 & 0.22 & 1.26 & 0 & 0 & 1.46\\
SPR & 0.5 & 0.55 & 0.6 & 0.65 & 0.7 & 0.8 & 0.9 & 0.59 & 1 & - & -\\
T\textsubscript{TARGET} & 2072 & 2060 & 2057 & 2053 & 2051 & 2048 & 2046 & 2058 & 2045 & 2056 & 2060\\
T\textsubscript{MAX} & 2071 & 2071 & 2071 & 2071 & 2071 & 2071 & 2071 & 2071 & 2071 & 2071 & 2071\\
Probability of recovery by T\textsubscript{MAX} & 0.487 & 0.726 & 0.798 & 0.867 & 0.911 & 0.974 & 0.995 & 0.767 & 0.999 & 0.834 & 0.726\\*
\end{longtable}
\endgroup{}
\end{landscape}
\endgroup{}

\clearpage


## Rebuilding time series 

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}}
\caption{(\#tab:prob-mat)Probability of recovery by year for rebuilding strategies. Probabilities represent the proportion of simulations that reach the target biomass by the specified year.}\\
\toprule
Year & SPR= .500       & SPR= .550 & SPR= .600       & SPR= .650 & SPR= .700       & SPR= .800       & SPR= .900       & Yr= T\textsubscript{MID} & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:prob-mat)Probability of recovery by year for rebuilding strategies. Probabilities represent the proportion of simulations that reach the target biomass by the specified year. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .550 & SPR= .600       & SPR= .650 & SPR= .700       & SPR= .800       & SPR= .900       & Yr= T\textsubscript{MID} & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2022 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2023 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2024 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2025 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2026 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2027 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2028 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2029 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2030 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.001 & 0.001 & 0.000 & 0.001 & 0.000 & 0.000\\
2031 & 0.000 & 0.001 & 0.001 & 0.001 & 0.001 & 0.002 & 0.004 & 0.001 & 0.004 & 0.001 & 0.001\\
2032 & 0.001 & 0.001 & 0.001 & 0.002 & 0.003 & 0.005 & 0.012 & 0.001 & 0.016 & 0.001 & 0.001\\
2033 & 0.001 & 0.001 & 0.002 & 0.005 & 0.009 & 0.018 & 0.033 & 0.002 & 0.048 & 0.003 & 0.001\\
2034 & 0.002 & 0.003 & 0.008 & 0.015 & 0.022 & 0.041 & 0.064 & 0.006 & 0.099 & 0.009 & 0.003\\
2035 & 0.004 & 0.013 & 0.017 & 0.029 & 0.042 & 0.067 & 0.112 & 0.015 & 0.159 & 0.017 & 0.013\\
2036 & 0.009 & 0.021 & 0.030 & 0.043 & 0.057 & 0.104 & 0.154 & 0.027 & 0.200 & 0.030 & 0.020\\
2037 & 0.013 & 0.028 & 0.034 & 0.057 & 0.082 & 0.142 & 0.190 & 0.031 & 0.222 & 0.032 & 0.028\\
2038 & 0.019 & 0.032 & 0.050 & 0.076 & 0.108 & 0.171 & 0.219 & 0.044 & 0.235 & 0.047 & 0.032\\
2039 & 0.023 & 0.042 & 0.067 & 0.097 & 0.132 & 0.194 & 0.238 & 0.058 & 0.254 & 0.061 & 0.042\\
2040 & 0.026 & 0.056 & 0.080 & 0.115 & 0.152 & 0.224 & 0.251 & 0.072 & 0.281 & 0.077 & 0.056\\
2041 & 0.031 & 0.074 & 0.097 & 0.139 & 0.180 & 0.251 & 0.285 & 0.084 & 0.320 & 0.090 & 0.073\\
2042 & 0.039 & 0.082 & 0.116 & 0.160 & 0.212 & 0.271 & 0.320 & 0.102 & 0.368 & 0.115 & 0.082\\
2043 & 0.048 & 0.107 & 0.127 & 0.187 & 0.240 & 0.310 & 0.367 & 0.120 & 0.416 & 0.131 & 0.106\\
2044 & 0.059 & 0.118 & 0.153 & 0.216 & 0.267 & 0.345 & 0.416 & 0.135 & 0.473 & 0.153 & 0.118\\
2045 & 0.067 & 0.130 & 0.179 & 0.249 & 0.296 & 0.383 & 0.455 & 0.152 & 0.542 & 0.183 & 0.130\\
2046 & 0.078 & 0.146 & 0.209 & 0.273 & 0.340 & 0.427 & 0.523 & 0.181 & 0.603 & 0.213 & 0.145\\
2047 & 0.088 & 0.170 & 0.230 & 0.308 & 0.370 & 0.475 & 0.579 & 0.206 & 0.643 & 0.246 & 0.170\\
2048 & 0.101 & 0.197 & 0.260 & 0.341 & 0.403 & 0.527 & 0.617 & 0.233 & 0.692 & 0.284 & 0.196\\
2049 & 0.119 & 0.218 & 0.286 & 0.367 & 0.438 & 0.575 & 0.657 & 0.261 & 0.718 & 0.312 & 0.217\\
2050 & 0.127 & 0.253 & 0.316 & 0.401 & 0.489 & 0.609 & 0.694 & 0.283 & 0.733 & 0.337 & 0.252\\
2051 & 0.143 & 0.274 & 0.338 & 0.440 & 0.525 & 0.644 & 0.718 & 0.317 & 0.737 & 0.372 & 0.272\\
2052 & 0.158 & 0.298 & 0.365 & 0.471 & 0.550 & 0.679 & 0.729 & 0.337 & 0.743 & 0.402 & 0.298\\
2053 & 0.172 & 0.326 & 0.407 & 0.500 & 0.589 & 0.701 & 0.737 & 0.370 & 0.747 & 0.437 & 0.325\\
2054 & 0.181 & 0.363 & 0.434 & 0.532 & 0.626 & 0.717 & 0.741 & 0.404 & 0.755 & 0.463 & 0.362\\
2055 & 0.206 & 0.390 & 0.463 & 0.568 & 0.650 & 0.728 & 0.749 & 0.426 & 0.766 & 0.483 & 0.390\\
2056 & 0.224 & 0.416 & 0.486 & 0.602 & 0.670 & 0.736 & 0.758 & 0.457 & 0.784 & 0.518 & 0.416\\
2057 & 0.244 & 0.446 & 0.515 & 0.622 & 0.694 & 0.746 & 0.770 & 0.477 & 0.803 & 0.555 & 0.446\\
2058 & 0.261 & 0.467 & 0.544 & 0.646 & 0.711 & 0.759 & 0.791 & 0.500 & 0.825 & 0.579 & 0.467\\
2059 & 0.284 & 0.491 & 0.580 & 0.665 & 0.722 & 0.768 & 0.808 & 0.534 & 0.851 & 0.602 & 0.491\\
2060 & 0.293 & 0.518 & 0.601 & 0.684 & 0.734 & 0.785 & 0.834 & 0.565 & 0.884 & 0.625 & 0.518\\
2061 & 0.320 & 0.543 & 0.633 & 0.704 & 0.746 & 0.801 & 0.858 & 0.590 & 0.906 & 0.650 & 0.542\\
2062 & 0.332 & 0.567 & 0.648 & 0.721 & 0.759 & 0.824 & 0.883 & 0.620 & 0.924 & 0.667 & 0.567\\
2063 & 0.350 & 0.598 & 0.665 & 0.737 & 0.773 & 0.849 & 0.909 & 0.635 & 0.947 & 0.687 & 0.598\\
2064 & 0.369 & 0.615 & 0.686 & 0.750 & 0.790 & 0.873 & 0.923 & 0.655 & 0.959 & 0.715 & 0.615\\
2065 & 0.391 & 0.628 & 0.705 & 0.766 & 0.805 & 0.892 & 0.945 & 0.679 & 0.969 & 0.736 & 0.628\\
2066 & 0.402 & 0.651 & 0.719 & 0.783 & 0.829 & 0.910 & 0.952 & 0.699 & 0.982 & 0.753 & 0.651\\
2067 & 0.422 & 0.674 & 0.733 & 0.797 & 0.859 & 0.934 & 0.962 & 0.706 & 0.991 & 0.770 & 0.674\\
2068 & 0.439 & 0.688 & 0.747 & 0.819 & 0.875 & 0.943 & 0.970 & 0.718 & 0.994 & 0.794 & 0.688\\
2069 & 0.460 & 0.702 & 0.757 & 0.836 & 0.886 & 0.952 & 0.989 & 0.730 & 0.999 & 0.810 & 0.702\\
2070 & 0.473 & 0.714 & 0.781 & 0.852 & 0.900 & 0.963 & 0.993 & 0.748 & 0.999 & 0.819 & 0.713\\
2071 & 0.487 & 0.726 & 0.798 & 0.867 & 0.911 & 0.974 & 0.995 & 0.767 & 0.999 & 0.834 & 0.726\\*
\end{longtable}
\endgroup{}
\endgroup{}

\clearpage


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}}
\caption{(\#tab:acl-mat)Catches (mt) by year for rebuilding strategies. Catches in 2021--2024 for all strategies were set at values recommended by the Groundfish Management Team.}\\
\toprule
Year & SPR= .500       & SPR= .550 & SPR= .600       & SPR= .650 & SPR= .700       & SPR= .800       & SPR= .900       & Yr= T\textsubscript{MID} & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:acl-mat)Catches (mt) by year for rebuilding strategies. Catches in 2021--2024 for all strategies were set at values recommended by the Groundfish Management Team. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .550 & SPR= .600       & SPR= .650 & SPR= .700       & SPR= .800       & SPR= .900       & Yr= T\textsubscript{MID} & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 15.58 & 15.58 & 15.58 & 15.58 & 15.58 & 15.58 & 15.58 & 15.58 & 15.58 & 15.58 & 15.58\\
2022 & 18.11 & 18.11 & 18.11 & 18.11 & 18.11 & 18.11 & 18.11 & 18.11 & 18.11 & 18.11 & 18.11\\
2023 & 11.12 & 11.12 & 11.12 & 11.12 & 11.12 & 11.12 & 11.12 & 11.12 & 11.12 & 11.12 & 11.12\\
2024 & 10.62 & 10.62 & 10.62 & 10.62 & 10.62 & 10.62 & 10.62 & 10.62 & 10.62 & 10.62 & 10.62\\
2025 & 1.48 & 1.24 & 1.02 & 0.84 & 0.68 & 0.40 & 0.18 & 1.08 & 0.00 & 0.00 & 1.27\\
2026 & 1.71 & 1.43 & 1.20 & 0.98 & 0.80 & 0.48 & 0.22 & 1.26 & 0.00 & 0.00 & 1.46\\
2027 & 1.94 & 1.64 & 1.37 & 1.13 & 0.92 & 0.56 & 0.25 & 1.44 & 0.00 & 0.00 & 1.65\\
2028 & 2.15 & 1.82 & 1.54 & 1.27 & 1.04 & 0.63 & 0.29 & 1.62 & 0.00 & 0.36 & 1.82\\
2029 & 2.35 & 1.98 & 1.69 & 1.41 & 1.15 & 0.70 & 0.32 & 1.78 & 0.00 & 0.70 & 1.98\\
2030 & 2.54 & 2.13 & 1.84 & 1.54 & 1.26 & 0.77 & 0.36 & 1.93 & 0.00 & 1.00 & 2.13\\
2031 & 2.70 & 2.26 & 1.98 & 1.66 & 1.37 & 0.84 & 0.39 & 2.08 & 0.00 & 1.27 & 2.26\\
2032 & 2.87 & 2.39 & 2.11 & 1.78 & 1.47 & 0.91 & 0.42 & 2.22 & 0.00 & 1.52 & 2.39\\
2033 & 3.04 & 2.52 & 2.26 & 1.91 & 1.58 & 0.98 & 0.46 & 2.37 & 0.00 & 1.77 & 2.52\\
2034 & 3.19 & 2.63 & 2.39 & 2.02 & 1.68 & 1.05 & 0.49 & 2.50 & 0.00 & 1.97 & 2.63\\
2035 & 3.36 & 2.76 & 2.53 & 2.15 & 1.79 & 1.12 & 0.53 & 2.64 & 0.00 & 2.20 & 2.76\\
2036 & 3.53 & 2.90 & 2.67 & 2.27 & 1.90 & 1.20 & 0.57 & 2.79 & 0.00 & 2.43 & 2.90\\
2037 & 3.69 & 3.05 & 2.82 & 2.40 & 2.00 & 1.27 & 0.60 & 2.94 & 0.00 & 2.67 & 3.05\\
2038 & 3.86 & 3.20 & 2.95 & 2.52 & 2.11 & 1.34 & 0.64 & 3.08 & 0.00 & 2.89 & 3.20\\
2039 & 4.01 & 3.34 & 3.09 & 2.65 & 2.22 & 1.41 & 0.68 & 3.22 & 0.00 & 3.11 & 3.34\\
2040 & 4.15 & 3.48 & 3.22 & 2.77 & 2.33 & 1.49 & 0.71 & 3.36 & 0.00 & 3.32 & 3.48\\
2041 & 4.32 & 3.64 & 3.37 & 2.90 & 2.44 & 1.56 & 0.75 & 3.50 & 0.00 & 3.53 & 3.64\\
2042 & 4.50 & 3.80 & 3.52 & 3.03 & 2.56 & 1.65 & 0.79 & 3.66 & 0.00 & 3.75 & 3.80\\
2043 & 4.64 & 3.93 & 3.65 & 3.15 & 2.66 & 1.72 & 0.83 & 3.79 & 0.00 & 3.95 & 3.93\\
2044 & 4.81 & 4.09 & 3.79 & 3.28 & 2.77 & 1.79 & 0.87 & 3.94 & 0.00 & 4.18 & 4.08\\
2045 & 4.96 & 4.23 & 3.93 & 3.40 & 2.88 & 1.87 & 0.90 & 4.08 & 0.00 & 4.36 & 4.23\\
2046 & 5.14 & 4.39 & 4.07 & 3.54 & 3.00 & 1.95 & 0.94 & 4.23 & 0.00 & 4.56 & 4.38\\
2047 & 5.28 & 4.53 & 4.21 & 3.66 & 3.11 & 2.02 & 0.98 & 4.37 & 0.00 & 4.75 & 4.52\\
2048 & 5.42 & 4.66 & 4.34 & 3.78 & 3.21 & 2.09 & 1.02 & 4.50 & 0.00 & 4.90 & 4.66\\
2049 & 5.59 & 4.81 & 4.48 & 3.90 & 3.32 & 2.17 & 1.06 & 4.64 & 0.00 & 5.08 & 4.81\\
2050 & 5.68 & 4.91 & 4.57 & 4.00 & 3.41 & 2.24 & 1.10 & 4.74 & 0.00 & 5.21 & 4.91\\
2051 & 5.80 & 5.01 & 4.67 & 4.09 & 3.49 & 2.29 & 1.13 & 4.84 & 0.00 & 5.35 & 5.01\\
2052 & 5.92 & 5.13 & 4.79 & 4.20 & 3.59 & 2.36 & 1.16 & 4.96 & 0.00 & 5.46 & 5.13\\
2053 & 6.02 & 5.25 & 4.91 & 4.30 & 3.67 & 2.42 & 1.19 & 5.08 & 0.00 & 5.57 & 5.25\\
2054 & 6.13 & 5.35 & 5.00 & 4.39 & 3.76 & 2.49 & 1.22 & 5.17 & 0.00 & 5.71 & 5.35\\
2055 & 6.22 & 5.43 & 5.07 & 4.45 & 3.83 & 2.54 & 1.25 & 5.25 & 0.00 & 5.79 & 5.43\\
2056 & 6.34 & 5.54 & 5.18 & 4.56 & 3.91 & 2.59 & 1.28 & 5.35 & 0.00 & 5.91 & 5.54\\
2057 & 6.43 & 5.63 & 5.27 & 4.62 & 3.98 & 2.64 & 1.31 & 5.44 & 0.00 & 6.01 & 5.63\\
2058 & 6.53 & 5.72 & 5.35 & 4.71 & 4.05 & 2.69 & 1.33 & 5.54 & 0.00 & 6.10 & 5.72\\
2059 & 6.63 & 5.82 & 5.45 & 4.81 & 4.13 & 2.75 & 1.36 & 5.63 & 0.00 & 6.16 & 5.82\\
2060 & 6.72 & 5.92 & 5.55 & 4.89 & 4.20 & 2.80 & 1.39 & 5.73 & 0.00 & 6.24 & 5.92\\
2061 & 6.77 & 5.97 & 5.60 & 4.94 & 4.26 & 2.85 & 1.42 & 5.79 & 0.00 & 6.26 & 5.97\\
2062 & 6.82 & 6.02 & 5.64 & 4.99 & 4.31 & 2.88 & 1.44 & 5.83 & 0.00 & 6.32 & 6.02\\
2063 & 6.90 & 6.10 & 5.72 & 5.05 & 4.36 & 2.92 & 1.45 & 5.91 & 0.00 & 6.37 & 6.10\\
2064 & 6.95 & 6.15 & 5.78 & 5.11 & 4.42 & 2.96 & 1.48 & 5.97 & 0.00 & 6.40 & 6.14\\
2065 & 7.03 & 6.23 & 5.84 & 5.17 & 4.47 & 3.01 & 1.50 & 6.03 & 0.00 & 6.47 & 6.23\\
2066 & 7.07 & 6.27 & 5.90 & 5.22 & 4.51 & 3.04 & 1.52 & 6.08 & 0.00 & 6.50 & 6.27\\
2067 & 7.14 & 6.33 & 5.94 & 5.26 & 4.56 & 3.07 & 1.54 & 6.13 & 0.00 & 6.55 & 6.33\\
2068 & 7.16 & 6.37 & 5.99 & 5.33 & 4.61 & 3.10 & 1.55 & 6.18 & 0.00 & 6.60 & 6.37\\
2069 & 7.21 & 6.40 & 6.02 & 5.34 & 4.63 & 3.13 & 1.57 & 6.21 & 0.00 & 6.63 & 6.40\\
2070 & 7.27 & 6.48 & 6.09 & 5.40 & 4.68 & 3.15 & 1.58 & 6.28 & 0.00 & 6.69 & 6.48\\
2071 & 7.30 & 6.51 & 6.13 & 5.43 & 4.71 & 3.19 & 1.60 & 6.32 & 0.00 & 6.70 & 6.51\\*
\end{longtable}
\endgroup{}
\endgroup{}

\clearpage


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}}
\caption{(\#tab:ofl-mat)OFLs (mt) by year for rebuilding strategies.}\\
\toprule
Year & SPR= .500       & SPR= .550 & SPR= .600       & SPR= .650 & SPR= .700       & SPR= .800       & SPR= .900       & Yr= T\textsubscript{MID} & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:ofl-mat)OFLs (mt) by year for rebuilding strategies. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .550 & SPR= .600       & SPR= .650 & SPR= .700       & SPR= .800       & SPR= .900       & Yr= T\textsubscript{MID} & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37\\
2022 & 1.99 & 1.99 & 1.99 & 1.99 & 1.99 & 1.99 & 1.99 & 1.99 & 1.99 & 1.99 & 1.99\\
2023 & 1.56 & 1.56 & 1.56 & 1.56 & 1.56 & 1.56 & 1.56 & 1.56 & 1.56 & 1.56 & 1.56\\
2024 & 1.40 & 1.40 & 1.40 & 1.40 & 1.40 & 1.40 & 1.40 & 1.40 & 1.40 & 1.40 & 1.40\\
2025 & 1.48 & 1.48 & 1.48 & 1.48 & 1.48 & 1.48 & 1.48 & 1.48 & 1.48 & 1.48 & 1.48\\
2026 & 1.71 & 1.72 & 1.73 & 1.73 & 1.74 & 1.76 & 1.77 & 1.73 & 1.77 & 1.77 & 1.72\\
2027 & 1.94 & 1.96 & 1.99 & 2.00 & 2.01 & 2.03 & 2.06 & 1.97 & 2.07 & 2.07 & 1.96\\
2028 & 2.15 & 2.18 & 2.22 & 2.24 & 2.27 & 2.32 & 2.34 & 2.21 & 2.38 & 2.38 & 2.18\\
2029 & 2.35 & 2.40 & 2.45 & 2.48 & 2.52 & 2.58 & 2.63 & 2.43 & 2.66 & 2.65 & 2.40\\
2030 & 2.54 & 2.60 & 2.67 & 2.71 & 2.75 & 2.84 & 2.90 & 2.64 & 2.95 & 2.91 & 2.60\\
2031 & 2.70 & 2.79 & 2.86 & 2.93 & 2.98 & 3.09 & 3.16 & 2.84 & 3.23 & 3.15 & 2.79\\
2032 & 2.87 & 2.98 & 3.05 & 3.14 & 3.20 & 3.33 & 3.42 & 3.03 & 3.51 & 3.37 & 2.98\\
2033 & 3.04 & 3.17 & 3.27 & 3.36 & 3.45 & 3.60 & 3.72 & 3.25 & 3.82 & 3.61 & 3.17\\
2034 & 3.19 & 3.34 & 3.45 & 3.55 & 3.65 & 3.83 & 3.97 & 3.41 & 4.10 & 3.82 & 3.34\\
2035 & 3.36 & 3.54 & 3.65 & 3.78 & 3.90 & 4.10 & 4.27 & 3.62 & 4.42 & 4.06 & 3.54\\
2036 & 3.53 & 3.73 & 3.87 & 4.01 & 4.14 & 4.37 & 4.56 & 3.82 & 4.73 & 4.29 & 3.73\\
2037 & 3.69 & 3.92 & 4.06 & 4.23 & 4.37 & 4.64 & 4.87 & 4.01 & 5.06 & 4.50 & 3.92\\
2038 & 3.86 & 4.11 & 4.27 & 4.45 & 4.61 & 4.90 & 5.14 & 4.22 & 5.37 & 4.72 & 4.11\\
2039 & 4.01 & 4.29 & 4.46 & 4.67 & 4.85 & 5.17 & 5.45 & 4.41 & 5.69 & 4.91 & 4.29\\
2040 & 4.15 & 4.47 & 4.65 & 4.87 & 5.08 & 5.44 & 5.75 & 4.59 & 6.02 & 5.12 & 4.47\\
2041 & 4.32 & 4.68 & 4.86 & 5.10 & 5.32 & 5.71 & 6.05 & 4.79 & 6.35 & 5.32 & 4.68\\
2042 & 4.50 & 4.88 & 5.08 & 5.35 & 5.58 & 6.02 & 6.40 & 5.00 & 6.74 & 5.53 & 4.88\\
2043 & 4.64 & 5.05 & 5.27 & 5.55 & 5.81 & 6.27 & 6.68 & 5.18 & 7.04 & 5.71 & 5.05\\
2044 & 4.81 & 5.26 & 5.48 & 5.77 & 6.05 & 6.56 & 6.99 & 5.40 & 7.38 & 5.93 & 5.24\\
2045 & 4.96 & 5.44 & 5.68 & 5.99 & 6.27 & 6.81 & 7.29 & 5.58 & 7.71 & 6.09 & 5.44\\
2046 & 5.14 & 5.64 & 5.89 & 6.23 & 6.54 & 7.11 & 7.62 & 5.78 & 8.06 & 6.30 & 5.63\\
2047 & 5.28 & 5.82 & 6.09 & 6.45 & 6.79 & 7.39 & 7.93 & 5.98 & 8.42 & 6.48 & 5.81\\
2048 & 5.42 & 5.99 & 6.27 & 6.65 & 7.01 & 7.65 & 8.23 & 6.16 & 8.75 & 6.63 & 5.99\\
2049 & 5.59 & 6.18 & 6.47 & 6.88 & 7.24 & 7.93 & 8.52 & 6.35 & 9.07 & 6.80 & 6.18\\
2050 & 5.68 & 6.31 & 6.61 & 7.04 & 7.44 & 8.17 & 8.83 & 6.48 & 9.41 & 6.93 & 6.31\\
2051 & 5.80 & 6.44 & 6.75 & 7.21 & 7.62 & 8.37 & 9.07 & 6.62 & 9.69 & 7.04 & 6.44\\
2052 & 5.92 & 6.59 & 6.93 & 7.39 & 7.83 & 8.64 & 9.34 & 6.79 & 9.99 & 7.16 & 6.59\\
2053 & 6.02 & 6.75 & 7.10 & 7.57 & 8.01 & 8.86 & 9.61 & 6.95 & 10.31 & 7.26 & 6.75\\
2054 & 6.13 & 6.88 & 7.22 & 7.72 & 8.20 & 9.09 & 9.87 & 7.07 & 10.59 & 7.38 & 6.88\\
2055 & 6.22 & 6.98 & 7.33 & 7.84 & 8.35 & 9.28 & 10.12 & 7.17 & 10.86 & 7.47 & 6.98\\
2056 & 6.34 & 7.12 & 7.48 & 8.02 & 8.53 & 9.47 & 10.33 & 7.33 & 11.11 & 7.61 & 7.12\\
2057 & 6.43 & 7.24 & 7.61 & 8.14 & 8.69 & 9.65 & 10.55 & 7.44 & 11.35 & 7.72 & 7.24\\
2058 & 6.53 & 7.35 & 7.74 & 8.30 & 8.83 & 9.83 & 10.76 & 7.57 & 11.59 & 7.84 & 7.35\\
2059 & 6.63 & 7.48 & 7.88 & 8.46 & 9.01 & 10.05 & 11.00 & 7.70 & 11.84 & 7.93 & 7.48\\
2060 & 6.72 & 7.61 & 8.01 & 8.61 & 9.16 & 10.23 & 11.21 & 7.83 & 12.12 & 8.02 & 7.61\\
2061 & 6.77 & 7.67 & 8.10 & 8.70 & 9.29 & 10.41 & 11.43 & 7.92 & 12.35 & 8.05 & 7.67\\
2062 & 6.82 & 7.74 & 8.15 & 8.78 & 9.41 & 10.53 & 11.59 & 7.97 & 12.56 & 8.14 & 7.74\\
2063 & 6.90 & 7.84 & 8.26 & 8.89 & 9.52 & 10.68 & 11.72 & 8.08 & 12.75 & 8.20 & 7.84\\
2064 & 6.95 & 7.90 & 8.35 & 9.00 & 9.64 & 10.82 & 11.93 & 8.16 & 12.94 & 8.23 & 7.89\\
2065 & 7.03 & 8.01 & 8.43 & 9.11 & 9.76 & 10.98 & 12.11 & 8.24 & 13.14 & 8.32 & 8.01\\
2066 & 7.07 & 8.06 & 8.52 & 9.19 & 9.85 & 11.09 & 12.25 & 8.32 & 13.33 & 8.35 & 8.06\\
2067 & 7.14 & 8.14 & 8.57 & 9.27 & 9.95 & 11.21 & 12.38 & 8.38 & 13.47 & 8.42 & 8.14\\
2068 & 7.16 & 8.19 & 8.65 & 9.38 & 10.05 & 11.34 & 12.52 & 8.44 & 13.64 & 8.48 & 8.19\\
2069 & 7.21 & 8.23 & 8.70 & 9.40 & 10.09 & 11.44 & 12.66 & 8.50 & 13.78 & 8.52 & 8.23\\
2070 & 7.27 & 8.33 & 8.80 & 9.50 & 10.21 & 11.52 & 12.78 & 8.59 & 13.93 & 8.60 & 8.33\\
2071 & 7.30 & 8.37 & 8.84 & 9.56 & 10.27 & 11.65 & 12.90 & 8.64 & 14.07 & 8.61 & 8.37\\*
\end{longtable}
\endgroup{}
\endgroup{}

\clearpage


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}>{\raggedright\arraybackslash}p{0.92cm}}
\caption{(\#tab:rel-ssb-mat)Spawning output relative to the 40 percent of unfished spawning output target by year for rebuilding strategies.}\\
\toprule
Year & SPR= .500       & SPR= .550 & SPR= .600       & SPR= .650 & SPR= .700       & SPR= .800       & SPR= .900       & Yr= T\textsubscript{MID} & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:rel-ssb-mat)Spawning output relative to the 40 percent of unfished spawning output target by year for rebuilding strategies. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .550 & SPR= .600       & SPR= .650 & SPR= .700       & SPR= .800       & SPR= .900       & Yr= T\textsubscript{MID} & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35\\
2022 & 0.29 & 0.29 & 0.29 & 0.29 & 0.29 & 0.29 & 0.29 & 0.29 & 0.29 & 0.29 & 0.29\\
2023 & 0.22 & 0.22 & 0.22 & 0.22 & 0.22 & 0.22 & 0.22 & 0.22 & 0.22 & 0.22 & 0.22\\
2024 & 0.19 & 0.19 & 0.19 & 0.19 & 0.19 & 0.19 & 0.19 & 0.19 & 0.19 & 0.19 & 0.19\\
2025 & 0.17 & 0.17 & 0.17 & 0.17 & 0.17 & 0.17 & 0.17 & 0.17 & 0.17 & 0.17 & 0.17\\
2026 & 0.20 & 0.20 & 0.20 & 0.20 & 0.20 & 0.21 & 0.21 & 0.20 & 0.21 & 0.21 & 0.20\\
2027 & 0.23 & 0.23 & 0.24 & 0.24 & 0.24 & 0.24 & 0.25 & 0.24 & 0.25 & 0.25 & 0.23\\
2028 & 0.26 & 0.27 & 0.27 & 0.27 & 0.28 & 0.28 & 0.29 & 0.27 & 0.29 & 0.29 & 0.27\\
2029 & 0.29 & 0.30 & 0.30 & 0.31 & 0.31 & 0.32 & 0.33 & 0.30 & 0.33 & 0.33 & 0.30\\
2030 & 0.32 & 0.32 & 0.33 & 0.34 & 0.34 & 0.36 & 0.36 & 0.33 & 0.37 & 0.37 & 0.32\\
2031 & 0.34 & 0.35 & 0.36 & 0.37 & 0.38 & 0.39 & 0.40 & 0.36 & 0.41 & 0.40 & 0.35\\
2032 & 0.36 & 0.38 & 0.39 & 0.40 & 0.41 & 0.42 & 0.44 & 0.38 & 0.45 & 0.43 & 0.38\\
2033 & 0.38 & 0.40 & 0.41 & 0.43 & 0.44 & 0.46 & 0.47 & 0.41 & 0.49 & 0.46 & 0.40\\
2034 & 0.41 & 0.43 & 0.44 & 0.46 & 0.47 & 0.49 & 0.52 & 0.44 & 0.53 & 0.49 & 0.43\\
2035 & 0.43 & 0.45 & 0.47 & 0.48 & 0.50 & 0.53 & 0.55 & 0.46 & 0.57 & 0.52 & 0.45\\
2036 & 0.45 & 0.48 & 0.50 & 0.52 & 0.53 & 0.56 & 0.59 & 0.49 & 0.62 & 0.55 & 0.48\\
2037 & 0.47 & 0.50 & 0.52 & 0.55 & 0.57 & 0.60 & 0.63 & 0.52 & 0.66 & 0.58 & 0.50\\
2038 & 0.49 & 0.53 & 0.55 & 0.58 & 0.60 & 0.64 & 0.67 & 0.54 & 0.71 & 0.61 & 0.53\\
2039 & 0.52 & 0.56 & 0.58 & 0.61 & 0.63 & 0.68 & 0.71 & 0.57 & 0.75 & 0.64 & 0.56\\
2040 & 0.54 & 0.58 & 0.60 & 0.63 & 0.66 & 0.71 & 0.76 & 0.60 & 0.79 & 0.67 & 0.58\\
2041 & 0.56 & 0.60 & 0.63 & 0.66 & 0.70 & 0.75 & 0.80 & 0.62 & 0.84 & 0.69 & 0.60\\
2042 & 0.58 & 0.63 & 0.66 & 0.69 & 0.73 & 0.79 & 0.84 & 0.65 & 0.88 & 0.72 & 0.63\\
2043 & 0.60 & 0.66 & 0.69 & 0.73 & 0.76 & 0.83 & 0.89 & 0.68 & 0.94 & 0.75 & 0.66\\
2044 & 0.62 & 0.68 & 0.71 & 0.76 & 0.80 & 0.87 & 0.93 & 0.70 & 0.98 & 0.77 & 0.68\\
2045 & 0.64 & 0.71 & 0.74 & 0.79 & 0.83 & 0.90 & 0.97 & 0.73 & 1.03 & 0.80 & 0.71\\
2046 & 0.66 & 0.73 & 0.77 & 0.81 & 0.86 & 0.94 & 1.01 & 0.75 & 1.07 & 0.82 & 0.73\\
2047 & 0.68 & 0.76 & 0.80 & 0.85 & 0.89 & 0.98 & 1.06 & 0.78 & 1.12 & 0.85 & 0.76\\
2048 & 0.70 & 0.78 & 0.82 & 0.88 & 0.93 & 1.02 & 1.10 & 0.81 & 1.17 & 0.87 & 0.78\\
2049 & 0.72 & 0.81 & 0.85 & 0.90 & 0.96 & 1.05 & 1.14 & 0.83 & 1.22 & 0.89 & 0.81\\
2050 & 0.74 & 0.83 & 0.87 & 0.93 & 0.99 & 1.09 & 1.18 & 0.85 & 1.27 & 0.91 & 0.83\\
2051 & 0.75 & 0.85 & 0.89 & 0.95 & 1.01 & 1.13 & 1.22 & 0.87 & 1.31 & 0.92 & 0.85\\
2052 & 0.77 & 0.86 & 0.91 & 0.98 & 1.04 & 1.15 & 1.26 & 0.89 & 1.35 & 0.94 & 0.86\\
2053 & 0.78 & 0.88 & 0.93 & 1.00 & 1.06 & 1.19 & 1.29 & 0.91 & 1.39 & 0.95 & 0.88\\
2054 & 0.80 & 0.90 & 0.95 & 1.02 & 1.09 & 1.21 & 1.33 & 0.93 & 1.43 & 0.96 & 0.90\\
2055 & 0.81 & 0.92 & 0.97 & 1.04 & 1.12 & 1.25 & 1.37 & 0.95 & 1.47 & 0.98 & 0.92\\
2056 & 0.82 & 0.94 & 0.99 & 1.06 & 1.14 & 1.27 & 1.39 & 0.96 & 1.51 & 1.00 & 0.94\\
2057 & 0.83 & 0.95 & 1.00 & 1.08 & 1.16 & 1.30 & 1.43 & 0.98 & 1.55 & 1.01 & 0.95\\
2058 & 0.85 & 0.97 & 1.02 & 1.10 & 1.18 & 1.33 & 1.46 & 1.00 & 1.58 & 1.03 & 0.97\\
2059 & 0.86 & 0.98 & 1.04 & 1.12 & 1.20 & 1.35 & 1.49 & 1.01 & 1.61 & 1.04 & 0.98\\
2060 & 0.87 & 1.00 & 1.06 & 1.14 & 1.22 & 1.38 & 1.52 & 1.03 & 1.65 & 1.05 & 1.00\\
2061 & 0.88 & 1.01 & 1.07 & 1.15 & 1.24 & 1.40 & 1.55 & 1.04 & 1.69 & 1.06 & 1.01\\
2062 & 0.89 & 1.02 & 1.08 & 1.17 & 1.26 & 1.42 & 1.57 & 1.06 & 1.71 & 1.07 & 1.02\\
2063 & 0.90 & 1.03 & 1.09 & 1.19 & 1.27 & 1.44 & 1.60 & 1.07 & 1.74 & 1.08 & 1.03\\
2064 & 0.91 & 1.04 & 1.10 & 1.20 & 1.29 & 1.47 & 1.62 & 1.08 & 1.77 & 1.09 & 1.04\\
2065 & 0.92 & 1.06 & 1.12 & 1.22 & 1.31 & 1.48 & 1.65 & 1.09 & 1.80 & 1.10 & 1.06\\
2066 & 0.93 & 1.06 & 1.13 & 1.23 & 1.32 & 1.50 & 1.67 & 1.10 & 1.83 & 1.11 & 1.06\\
2067 & 0.94 & 1.08 & 1.14 & 1.24 & 1.33 & 1.52 & 1.69 & 1.11 & 1.84 & 1.12 & 1.08\\
2068 & 0.94 & 1.08 & 1.15 & 1.25 & 1.35 & 1.53 & 1.71 & 1.12 & 1.87 & 1.13 & 1.08\\
2069 & 0.95 & 1.09 & 1.16 & 1.26 & 1.36 & 1.55 & 1.72 & 1.13 & 1.89 & 1.13 & 1.09\\
2070 & 0.95 & 1.10 & 1.17 & 1.27 & 1.37 & 1.56 & 1.74 & 1.14 & 1.91 & 1.14 & 1.10\\
2071 & 0.96 & 1.11 & 1.18 & 1.29 & 1.38 & 1.58 & 1.76 & 1.15 & 1.93 & 1.15 & 1.11\\*
\end{longtable}
\endgroup{}
\endgroup{}

\clearpage

<!--chapter:end:52tables.Rmd-->

\clearpage
# Figures

<!-- Main run figures -->

![Probability of rebuilding by year for the alternative rebuilding strategies.\label{fig:prob-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up_2023rebuild/figures/rebuilding_probability_forREPORT.png){width=100% height=100% alt="Line plot of probability of recovery by year after 2021 showing 11 lines that represent each rebuilding strategy."}


![Catches (mt) by year, starting in 2025, for the alternative rebuilding strategies.\label{fig:acl-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up_2023rebuild/figures/rebuilding_acl_forREPORT.png){width=100% height=100% alt="Line plot of catches by year after 2024 showing 11 lines that represent each rebuilding strategy."}


![Spawning output relative to the management target of 40 percent of unfished spawning output by year, starting in 2025, for the alternative rebuilding strategies.\label{fig:rel-ssb-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up_2023rebuild/figures/rebuilding_relative_sb_forREPORT.png){width=100% height=100% alt="Line plot of relative spawning output by year after 2024 showing 11 lines that represent each rebuilding strategy."}


![Spawning output by year, starting in 2025, for the alternative rebuilding strategies.\label{fig:ssb-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up_2023rebuild/figures/rebuilding_ssb_forREPORT.png){width=100% height=100% alt="Line plot of spawning output by year after 2024 showing 13 lines that represent each rebuilding strategy."}

\clearpage

<!--chapter:end:53figures.Rmd-->

\clearpage
# Appendix

## Appendix A: Rebuilder data file.{#append_a}

The rebuild.dat file used for the base rebuilding analysis has been provided as a separate file.

\clearpage


<!--chapter:end:60appendix.Rmd-->

