---
geometry: margin=1in
month: "September"
year: "2021"
preamble: |
output: sa4ss::techreport_pdf
bibliography: sa4ss.bib
lang: en
papersize: a4
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
author_list: Langseth, B.J., C.R. Wetzel
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
title: Rebuilding analysis for quillback rockfish (_Sebastes maliger_) in U.S. waters off the coast of California based on the 2021 stock assessment
---

<!--chapter:end:00title.Rmd-->

\pagebreak
\pagenumbering{roman}
\setcounter{page}{1}

\renewcommand{\thetable}{\roman{table}}
\renewcommand{\thefigure}{\roman{figure}}

\setlength\parskip{0.5em plus 0.1em minus 0.2em}

<!--chapter:end:01a.Rmd-->

# Summary{-}

This rebuilding analysis is for the stock of quillback rockfish (_Sebastes maliger_) in waters off California. The analysis is based on the 2021 stock assessment. The 2021 assessment model estimated the quillback rockfish population to be at 14% of the unexploited equilibrium spawning output at the beginning of 2021. This rebuilding analysis compares the results of applying a suite of potential management actions to the stock for 2023 and beyond.

The results of the analysis show that the value for $\text{T}_\text{MIN}$, the median year for rebuilding to the target level in the absence of fishing since the year of declaration (2023), is 2042. The estimated generation time for quillback rockfish was estimated to be 27 years. In conjunction with $\text{T}_\text{MIN}$ and the mean generation time, $\text{T}_\text{MAX}$ was estimated to be 2067. The SPR = 0.537 harvest rate generates a 50% probability of recovery by $\text{T}_\text{MID}$ where $\text{T}_\text{MID}$ was set equal to 2054, an intermediate year between $\text{T}_\text{MIN}$ and $\text{T}_\text{MAX}$.


<!--chapter:end:01executive.Rmd-->

\pagebreak
\setlength{\parskip}{5mm plus1mm minus1mm}
\pagenumbering{arabic}
\setcounter{page}{1}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\setcounter{table}{0}
\setcounter{figure}{0}

\setlength\parskip{0.2em plus 0.1em minus 0.2em}

<!--chapter:end:10a.Rmd-->

# Introduction

The 2021 assessment of quillback rockfish south of Point Conception documented that the stock had declined below the Minimum Stock Size Threshold (MSST), 25% of unfished spawning output for rockfish stocks, for the first time during the mid-1980s, increased above the MSST briefly between 2010-2016, but had fallen back below the MSST starting in 2017 [@wetzel_status_2021]. Given the assumed productivity of stock combined with the longevity of quillback rockfish a range of alternative rebuilding approaches were examined with rebuilding ranging from 2042 to 2067 based on various SPR harvest rates from 0.54 to 1


# Overview of the 2021 stock assessment

The 2021 assessment of quillback rockfish assessed the stock as four separate sub-stocks along the U.S. west coast: south of Point Conception in California, north of Point Conception in California, Oregon, and Washington.  This was the first assessment of quillback rockfish conducted within Stock Synthesis that used catch and length composition data to inform model estimates around stock size and status. The previous assessment of quillback rockfish conducted in 2013 was modeled using Extended Depletion-Based Stock Reduction Analysis (XDB-SRA), a delay-difference model, using catch, catch-per-unit-effort data, and prior distributions around biological parameters [@cope_data-moderate_2013]. The 2013 assessment estimated the stock at 76% of unfished spawning output based on fits to catch-per-unit-effort and updated parameter distribution around biology (i.e., the posterior distributions). During model bridging between the 2013 to the 2021 assessment model, the large downward shift in estimated stock status in the new assessment was identified to be driven by the inclusion of the length data which implied a low relative stock size in recent years [@wetzel_status_2021]. 

The model for the area south of Point Conception in California was modeled as two fishing fleets, a commercial and a recreational fleet, along with one survey fleet, the Northwest Fisheries Science Center Hook and Line Survey (NWFSC HKL Survey). The majority of the removals and length composition data arose from the recreational fleet. Total removals of quillback rockfish south of Point Conception peaked in the late 1970s and early 1980s, decreased from the late 1980s to mid-2000s but had high annual variability, and then increased in recent years.  The stock was modeled using Stock Synthesis as a two-sex age-structured model. Area specific length-at-age and fecundity-at-length for the quillback rockfish stock south of Point Conception were estimated externally and then fixed within the model. Weight-at-length was estimated externally based upon observations by the NWFSC HKL and West Coast Groundfish Bottom Trawl Survey observations with the values fixed within the assessment model. Natural mortality and steepness were both fixed at the median or mean of the priors. The selectivity of both the commercial and recreational fishery were estimated to be domed-shape with the NWFSC HKL Survey selectivity fixed to be asymptotic. The assessment model decision table explore uncertainty around stock size and status using lower and higher log($R_0$) values relative to the base model.

\clearpage

# Management performance under rebuilding

This is the first rebuilding plan for quillback rockfish off the coast of California south of Point Conception.



<!--chapter:end:11introduction.Rmd-->

# Rebuilding calculations

This rebuilding analysis was conducted using software developed by A. Punt (version 3.12h, August 2021). The steps followed were: 

\begin{itemize}
	\item Define how equilibrium spawning output ($\text{SB}_0$) will be calculated. 
	\item Define how future recruitment will be generated. 
	\item Define the fishery selectivity and allocation to be applied during rebuilding. 
	\item Decide how to include uncertainty in input parameters from the stock assessment in the rebuilding analysis. 
	\item Calculate rebuilding reference points from the most current assessment results 
	\begin{itemize}
		\item Calculate the projected year in which the stock would rebuild with a 50$\%$ probability if all future fishing mortality was eliminated ($\text{T}_\text{F}$=0).
		\item  Calculate the projected year for a 50$\%$ probability of rebuilding from the year in which the stock was first declared overfished ($\text{T}_\text{MIN}$). 
		\item Calculate the mean generation time. 
		\item Calculate the maximum allowable rebuilding time ($\text{T}_\text{MAX}$). 
	\end{itemize}
	\item Identification and analysis of alternative harvest strategies for rebuilding. 
\end{itemize}

## Definition of Equilibrium Spawning Output

The equilibrium spawning output ($\text{SB}_0$) used in this rebuilding analysis is calculated via the stock-recruitment relationship in order to be consistent with assessment model results. This level was estimated to be 110.16 millions of eggs in the base case assessment model, which dictates a rebuilding relative spawning output target ($\text{SB}_{40\%}$) of 44.07 millions of eggs (Table \ref{tab:ref-points}). 

## Generation of future recruitment

The estimated parameters of the stock recruitment relationship (unexploited equilibrium recruitment [natural log of $R_0$], and steepness [$h$]) were used to generate future recruitments in the rebuilding analysis.  The 2021 assessment model did not estimate annual recruitment deviations but uncertainty around future recruitments was generated by assuming a recruitment variability of $\sigma_R = 0.60$.

## Population biology, fishery selectivity, and removal allocations

The biological parameters used for the rebuilding projections were based on the values from the Stock Synthesis assessment model. Biological parameters in the assessment were sex-specific and constant across time.  

The selectivity used in the rebuilding analysis were obtained from 2021 assessment. Selectivity in the assesment model was constant across time for each fishing fleet. The relative allocation of catch among fleets in this rebuilding analysis was informed using the relative fishing mortality averaged over recent years (2015-2019).

## Inclusion of uncertainty

Uncertainty was included in this rebuilding analysis via 1,200 random simulations of stochastic future recruitment strengths and integration over the three states of nature across stock size, log($R_0$). The base model was given 50% of the weight and each alternative state of nature was given 25% of the weight. 


## Alternate rebuilding strategies analyzed

Assuming that a constant rate of harvest will be applied throughout a rebuilding period, the basis for rebuilding alternatives can be divided into two approaches: 1) strategies based on selection of a constant harvest rate (SPR rate), or 2) strategies based selection of a $\text{T}_\text{TARGET}$ (year for 50% probability of recovery). This rebuilding analysis presents the following alternate strategies spread among the approaches based on the selection of a SPR harvest rate or rebuilding by a selected target year:  

\begin{itemize}
	\item Apply a range of SPR values: 0.55, 0.60, 0.65, 0.70, and 0.75 
	\item Eliminate all harvest, F = 0, beginning in the next management cycle, 2023, the same as setting a constant SPR harvest rate of 1.0.
	\item Apply the ACL based on the 40:10 harvest control rule.
	\item Apply the ABC with time-varying $\sigma$.
	\item Apply SPR harvest rates that are estimated to lead to a 50$\%$ probability of recovery by alternative target years: $\text{T}_\text{MID}$, $\text{T}_\text{MAX}$, and other years between $\text{T}_\text{MIN}$ and $\text{T}_\text{MAX}$
\end{itemize}

All of the above rebuilding strategies were conducted assuming removals of 13.5 mt and 13.5 mt in 2021 and 2022. A sensitivity examining the impact of reducing removals in 2021 and 2022 to 50 mt was conducted on a subset of the alternative fixed SPR harvest rate alternative listed above.

<!--chapter:end:20rebuilding.Rmd-->

# Results

## Rebuilding reference points

Two alternative rebuilding scenarios were explored. The first set the 2021 and 2022 ACL removals at 13.5 mt and 13.5001 mt, respectively, based on values provided by the Pacific Fishery Management Council Groundfish Management Team. The second analysis explored the impact on the rebuilding plan if removals in 2021 and 2022 were reduced to  13.5 mt for both years. The following reference points reported below are based on assumed full removals of 13.5 and 13.5001 mt in 2021 and 2022.  The reference points based on assuming lower removals in 2021 and 2022 are presented as sensitivities later in the results section.

All reference points calculated based on this rebuilding analysis are given in Table \ref{tab:ref-points}. The minimum time required for rebuilding, $\text{T}_\text{MIN}$, with no fishing (F=0) starting in 2023 was estimated to be 19 years, corresponding to the stock being rebuilt by 2042, assuming the default removals for 2021 and 2022.  The mean generation time was estimated to be 27 years. The maximum time allowed for rebuilding, $\text{T}_\text{MAX}$, is defined as the $\text{T}_\text{MIN}$ plus the mean generation time for stocks that require more than 10 years to rebuild.  Quillback rockfish was unable to rebuild within 10 years so the estimated $\text{T}_\text{MAX}$ was 2067. 

## Alternative harvest projections

$\text{T}_\text{TARGET}$, $\text{SPR}_\text{TARGET}$ and $\text{P}_\text{MAX}$ are not specified since this is the first rebuilding plan for quillback rockfish and these values have not been set via the Pacific Fishery Management Council (Council) process. A rebuilding strategy is presented below based on rebuilding target year termed $\text{T}_\text{MID}$ which is set at 2054, mid-value between $\text{T}_\text{MIN}$ and $\text{T}_\text{MAX}$, along with the associated SPR harvest rate. The Council may opt to select a $\text{T}_\text{TARGET}$ earlier or later than this $\text{T}_\text{MID}$ value based on fishery, economic, or other factors.

Summary results from the rebuilding alternatives assuming removals of 13.5 and 13.5001 mt are presented in Table \ref{tab:reb-options}. Summaries of the additional alternative based on reduced removals in 2021 and 2022 are presented in Table \ref{tab:reb-options-catch} and rebuilding alternatives based on various target years are presented in Table \ref{tab:reb-options-year}.

The target rebuilding year based on the range of pre-specified SPR values between 0.55 - 0.75 ranged from 2036 - 2046 (Table \ref{tab:reb-options}). The probability of rebuilding by year steadily increased across the alternative SPR values with full rebuilding by 2046 when the lowest SPR of 0.55 was applied (Table \ref{tab:prob-mat} and Figure \ref{fig:prob-fig}). The recommended removals in 2023, the first year of rebuilding, were low ranging between 0.25 - 1.79 mt across alternative SPR values (Table \ref{tab:acl-mat}) with the recommended removals slowly increasing by year during the rebuilding period (Figure \ref{fig:acl-fig}). The estimated Overfishing Limits (OFLs) for each rebuilding alternative is given in Table \ref{tab:ofl-mat}. The change in spawning output by year relative to the spawning output target, 40% of unfished, under each of the alternative SPR values are shown by year in Table \ref{tab:rel-ssb-mat} and Figure \ref{fig:rel-ssb-fig}).

The "ABC Rule" projections were based on the adopted rockfish SPR target of 0.50 combined with a time-varying $\sigma$ and category 2 $P^*$.  The stock was estimated to rebuild by year 2054 with a probability of 0.894 (Table \ref{tab:reb-options}). Rebuilding by $\text{T}_\text{MID}$, 2054, was achieved using a SPR value of 0.537 (Table \ref{tab:reb-options}) with a 0.894 probability of rebuilding by $\text{T}_\text{MAX}$, 2067 (Table \ref{tab:prob-mat}). 

Reducing the assumed removals in 2021 and 2022 had only a limited impact on the estimated rebuilding by SPR rate (Table \ref{tab:reb-options-catch}). Reducing the removals in 2021 and 2022 decreased the minimum time for rebuilding ($\text{T}_\text{MIN}$) to 2042, two years earlier compared to the initial rebuilding alternatives.  The reduction of the $\text{T}_\text{MIN}$ resulted in a decrease in the $\text{T}_\text{MAX}$ to 2067. The probability of rebuilding, annual catches, OFLs, and relative spawning outputs by year are shown in Tables \ref{tab:prob-mat-catch} - \ref{tab:rel-ssb-mat-catch}. 

The final alternative rebuilding analysis that examined a range of specific rebuilding target years (Table \ref{tab:reb-options-year}) generally fell within alternatives explored in the initial analysis (Table \ref{tab:reb-options}) but provided additional granularity to see potential rebuilding timelines.  The probability of rebuilding, annual catches, OFLs, and relative spawning output by year are shown in Tables \ref{tab:prob-mat-year} - \ref{tab:rel-ssb-mat-year}  

<!--chapter:end:30results.Rmd-->

# Acknowledgments
Thank you to Andre Punt for quickly updating the rebuilder program to apply time-varying $\sigma$ for the Acceptable Biological Catch scenarios and thank you for his  assistance and guidance on application of the rebuilding program. 


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


<!--chapter:end:52tables.Rmd-->

\clearpage
# Figures

![Summary of data sources used in the base model.\label{fig:data-plot}](data-plot.png){width=100% height=100% alt="Summary of data sources used in the base model"}

<!--chapter:end:53figures.Rmd-->

\clearpage
# Appendix

## Rebuilder data file

The rebuild.dat file used for the SPR alternative analysis has been provided as a separate file.

<!--chapter:end:60appendix.Rmd-->

