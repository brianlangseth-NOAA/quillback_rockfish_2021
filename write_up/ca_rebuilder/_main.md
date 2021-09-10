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

<!-- ## Rebuilding reference points and summary of alternatives -->
## Rebuilding reference points

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2cm}}
\caption{(\#tab:ref-points)Summary of the rebuilding reference points.}\\
\toprule
Parameter & 2021 Assessment Values\\
\midrule
\endfirsthead
\caption[]{(\#tab:ref-points)Summary of the rebuilding reference points. \textit{(continued)}}\\
\toprule
Parameter & 2021 Assessment Values\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
SB0 (millions of eggs) & 110.16\\
SB40% (millions of eggs) & 44.07\\
SB2021 (millions of eggs) & 15.49\\
Year rebuilding begins & 2023\\
Current year & 2021\\
Tmin & 2042\\
Mean generation time (years) & 27\\
Tmax & 2067\\
Pmax & TBD\\
Ttarget & TBD\\
SPRtarget & TBD\\*
\end{longtable}
\endgroup{}
\endgroup{}

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2cm}}
\caption{(\#tab:ref-points-noABCmax)Summary of the rebuilding reference points when catch is not constrained by the ABC.}\\
\toprule
Parameter & 2021 Assessment Values\\
\midrule
\endfirsthead
\caption[]{(\#tab:ref-points-noABCmax)Summary of the rebuilding reference points when catch is not constrained by the ABC. \textit{(continued)}}\\
\toprule
Parameter & 2021 Assessment Values\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
SB0 (millions of eggs) & 110.16\\
SB40% (millions of eggs) & 44.07\\
SB2021 (millions of eggs) & 15.49\\
Year rebuilding begins & 2023\\
Current year & 2021\\
Tmin & 2042\\
Mean generation time (years) & 27\\
Tmax & 2067\\
Pmax & TBD\\
Ttarget & TBD\\
SPRtarget & TBD\\*
\end{longtable}
\endgroup{}
\endgroup{}

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2cm}}
\caption{(\#tab:ref-points-sex1)Summary of the rebuilding reference points based on an SS model with sex equal to 1.}\\
\toprule
Parameter & 2021 Assessment Values\\
\midrule
\endfirsthead
\caption[]{(\#tab:ref-points-sex1)Summary of the rebuilding reference points based on an SS model with sex equal to 1. \textit{(continued)}}\\
\toprule
Parameter & 2021 Assessment Values\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
SB0 (millions of eggs) & 110.23\\
SB40% (millions of eggs) & 44.09\\
SB2021 (millions of eggs) & 15.47\\
Year rebuilding begins & 2023\\
Current year & 2021\\
Tmin & 2042\\
Mean generation time (years) & 27\\
Tmax & 2070\\
Pmax & TBD\\
Ttarget & TBD\\
SPRtarget & TBD\\*
\end{longtable}
\endgroup{}
\endgroup{}

\clearpage

## Summary of alternatives

\begingroup\fontsize{10}{12}\selectfont

\begin{landscape}\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:reb-options)Results of rebuilding alternatives based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021-22.}\\
\toprule
 & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:reb-options)Results of rebuilding alternatives based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021-22. \textit{(continued)}}\\
\toprule
 & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 Assumed Removals (mt) & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5\\
2022 Assumed Removals (mt) & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5\\
2023 ACL (mt) & 1.79 & 1.42 & 0.94 & 0.56 & 0.25 & 1.79 & 0 & 0.04 & 1.79\\
2024 ACL (mt) & 1.95 & 1.57 & 1.05 & 0.63 & 0.29 & 1.95 & 0 & 0.33 & 1.95\\
SPR & 0.537 & 0.6 & 0.7 & 0.8 & 0.9 & 0.537 & 1 & 0.984 & 0.537\\
Ttarget & 2054 & 2051 & 2046 & 2043 & 2042 & 2054 & 2040 & 2050 & 2054\\
Tmax & 2067 & 2067 & 2067 & 2067 & 2067 & 2067 & 2067 & 2067 & 2067\\
Probability of recovery by Tmax & 0.894 & 0.959 & 0.997 & 1 & 1 & 0.894 & 1 & 0.943 & 0.894\\*
\end{longtable}
\endgroup{}
\end{landscape}
\endgroup{}


\begingroup\fontsize{10}{12}\selectfont

\begin{landscape}\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:reb-options-noABCmax)Results of rebuilding alternatives based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021-22 when catches are not constrained by the ABC.}\\
\toprule
 & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:reb-options-noABCmax)Results of rebuilding alternatives based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021-22 when catches are not constrained by the ABC. \textit{(continued)}}\\
\toprule
 & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 Assumed Removals (mt) & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5\\
2022 Assumed Removals (mt) & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5\\
2023 ACL (mt) & 2.05 & 1.42 & 0.94 & 0.56 & 0.25 & 1.64 & 0 & 0.04 & 2.05\\
2024 ACL (mt) & 2.24 & 1.57 & 1.05 & 0.63 & 0.29 & 1.81 & 0 & 0.33 & 2.24\\
SPR & 0.5 & 0.6 & 0.7 & 0.8 & 0.9 & 0.561 & 1 & 0.984 & 0.5\\
Ttarget & 2064 & 2051 & 2046 & 2043 & 2042 & 2054 & 2040 & 2050 & 2064\\
Tmax & 2067 & 2067 & 2067 & 2067 & 2067 & 2067 & 2067 & 2067 & 2067\\
Probability of recovery by Tmax & 0.596 & 0.959 & 0.997 & 1 & 1 & 0.881 & 1 & 0.943 & 0.596\\*
\end{longtable}
\endgroup{}
\end{landscape}
\endgroup{}


\begingroup\fontsize{10}{12}\selectfont

\begin{landscape}\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:reb-options-sex1)Results of rebuilding alternatives based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021-22 when based on an SS model with sex equal to 1.}\\
\toprule
 & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:reb-options-sex1)Results of rebuilding alternatives based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021-22 when based on an SS model with sex equal to 1. \textit{(continued)}}\\
\toprule
 & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 Assumed Removals (mt) & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5\\
2022 Assumed Removals (mt) & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5\\
2023 ACL (mt) & 1.79 & 1.41 & 0.93 & 0.56 & 0.25 & 1.79 & 0 & 0.03 & 1.79\\
2024 ACL (mt) & 1.95 & 1.56 & 1.04 & 0.63 & 0.28 & 1.95 & 0 & 0.33 & 1.95\\
SPR & 0.537 & 0.6 & 0.7 & 0.8 & 0.9 & 0.537 & 1 & 0.986 & 0.537\\
Ttarget & 2053 & 2051 & 2046 & 2043 & 2042 & 2053 & 2040 & 2050 & 2053\\
Tmax & 2070 & 2070 & 2070 & 2070 & 2070 & 2070 & 2070 & 2070 & 2070\\
Probability of recovery by Tmax & 0.922 & 0.977 & 0.999 & 1 & 1 & 0.922 & 1 & 0.966 & 0.922\\*
\end{longtable}
\endgroup{}
\end{landscape}
\endgroup{}

\clearpage

## Rebuilding alternative time series 

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:prob-mat)Probability of recovery by year for rebuilding SPR alternatives assuming removals of 13.5 mt in 2021 and 2022, respectively.}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:prob-mat)Probability of recovery by year for rebuilding SPR alternatives assuming removals of 13.5 mt in 2021 and 2022, respectively. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2022 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2023 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2024 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2025 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2026 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2027 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2028 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2029 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2030 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2031 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2032 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2033 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2034 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2035 & 0.00 & 0.00 & 0.00 & 0.00 & 0.01 & 0.00 & 0.01 & 0.00 & 0.00\\
2036 & 0.00 & 0.00 & 0.00 & 0.01 & 0.02 & 0.00 & 0.05 & 0.00 & 0.00\\
2037 & 0.00 & 0.00 & 0.01 & 0.02 & 0.07 & 0.00 & 0.12 & 0.00 & 0.00\\
2038 & 0.00 & 0.00 & 0.02 & 0.07 & 0.13 & 0.00 & 0.24 & 0.01 & 0.00\\
2039 & 0.00 & 0.01 & 0.05 & 0.13 & 0.24 & 0.00 & 0.36 & 0.02 & 0.00\\
2040 & 0.01 & 0.02 & 0.10 & 0.21 & 0.35 & 0.01 & 0.52 & 0.04 & 0.01\\
2041 & 0.02 & 0.05 & 0.14 & 0.30 & 0.47 & 0.02 & 0.67 & 0.07 & 0.02\\
2042 & 0.04 & 0.08 & 0.22 & 0.40 & 0.62 & 0.04 & 0.78 & 0.11 & 0.04\\
2043 & 0.06 & 0.11 & 0.28 & 0.51 & 0.72 & 0.06 & 0.88 & 0.15 & 0.06\\
2044 & 0.09 & 0.15 & 0.37 & 0.61 & 0.81 & 0.09 & 0.94 & 0.19 & 0.09\\
2045 & 0.11 & 0.20 & 0.45 & 0.71 & 0.89 & 0.11 & 0.97 & 0.24 & 0.11\\
2046 & 0.16 & 0.25 & 0.53 & 0.78 & 0.94 & 0.16 & 0.98 & 0.30 & 0.16\\
2047 & 0.20 & 0.29 & 0.61 & 0.86 & 0.96 & 0.20 & 0.99 & 0.34 & 0.20\\
2048 & 0.23 & 0.35 & 0.69 & 0.90 & 0.98 & 0.23 & 1.00 & 0.41 & 0.23\\
2049 & 0.28 & 0.42 & 0.75 & 0.94 & 0.98 & 0.28 & 1.00 & 0.46 & 0.28\\
2050 & 0.33 & 0.48 & 0.79 & 0.95 & 1.00 & 0.33 & 1.00 & 0.51 & 0.33\\
2051 & 0.39 & 0.52 & 0.85 & 0.97 & 1.00 & 0.39 & 1.00 & 0.57 & 0.39\\
2052 & 0.44 & 0.58 & 0.89 & 0.98 & 1.00 & 0.44 & 1.00 & 0.60 & 0.44\\
2053 & 0.50 & 0.62 & 0.91 & 0.99 & 1.00 & 0.50 & 1.00 & 0.65 & 0.50\\
2054 & 0.53 & 0.68 & 0.93 & 0.99 & 1.00 & 0.53 & 1.00 & 0.70 & 0.53\\
2055 & 0.57 & 0.72 & 0.95 & 0.99 & 1.00 & 0.57 & 1.00 & 0.73 & 0.57\\
2056 & 0.61 & 0.76 & 0.96 & 1.00 & 1.00 & 0.61 & 1.00 & 0.77 & 0.61\\
2057 & 0.66 & 0.80 & 0.97 & 1.00 & 1.00 & 0.66 & 1.00 & 0.80 & 0.66\\
2058 & 0.70 & 0.83 & 0.98 & 1.00 & 1.00 & 0.70 & 1.00 & 0.83 & 0.70\\
2059 & 0.73 & 0.85 & 0.98 & 1.00 & 1.00 & 0.73 & 1.00 & 0.84 & 0.73\\
2060 & 0.77 & 0.86 & 0.99 & 1.00 & 1.00 & 0.77 & 1.00 & 0.86 & 0.77\\
2061 & 0.79 & 0.88 & 0.99 & 1.00 & 1.00 & 0.79 & 1.00 & 0.87 & 0.79\\
2062 & 0.81 & 0.90 & 0.99 & 1.00 & 1.00 & 0.81 & 1.00 & 0.89 & 0.81\\
2063 & 0.83 & 0.91 & 0.99 & 1.00 & 1.00 & 0.83 & 1.00 & 0.90 & 0.83\\
2064 & 0.85 & 0.93 & 1.00 & 1.00 & 1.00 & 0.85 & 1.00 & 0.92 & 0.85\\
2065 & 0.87 & 0.94 & 1.00 & 1.00 & 1.00 & 0.87 & 1.00 & 0.93 & 0.87\\
2066 & 0.89 & 0.95 & 1.00 & 1.00 & 1.00 & 0.89 & 1.00 & 0.93 & 0.89\\
2067 & 0.89 & 0.96 & 1.00 & 1.00 & 1.00 & 0.89 & 1.00 & 0.94 & 0.89\\
2068 & 0.90 & 0.97 & 1.00 & 1.00 & 1.00 & 0.90 & 1.00 & 0.95 & 0.90\\
2069 & 0.91 & 0.97 & 1.00 & 1.00 & 1.00 & 0.91 & 1.00 & 0.96 & 0.91\\
2070 & 0.92 & 0.98 & 1.00 & 1.00 & 1.00 & 0.92 & 1.00 & 0.97 & 0.92\\
2071 & 0.93 & 0.98 & 1.00 & 1.00 & 1.00 & 0.93 & 1.00 & 0.97 & 0.93\\
2072 & 0.94 & 0.98 & 1.00 & 1.00 & 1.00 & 0.94 & 1.00 & 0.98 & 0.94\\
2073 & 0.94 & 0.99 & 1.00 & 1.00 & 1.00 & 0.94 & 1.00 & 0.98 & 0.94\\
2074 & 0.95 & 0.99 & 1.00 & 1.00 & 1.00 & 0.95 & 1.00 & 0.99 & 0.95\\
2075 & 0.96 & 0.99 & 1.00 & 1.00 & 1.00 & 0.96 & 1.00 & 0.99 & 0.96\\*
\end{longtable}
\endgroup{}
\endgroup{}


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:acl-mat)Catches (mt) by year for rebuilding SPR alternatives assuming removals of 13.5 mt in 2021 and 2022, respectively.}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:acl-mat)Catches (mt) by year for rebuilding SPR alternatives assuming removals of 13.5 mt in 2021 and 2022, respectively. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.5 & 13.50 & 13.50\\
2022 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.5 & 13.50 & 13.50\\
2023 & 1.79 & 1.42 & 0.94 & 0.56 & 0.25 & 1.79 & 0.0 & 0.04 & 1.79\\
2024 & 1.95 & 1.57 & 1.05 & 0.63 & 0.29 & 1.95 & 0.0 & 0.33 & 1.95\\
2025 & 2.13 & 1.74 & 1.17 & 0.71 & 0.32 & 2.13 & 0.0 & 0.67 & 2.13\\
2026 & 2.30 & 1.91 & 1.29 & 0.79 & 0.36 & 2.30 & 0.0 & 1.02 & 2.30\\
2027 & 2.47 & 2.07 & 1.41 & 0.86 & 0.40 & 2.47 & 0.0 & 1.35 & 2.47\\
2028 & 2.62 & 2.23 & 1.53 & 0.94 & 0.44 & 2.62 & 0.0 & 1.64 & 2.62\\
2029 & 2.77 & 2.39 & 1.65 & 1.02 & 0.47 & 2.77 & 0.0 & 1.92 & 2.77\\
2030 & 2.91 & 2.54 & 1.76 & 1.09 & 0.51 & 2.91 & 0.0 & 2.18 & 2.91\\
2031 & 3.04 & 2.69 & 1.88 & 1.17 & 0.55 & 3.04 & 0.0 & 2.41 & 3.04\\
2032 & 3.16 & 2.83 & 1.99 & 1.24 & 0.59 & 3.16 & 0.0 & 2.63 & 3.16\\
2033 & 3.29 & 2.97 & 2.10 & 1.32 & 0.62 & 3.29 & 0.0 & 2.84 & 3.29\\
2034 & 3.41 & 3.12 & 2.21 & 1.40 & 0.66 & 3.41 & 0.0 & 3.04 & 3.41\\
2035 & 3.53 & 3.26 & 2.32 & 1.47 & 0.70 & 3.53 & 0.0 & 3.25 & 3.53\\
2036 & 3.67 & 3.40 & 2.44 & 1.55 & 0.74 & 3.67 & 0.0 & 3.46 & 3.67\\
2037 & 3.82 & 3.55 & 2.55 & 1.63 & 0.78 & 3.82 & 0.0 & 3.67 & 3.82\\
2038 & 3.97 & 3.69 & 2.66 & 1.70 & 0.82 & 3.97 & 0.0 & 3.89 & 3.97\\
2039 & 4.10 & 3.81 & 2.76 & 1.77 & 0.85 & 4.10 & 0.0 & 4.07 & 4.10\\
2040 & 4.23 & 3.93 & 2.86 & 1.84 & 0.89 & 4.23 & 0.0 & 4.25 & 4.23\\
2041 & 4.37 & 4.07 & 2.97 & 1.91 & 0.92 & 4.37 & 0.0 & 4.43 & 4.37\\
2042 & 4.52 & 4.21 & 3.08 & 1.99 & 0.96 & 4.52 & 0.0 & 4.63 & 4.52\\
2043 & 4.65 & 4.33 & 3.18 & 2.06 & 1.00 & 4.65 & 0.0 & 4.79 & 4.65\\
2044 & 4.78 & 4.46 & 3.29 & 2.14 & 1.04 & 4.78 & 0.0 & 4.96 & 4.78\\
2045 & 4.91 & 4.58 & 3.38 & 2.20 & 1.07 & 4.91 & 0.0 & 5.13 & 4.91\\
2046 & 5.05 & 4.71 & 3.49 & 2.28 & 1.11 & 5.05 & 0.0 & 5.29 & 5.05\\
2047 & 5.18 & 4.84 & 3.59 & 2.35 & 1.15 & 5.18 & 0.0 & 5.45 & 5.18\\
2048 & 5.29 & 4.95 & 3.68 & 2.41 & 1.18 & 5.29 & 0.0 & 5.59 & 5.29\\
2049 & 5.40 & 5.05 & 3.77 & 2.48 & 1.22 & 5.40 & 0.0 & 5.72 & 5.40\\
2050 & 5.50 & 5.14 & 3.86 & 2.54 & 1.25 & 5.50 & 0.0 & 5.83 & 5.50\\
2051 & 5.62 & 5.25 & 3.93 & 2.59 & 1.28 & 5.62 & 0.0 & 5.95 & 5.62\\
2052 & 5.73 & 5.37 & 4.02 & 2.66 & 1.31 & 5.73 & 0.0 & 6.05 & 5.73\\
2053 & 5.82 & 5.45 & 4.10 & 2.72 & 1.34 & 5.82 & 0.0 & 6.11 & 5.82\\
2054 & 5.89 & 5.51 & 4.17 & 2.77 & 1.37 & 5.89 & 0.0 & 6.18 & 5.89\\
2055 & 5.96 & 5.59 & 4.23 & 2.81 & 1.39 & 5.96 & 0.0 & 6.23 & 5.96\\
2056 & 6.03 & 5.66 & 4.29 & 2.85 & 1.42 & 6.03 & 0.0 & 6.29 & 6.03\\
2057 & 6.11 & 5.73 & 4.34 & 2.90 & 1.44 & 6.11 & 0.0 & 6.37 & 6.11\\
2058 & 6.19 & 5.80 & 4.41 & 2.94 & 1.46 & 6.19 & 0.0 & 6.43 & 6.19\\
2059 & 6.27 & 5.89 & 4.48 & 2.99 & 1.49 & 6.27 & 0.0 & 6.50 & 6.27\\
2060 & 6.34 & 5.96 & 4.54 & 3.04 & 1.51 & 6.34 & 0.0 & 6.56 & 6.34\\
2061 & 6.40 & 6.02 & 4.58 & 3.07 & 1.53 & 6.40 & 0.0 & 6.62 & 6.40\\
2062 & 6.46 & 6.07 & 4.63 & 3.11 & 1.55 & 6.46 & 0.0 & 6.66 & 6.46\\
2063 & 6.51 & 6.12 & 4.68 & 3.15 & 1.57 & 6.51 & 0.0 & 6.68 & 6.51\\
2064 & 6.54 & 6.15 & 4.72 & 3.17 & 1.59 & 6.54 & 0.0 & 6.72 & 6.54\\
2065 & 6.59 & 6.19 & 4.75 & 3.20 & 1.60 & 6.59 & 0.0 & 6.77 & 6.59\\
2066 & 6.62 & 6.23 & 4.80 & 3.23 & 1.62 & 6.62 & 0.0 & 6.80 & 6.62\\
2067 & 6.66 & 6.27 & 4.82 & 3.26 & 1.64 & 6.66 & 0.0 & 6.82 & 6.66\\
2068 & 6.70 & 6.31 & 4.85 & 3.28 & 1.65 & 6.70 & 0.0 & 6.86 & 6.70\\
2069 & 6.73 & 6.34 & 4.88 & 3.31 & 1.66 & 6.73 & 0.0 & 6.87 & 6.73\\
2070 & 6.77 & 6.37 & 4.92 & 3.33 & 1.68 & 6.77 & 0.0 & 6.91 & 6.77\\
2071 & 6.81 & 6.42 & 4.95 & 3.35 & 1.69 & 6.81 & 0.0 & 6.94 & 6.81\\
2072 & 6.87 & 6.47 & 4.99 & 3.38 & 1.70 & 6.87 & 0.0 & 7.00 & 6.87\\
2073 & 6.91 & 6.50 & 5.02 & 3.41 & 1.72 & 6.91 & 0.0 & 7.02 & 6.91\\
2074 & 6.93 & 6.52 & 5.04 & 3.42 & 1.73 & 6.93 & 0.0 & 7.04 & 6.93\\
2075 & 6.97 & 6.57 & 5.08 & 3.45 & 1.74 & 6.97 & 0.0 & 7.07 & 6.97\\*
\end{longtable}
\endgroup{}
\endgroup{}


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:ofl-mat)OFLs (mt) by year for rebuilding SPR alternatives assuming removals of 13.5 mt in 2021 and 2022, respectively.}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:ofl-mat)OFLs (mt) by year for rebuilding SPR alternatives assuming removals of 13.5 mt in 2021 and 2022, respectively. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37\\
2022 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07\\
2023 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79\\
2024 & 1.95 & 1.96 & 1.98 & 1.99 & 2.00 & 1.95 & 2.01 & 2.01 & 1.95\\
2025 & 2.13 & 2.15 & 2.19 & 2.21 & 2.24 & 2.13 & 2.25 & 2.24 & 2.13\\
2026 & 2.30 & 2.34 & 2.40 & 2.44 & 2.48 & 2.30 & 2.51 & 2.47 & 2.30\\
2027 & 2.47 & 2.52 & 2.60 & 2.66 & 2.71 & 2.47 & 2.75 & 2.68 & 2.47\\
2028 & 2.62 & 2.69 & 2.79 & 2.87 & 2.93 & 2.62 & 2.99 & 2.87 & 2.62\\
2029 & 2.77 & 2.85 & 2.97 & 3.07 & 3.16 & 2.77 & 3.23 & 3.06 & 2.77\\
2030 & 2.91 & 3.00 & 3.15 & 3.27 & 3.37 & 2.91 & 3.46 & 3.22 & 2.91\\
2031 & 3.04 & 3.15 & 3.32 & 3.46 & 3.58 & 3.04 & 3.69 & 3.38 & 3.04\\
2032 & 3.16 & 3.28 & 3.48 & 3.65 & 3.79 & 3.16 & 3.91 & 3.53 & 3.16\\
2033 & 3.29 & 3.41 & 3.64 & 3.83 & 3.99 & 3.29 & 4.13 & 3.66 & 3.29\\
2034 & 3.41 & 3.55 & 3.81 & 4.02 & 4.20 & 3.41 & 4.36 & 3.81 & 3.41\\
2035 & 3.53 & 3.68 & 3.96 & 4.20 & 4.40 & 3.53 & 4.58 & 3.93 & 3.53\\
2036 & 3.67 & 3.83 & 4.14 & 4.40 & 4.63 & 3.67 & 4.83 & 4.08 & 3.67\\
2037 & 3.82 & 3.99 & 4.34 & 4.63 & 4.88 & 3.82 & 5.10 & 4.25 & 3.82\\
2038 & 3.97 & 4.14 & 4.52 & 4.84 & 5.12 & 3.97 & 5.37 & 4.40 & 3.97\\
2039 & 4.10 & 4.28 & 4.69 & 5.04 & 5.35 & 4.10 & 5.62 & 4.53 & 4.10\\
2040 & 4.23 & 4.42 & 4.86 & 5.23 & 5.57 & 4.23 & 5.86 & 4.67 & 4.23\\
2041 & 4.37 & 4.57 & 5.04 & 5.44 & 5.79 & 4.37 & 6.11 & 4.81 & 4.37\\
2042 & 4.52 & 4.73 & 5.23 & 5.66 & 6.04 & 4.52 & 6.38 & 4.95 & 4.52\\
2043 & 4.65 & 4.87 & 5.39 & 5.87 & 6.27 & 4.65 & 6.64 & 5.07 & 4.65\\
2044 & 4.78 & 5.01 & 5.58 & 6.07 & 6.51 & 4.78 & 6.90 & 5.19 & 4.78\\
2045 & 4.91 & 5.14 & 5.74 & 6.26 & 6.71 & 4.91 & 7.13 & 5.33 & 4.91\\
2046 & 5.05 & 5.30 & 5.92 & 6.48 & 6.97 & 5.05 & 7.40 & 5.44 & 5.05\\
2047 & 5.18 & 5.44 & 6.10 & 6.68 & 7.20 & 5.18 & 7.66 & 5.56 & 5.18\\
2048 & 5.29 & 5.56 & 6.24 & 6.86 & 7.42 & 5.29 & 7.90 & 5.66 & 5.29\\
2049 & 5.40 & 5.68 & 6.40 & 7.04 & 7.63 & 5.40 & 8.15 & 5.75 & 5.40\\
2050 & 5.50 & 5.78 & 6.55 & 7.21 & 7.81 & 5.50 & 8.37 & 5.84 & 5.50\\
2051 & 5.62 & 5.90 & 6.68 & 7.36 & 8.01 & 5.62 & 8.59 & 5.95 & 5.62\\
2052 & 5.73 & 6.03 & 6.83 & 7.56 & 8.21 & 5.73 & 8.80 & 6.05 & 5.73\\
2053 & 5.82 & 6.13 & 6.96 & 7.73 & 8.42 & 5.82 & 9.04 & 6.11 & 5.82\\
2054 & 5.89 & 6.19 & 7.07 & 7.86 & 8.58 & 5.89 & 9.24 & 6.18 & 5.89\\
2055 & 5.96 & 6.28 & 7.18 & 8.00 & 8.74 & 5.96 & 9.40 & 6.23 & 5.96\\
2056 & 6.03 & 6.36 & 7.28 & 8.11 & 8.88 & 6.03 & 9.59 & 6.29 & 6.03\\
2057 & 6.11 & 6.44 & 7.37 & 8.23 & 9.03 & 6.11 & 9.75 & 6.37 & 6.11\\
2058 & 6.19 & 6.52 & 7.49 & 8.37 & 9.17 & 6.19 & 9.92 & 6.43 & 6.19\\
2059 & 6.27 & 6.62 & 7.60 & 8.49 & 9.32 & 6.27 & 10.09 & 6.50 & 6.27\\
2060 & 6.34 & 6.69 & 7.70 & 8.63 & 9.48 & 6.34 & 10.26 & 6.56 & 6.34\\
2061 & 6.40 & 6.76 & 7.77 & 8.73 & 9.60 & 6.40 & 10.41 & 6.62 & 6.40\\
2062 & 6.46 & 6.82 & 7.86 & 8.83 & 9.73 & 6.46 & 10.58 & 6.66 & 6.46\\
2063 & 6.51 & 6.88 & 7.94 & 8.94 & 9.86 & 6.51 & 10.72 & 6.68 & 6.51\\
2064 & 6.54 & 6.91 & 8.01 & 9.02 & 9.95 & 6.54 & 10.83 & 6.72 & 6.54\\
2065 & 6.59 & 6.96 & 8.06 & 9.10 & 10.06 & 6.59 & 10.96 & 6.77 & 6.59\\
2066 & 6.62 & 7.00 & 8.14 & 9.19 & 10.17 & 6.62 & 11.08 & 6.80 & 6.62\\
2067 & 6.66 & 7.04 & 8.18 & 9.25 & 10.25 & 6.66 & 11.20 & 6.82 & 6.66\\
2068 & 6.70 & 7.09 & 8.24 & 9.32 & 10.36 & 6.70 & 11.31 & 6.86 & 6.70\\
2069 & 6.73 & 7.12 & 8.29 & 9.40 & 10.42 & 6.73 & 11.38 & 6.87 & 6.73\\
2070 & 6.77 & 7.16 & 8.35 & 9.47 & 10.51 & 6.77 & 11.49 & 6.91 & 6.77\\
2071 & 6.81 & 7.21 & 8.40 & 9.53 & 10.59 & 6.81 & 11.60 & 6.94 & 6.81\\
2072 & 6.87 & 7.27 & 8.48 & 9.60 & 10.67 & 6.87 & 11.67 & 7.00 & 6.87\\
2073 & 6.91 & 7.30 & 8.52 & 9.68 & 10.76 & 6.91 & 11.77 & 7.02 & 6.91\\
2074 & 6.93 & 7.33 & 8.55 & 9.72 & 10.82 & 6.93 & 11.85 & 7.04 & 6.93\\
2075 & 6.97 & 7.38 & 8.62 & 9.80 & 10.90 & 6.97 & 11.94 & 7.07 & 6.97\\*
\end{longtable}
\endgroup{}
\endgroup{}


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:rel-ssb-mat)Spawning output relative to the 40 percent of unfished spawning output target by year for rebuilding SPR alternatives assuming removals of 13.5 mt in 2021 and 2022, respectively. }\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:rel-ssb-mat)Spawning output relative to the 40 percent of unfished spawning output target by year for rebuilding SPR alternatives assuming removals of 13.5 mt in 2021 and 2022, respectively.  \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35\\
2022 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30\\
2023 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25\\
2024 & 0.28 & 0.28 & 0.28 & 0.28 & 0.28 & 0.28 & 0.29 & 0.29 & 0.28\\
2025 & 0.30 & 0.31 & 0.31 & 0.32 & 0.32 & 0.30 & 0.32 & 0.32 & 0.30\\
2026 & 0.34 & 0.34 & 0.35 & 0.36 & 0.36 & 0.34 & 0.37 & 0.36 & 0.34\\
2027 & 0.37 & 0.38 & 0.39 & 0.40 & 0.41 & 0.37 & 0.41 & 0.40 & 0.37\\
2028 & 0.40 & 0.41 & 0.42 & 0.44 & 0.45 & 0.40 & 0.46 & 0.44 & 0.40\\
2029 & 0.42 & 0.44 & 0.46 & 0.47 & 0.49 & 0.42 & 0.50 & 0.47 & 0.42\\
2030 & 0.45 & 0.47 & 0.49 & 0.51 & 0.53 & 0.45 & 0.54 & 0.50 & 0.45\\
2031 & 0.48 & 0.50 & 0.53 & 0.55 & 0.57 & 0.48 & 0.59 & 0.54 & 0.48\\
2032 & 0.51 & 0.53 & 0.56 & 0.59 & 0.61 & 0.51 & 0.63 & 0.57 & 0.51\\
2033 & 0.53 & 0.55 & 0.59 & 0.63 & 0.65 & 0.53 & 0.68 & 0.60 & 0.53\\
2034 & 0.56 & 0.58 & 0.63 & 0.66 & 0.70 & 0.56 & 0.72 & 0.63 & 0.56\\
2035 & 0.59 & 0.61 & 0.66 & 0.70 & 0.74 & 0.59 & 0.77 & 0.66 & 0.59\\
2036 & 0.61 & 0.64 & 0.70 & 0.74 & 0.78 & 0.61 & 0.82 & 0.68 & 0.61\\
2037 & 0.64 & 0.67 & 0.73 & 0.78 & 0.82 & 0.64 & 0.86 & 0.71 & 0.64\\
2038 & 0.66 & 0.70 & 0.76 & 0.82 & 0.87 & 0.66 & 0.91 & 0.74 & 0.66\\
2039 & 0.69 & 0.72 & 0.79 & 0.86 & 0.91 & 0.69 & 0.96 & 0.77 & 0.69\\
2040 & 0.71 & 0.75 & 0.82 & 0.89 & 0.95 & 0.71 & 1.01 & 0.79 & 0.71\\
2041 & 0.73 & 0.77 & 0.85 & 0.93 & 0.99 & 0.73 & 1.05 & 0.81 & 0.73\\
2042 & 0.76 & 0.80 & 0.89 & 0.96 & 1.03 & 0.76 & 1.09 & 0.84 & 0.76\\
2043 & 0.78 & 0.82 & 0.92 & 1.00 & 1.08 & 0.78 & 1.14 & 0.86 & 0.78\\
2044 & 0.81 & 0.85 & 0.95 & 1.04 & 1.12 & 0.81 & 1.19 & 0.88 & 0.81\\
2045 & 0.83 & 0.87 & 0.98 & 1.08 & 1.16 & 0.83 & 1.24 & 0.90 & 0.83\\
2046 & 0.85 & 0.90 & 1.01 & 1.11 & 1.20 & 0.85 & 1.28 & 0.93 & 0.85\\
2047 & 0.88 & 0.92 & 1.04 & 1.15 & 1.24 & 0.88 & 1.33 & 0.95 & 0.88\\
2048 & 0.90 & 0.95 & 1.07 & 1.18 & 1.28 & 0.90 & 1.37 & 0.97 & 0.90\\
2049 & 0.92 & 0.97 & 1.10 & 1.22 & 1.32 & 0.92 & 1.42 & 0.98 & 0.92\\
2050 & 0.94 & 0.99 & 1.13 & 1.25 & 1.36 & 0.94 & 1.46 & 1.00 & 0.94\\
2051 & 0.96 & 1.01 & 1.15 & 1.28 & 1.40 & 0.96 & 1.50 & 1.02 & 0.96\\
2052 & 0.98 & 1.03 & 1.17 & 1.31 & 1.43 & 0.98 & 1.54 & 1.03 & 0.98\\
2053 & 1.00 & 1.05 & 1.20 & 1.34 & 1.47 & 1.00 & 1.58 & 1.05 & 1.00\\
2054 & 1.01 & 1.07 & 1.23 & 1.37 & 1.50 & 1.01 & 1.62 & 1.06 & 1.01\\
2055 & 1.02 & 1.08 & 1.25 & 1.39 & 1.53 & 1.02 & 1.66 & 1.07 & 1.02\\
2056 & 1.04 & 1.09 & 1.26 & 1.42 & 1.56 & 1.04 & 1.69 & 1.08 & 1.04\\
2057 & 1.05 & 1.11 & 1.28 & 1.44 & 1.59 & 1.05 & 1.72 & 1.09 & 1.05\\
2058 & 1.06 & 1.12 & 1.30 & 1.46 & 1.61 & 1.06 & 1.75 & 1.11 & 1.06\\
2059 & 1.08 & 1.14 & 1.32 & 1.48 & 1.64 & 1.08 & 1.78 & 1.12 & 1.08\\
2060 & 1.09 & 1.15 & 1.34 & 1.51 & 1.66 & 1.09 & 1.81 & 1.13 & 1.09\\
2061 & 1.10 & 1.17 & 1.36 & 1.53 & 1.69 & 1.10 & 1.84 & 1.14 & 1.10\\
2062 & 1.11 & 1.18 & 1.37 & 1.55 & 1.71 & 1.11 & 1.87 & 1.15 & 1.11\\
2063 & 1.12 & 1.19 & 1.39 & 1.57 & 1.74 & 1.12 & 1.90 & 1.16 & 1.12\\
2064 & 1.13 & 1.20 & 1.40 & 1.58 & 1.76 & 1.13 & 1.92 & 1.16 & 1.13\\
2065 & 1.14 & 1.20 & 1.41 & 1.60 & 1.78 & 1.14 & 1.94 & 1.17 & 1.14\\
2066 & 1.15 & 1.21 & 1.42 & 1.62 & 1.80 & 1.15 & 1.97 & 1.18 & 1.15\\
2067 & 1.15 & 1.22 & 1.43 & 1.63 & 1.81 & 1.15 & 1.99 & 1.18 & 1.15\\
2068 & 1.16 & 1.23 & 1.44 & 1.64 & 1.83 & 1.16 & 2.01 & 1.19 & 1.16\\
2069 & 1.16 & 1.23 & 1.45 & 1.65 & 1.85 & 1.16 & 2.03 & 1.19 & 1.16\\
2070 & 1.17 & 1.24 & 1.46 & 1.67 & 1.86 & 1.17 & 2.04 & 1.19 & 1.17\\
2071 & 1.18 & 1.25 & 1.47 & 1.68 & 1.88 & 1.18 & 2.06 & 1.20 & 1.18\\
2072 & 1.19 & 1.26 & 1.48 & 1.69 & 1.89 & 1.19 & 2.08 & 1.21 & 1.19\\
2073 & 1.19 & 1.27 & 1.49 & 1.70 & 1.90 & 1.19 & 2.09 & 1.22 & 1.19\\
2074 & 1.20 & 1.27 & 1.50 & 1.72 & 1.92 & 1.20 & 2.11 & 1.22 & 1.20\\
2075 & 1.20 & 1.28 & 1.51 & 1.72 & 1.93 & 1.20 & 2.13 & 1.22 & 1.20\\*
\end{longtable}
\endgroup{}
\endgroup{}

\clearpage

## Rebuilding alternative time series when catches are not constrained by the ABC

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:prob-mat-noABCmax)Probability of recovery by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC.}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:prob-mat-noABCmax)Probability of recovery by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2022 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2023 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2024 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2025 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2026 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2027 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2028 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2029 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2030 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2031 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2032 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2033 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2034 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2035 & 0.00 & 0.00 & 0.00 & 0.00 & 0.01 & 0.00 & 0.01 & 0.00 & 0.00\\
2036 & 0.00 & 0.00 & 0.00 & 0.01 & 0.02 & 0.00 & 0.05 & 0.00 & 0.00\\
2037 & 0.00 & 0.00 & 0.01 & 0.02 & 0.07 & 0.00 & 0.12 & 0.00 & 0.00\\
2038 & 0.00 & 0.00 & 0.02 & 0.07 & 0.13 & 0.00 & 0.24 & 0.01 & 0.00\\
2039 & 0.00 & 0.01 & 0.05 & 0.13 & 0.24 & 0.00 & 0.36 & 0.02 & 0.00\\
2040 & 0.00 & 0.02 & 0.10 & 0.21 & 0.35 & 0.01 & 0.52 & 0.04 & 0.00\\
2041 & 0.00 & 0.05 & 0.14 & 0.30 & 0.47 & 0.02 & 0.67 & 0.07 & 0.00\\
2042 & 0.01 & 0.08 & 0.22 & 0.40 & 0.62 & 0.04 & 0.78 & 0.11 & 0.01\\
2043 & 0.01 & 0.11 & 0.28 & 0.51 & 0.72 & 0.06 & 0.88 & 0.15 & 0.01\\
2044 & 0.02 & 0.15 & 0.37 & 0.61 & 0.81 & 0.08 & 0.94 & 0.19 & 0.02\\
2045 & 0.03 & 0.20 & 0.45 & 0.71 & 0.89 & 0.11 & 0.97 & 0.24 & 0.03\\
2046 & 0.05 & 0.25 & 0.53 & 0.78 & 0.94 & 0.15 & 0.98 & 0.30 & 0.05\\
2047 & 0.05 & 0.29 & 0.61 & 0.86 & 0.96 & 0.20 & 0.99 & 0.34 & 0.05\\
2048 & 0.06 & 0.35 & 0.69 & 0.90 & 0.98 & 0.23 & 1.00 & 0.41 & 0.06\\
2049 & 0.09 & 0.42 & 0.75 & 0.94 & 0.98 & 0.27 & 1.00 & 0.46 & 0.09\\
2050 & 0.12 & 0.48 & 0.79 & 0.95 & 1.00 & 0.32 & 1.00 & 0.51 & 0.12\\
2051 & 0.13 & 0.52 & 0.85 & 0.97 & 1.00 & 0.38 & 1.00 & 0.57 & 0.13\\
2052 & 0.15 & 0.58 & 0.89 & 0.98 & 1.00 & 0.43 & 1.00 & 0.60 & 0.15\\
2053 & 0.18 & 0.62 & 0.91 & 0.99 & 1.00 & 0.48 & 1.00 & 0.65 & 0.18\\
2054 & 0.21 & 0.68 & 0.93 & 0.99 & 1.00 & 0.52 & 1.00 & 0.70 & 0.21\\
2055 & 0.24 & 0.72 & 0.95 & 0.99 & 1.00 & 0.55 & 1.00 & 0.73 & 0.24\\
2056 & 0.27 & 0.76 & 0.96 & 1.00 & 1.00 & 0.59 & 1.00 & 0.77 & 0.27\\
2057 & 0.30 & 0.80 & 0.97 & 1.00 & 1.00 & 0.64 & 1.00 & 0.80 & 0.30\\
2058 & 0.33 & 0.83 & 0.98 & 1.00 & 1.00 & 0.67 & 1.00 & 0.83 & 0.33\\
2059 & 0.36 & 0.85 & 0.98 & 1.00 & 1.00 & 0.72 & 1.00 & 0.84 & 0.36\\
2060 & 0.40 & 0.86 & 0.99 & 1.00 & 1.00 & 0.74 & 1.00 & 0.86 & 0.40\\
2061 & 0.43 & 0.88 & 0.99 & 1.00 & 1.00 & 0.77 & 1.00 & 0.87 & 0.43\\
2062 & 0.47 & 0.90 & 0.99 & 1.00 & 1.00 & 0.80 & 1.00 & 0.89 & 0.47\\
2063 & 0.50 & 0.91 & 0.99 & 1.00 & 1.00 & 0.82 & 1.00 & 0.90 & 0.50\\
2064 & 0.53 & 0.93 & 1.00 & 1.00 & 1.00 & 0.84 & 1.00 & 0.92 & 0.53\\
2065 & 0.55 & 0.94 & 1.00 & 1.00 & 1.00 & 0.86 & 1.00 & 0.93 & 0.55\\
2066 & 0.57 & 0.95 & 1.00 & 1.00 & 1.00 & 0.87 & 1.00 & 0.93 & 0.57\\
2067 & 0.60 & 0.96 & 1.00 & 1.00 & 1.00 & 0.88 & 1.00 & 0.94 & 0.60\\
2068 & 0.62 & 0.97 & 1.00 & 1.00 & 1.00 & 0.89 & 1.00 & 0.95 & 0.62\\
2069 & 0.64 & 0.97 & 1.00 & 1.00 & 1.00 & 0.90 & 1.00 & 0.96 & 0.64\\
2070 & 0.66 & 0.98 & 1.00 & 1.00 & 1.00 & 0.91 & 1.00 & 0.97 & 0.66\\
2071 & 0.68 & 0.98 & 1.00 & 1.00 & 1.00 & 0.92 & 1.00 & 0.97 & 0.68\\
2072 & 0.70 & 0.98 & 1.00 & 1.00 & 1.00 & 0.93 & 1.00 & 0.98 & 0.70\\
2073 & 0.70 & 0.99 & 1.00 & 1.00 & 1.00 & 0.94 & 1.00 & 0.98 & 0.70\\
2074 & 0.73 & 0.99 & 1.00 & 1.00 & 1.00 & 0.94 & 1.00 & 0.99 & 0.73\\
2075 & 0.74 & 0.99 & 1.00 & 1.00 & 1.00 & 0.95 & 1.00 & 0.99 & 0.74\\*
\end{longtable}
\endgroup{}
\endgroup{}


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:acl-mat-noABCmax)Catches (mt) by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC.}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:acl-mat-noABCmax)Catches (mt) by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.5 & 13.50 & 13.50\\
2022 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.5 & 13.50 & 13.50\\
2023 & 2.05 & 1.42 & 0.94 & 0.56 & 0.25 & 1.64 & 0.0 & 0.04 & 2.05\\
2024 & 2.24 & 1.57 & 1.05 & 0.63 & 0.29 & 1.81 & 0.0 & 0.33 & 2.24\\
2025 & 2.46 & 1.74 & 1.17 & 0.71 & 0.32 & 2.00 & 0.0 & 0.67 & 2.46\\
2026 & 2.68 & 1.91 & 1.29 & 0.79 & 0.36 & 2.19 & 0.0 & 1.02 & 2.68\\
2027 & 2.88 & 2.07 & 1.41 & 0.86 & 0.40 & 2.37 & 0.0 & 1.35 & 2.88\\
2028 & 3.07 & 2.23 & 1.53 & 0.94 & 0.44 & 2.54 & 0.0 & 1.64 & 3.07\\
2029 & 3.27 & 2.39 & 1.65 & 1.02 & 0.47 & 2.71 & 0.0 & 1.92 & 3.27\\
2030 & 3.45 & 2.54 & 1.76 & 1.09 & 0.51 & 2.88 & 0.0 & 2.18 & 3.45\\
2031 & 3.62 & 2.69 & 1.88 & 1.17 & 0.55 & 3.03 & 0.0 & 2.41 & 3.62\\
2032 & 3.78 & 2.83 & 1.99 & 1.24 & 0.59 & 3.19 & 0.0 & 2.63 & 3.78\\
2033 & 3.95 & 2.97 & 2.10 & 1.32 & 0.62 & 3.34 & 0.0 & 2.84 & 3.95\\
2034 & 4.12 & 3.12 & 2.21 & 1.40 & 0.66 & 3.50 & 0.0 & 3.04 & 4.12\\
2035 & 4.28 & 3.26 & 2.32 & 1.47 & 0.70 & 3.65 & 0.0 & 3.25 & 4.28\\
2036 & 4.44 & 3.40 & 2.44 & 1.55 & 0.74 & 3.80 & 0.0 & 3.46 & 4.44\\
2037 & 4.61 & 3.55 & 2.55 & 1.63 & 0.78 & 3.96 & 0.0 & 3.67 & 4.61\\
2038 & 4.76 & 3.69 & 2.66 & 1.70 & 0.82 & 4.10 & 0.0 & 3.89 & 4.76\\
2039 & 4.90 & 3.81 & 2.76 & 1.77 & 0.85 & 4.23 & 0.0 & 4.07 & 4.90\\
2040 & 5.03 & 3.93 & 2.86 & 1.84 & 0.89 & 4.36 & 0.0 & 4.25 & 5.03\\
2041 & 5.18 & 4.07 & 2.97 & 1.91 & 0.92 & 4.50 & 0.0 & 4.43 & 5.18\\
2042 & 5.34 & 4.21 & 3.08 & 1.99 & 0.96 & 4.65 & 0.0 & 4.63 & 5.34\\
2043 & 5.46 & 4.33 & 3.18 & 2.06 & 1.00 & 4.78 & 0.0 & 4.79 & 5.46\\
2044 & 5.61 & 4.46 & 3.29 & 2.14 & 1.04 & 4.92 & 0.0 & 4.96 & 5.61\\
2045 & 5.75 & 4.58 & 3.38 & 2.20 & 1.07 & 5.04 & 0.0 & 5.13 & 5.75\\
2046 & 5.88 & 4.71 & 3.49 & 2.28 & 1.11 & 5.18 & 0.0 & 5.29 & 5.88\\
2047 & 6.02 & 4.84 & 3.59 & 2.35 & 1.15 & 5.31 & 0.0 & 5.45 & 6.02\\
2048 & 6.13 & 4.95 & 3.68 & 2.41 & 1.18 & 5.42 & 0.0 & 5.58 & 6.13\\
2049 & 6.25 & 5.05 & 3.77 & 2.48 & 1.22 & 5.53 & 0.0 & 5.68 & 6.25\\
2050 & 6.35 & 5.14 & 3.86 & 2.54 & 1.25 & 5.63 & 0.0 & 5.79 & 6.35\\
2051 & 6.48 & 5.25 & 3.93 & 2.59 & 1.28 & 5.75 & 0.0 & 7.46 & 6.48\\
2052 & 6.59 & 5.37 & 4.02 & 2.66 & 1.31 & 5.86 & 0.0 & 7.51 & 6.59\\
2053 & 6.68 & 5.45 & 4.10 & 2.72 & 1.34 & 5.95 & 0.0 & 7.60 & 6.68\\
2054 & 6.74 & 5.51 & 4.17 & 2.77 & 1.37 & 6.02 & 0.0 & 7.67 & 6.74\\
2055 & 6.81 & 5.59 & 4.23 & 2.81 & 1.39 & 6.09 & 0.0 & 7.70 & 6.81\\
2056 & 6.88 & 5.66 & 4.29 & 2.85 & 1.42 & 6.15 & 0.0 & 7.76 & 6.88\\
2057 & 6.96 & 5.73 & 4.34 & 2.90 & 1.44 & 6.24 & 0.0 & 7.81 & 6.96\\
2058 & 7.04 & 5.80 & 4.41 & 2.94 & 1.46 & 6.32 & 0.0 & 7.85 & 7.04\\
2059 & 7.13 & 5.89 & 4.48 & 2.99 & 1.49 & 6.39 & 0.0 & 7.89 & 7.13\\
2060 & 7.19 & 5.96 & 4.54 & 3.04 & 1.51 & 6.47 & 0.0 & 7.91 & 7.19\\
2061 & 7.26 & 6.02 & 4.58 & 3.07 & 1.53 & 6.52 & 0.0 & 7.94 & 7.26\\
2062 & 7.30 & 6.07 & 4.63 & 3.11 & 1.55 & 6.58 & 0.0 & 7.97 & 7.30\\
2063 & 7.33 & 6.12 & 4.68 & 3.15 & 1.57 & 6.62 & 0.0 & 8.01 & 7.33\\
2064 & 7.38 & 6.15 & 4.72 & 3.17 & 1.59 & 6.66 & 0.0 & 8.04 & 7.38\\
2065 & 7.42 & 6.19 & 4.75 & 3.20 & 1.60 & 6.71 & 0.0 & 8.05 & 7.42\\
2066 & 7.46 & 6.23 & 4.80 & 3.23 & 1.62 & 6.74 & 0.0 & 8.08 & 7.46\\
2067 & 7.50 & 6.27 & 4.82 & 3.26 & 1.64 & 6.78 & 0.0 & 8.09 & 7.50\\
2068 & 7.53 & 6.31 & 4.85 & 3.28 & 1.65 & 6.82 & 0.0 & 8.07 & 7.53\\
2069 & 7.56 & 6.34 & 4.88 & 3.31 & 1.66 & 6.85 & 0.0 & 8.06 & 7.56\\
2070 & 7.60 & 6.37 & 4.92 & 3.33 & 1.68 & 6.89 & 0.0 & 8.09 & 7.60\\
2071 & 7.65 & 6.42 & 4.95 & 3.35 & 1.69 & 6.93 & 0.0 & 8.11 & 7.65\\
2072 & 7.71 & 6.47 & 4.99 & 3.38 & 1.70 & 6.99 & 0.0 & 8.14 & 7.71\\
2073 & 7.73 & 6.50 & 5.02 & 3.41 & 1.72 & 7.02 & 0.0 & 8.17 & 7.73\\
2074 & 7.75 & 6.52 & 5.04 & 3.42 & 1.73 & 7.04 & 0.0 & 8.20 & 7.75\\
2075 & 7.79 & 6.57 & 5.08 & 3.45 & 1.74 & 7.08 & 0.0 & 8.22 & 7.79\\*
\end{longtable}
\endgroup{}
\endgroup{}

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:ofl-mat-noABCmax)OFLs (mt) by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC.}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:ofl-mat-noABCmax)OFLs (mt) by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37 & 2.37\\
2022 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07\\
2023 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79\\
2024 & 1.94 & 1.96 & 1.98 & 1.99 & 2.00 & 1.95 & 2.01 & 2.01 & 1.94\\
2025 & 2.11 & 2.15 & 2.19 & 2.21 & 2.24 & 2.14 & 2.25 & 2.24 & 2.11\\
2026 & 2.27 & 2.34 & 2.40 & 2.44 & 2.48 & 2.32 & 2.51 & 2.47 & 2.27\\
2027 & 2.42 & 2.52 & 2.60 & 2.66 & 2.71 & 2.49 & 2.75 & 2.68 & 2.42\\
2028 & 2.56 & 2.69 & 2.79 & 2.87 & 2.93 & 2.64 & 2.99 & 2.87 & 2.56\\
2029 & 2.70 & 2.85 & 2.97 & 3.07 & 3.16 & 2.79 & 3.23 & 3.06 & 2.70\\
2030 & 2.82 & 3.00 & 3.15 & 3.27 & 3.37 & 2.94 & 3.46 & 3.22 & 2.82\\
2031 & 2.93 & 3.15 & 3.32 & 3.46 & 3.58 & 3.07 & 3.69 & 3.38 & 2.93\\
2032 & 3.04 & 3.28 & 3.48 & 3.65 & 3.79 & 3.19 & 3.91 & 3.53 & 3.04\\
2033 & 3.14 & 3.41 & 3.64 & 3.83 & 3.99 & 3.31 & 4.13 & 3.66 & 3.14\\
2034 & 3.25 & 3.55 & 3.81 & 4.02 & 4.20 & 3.44 & 4.36 & 3.81 & 3.25\\
2035 & 3.34 & 3.68 & 3.96 & 4.20 & 4.40 & 3.56 & 4.58 & 3.93 & 3.34\\
2036 & 3.46 & 3.83 & 4.14 & 4.40 & 4.63 & 3.69 & 4.83 & 4.08 & 3.46\\
2037 & 3.58 & 3.99 & 4.34 & 4.63 & 4.88 & 3.84 & 5.10 & 4.25 & 3.58\\
2038 & 3.70 & 4.14 & 4.52 & 4.84 & 5.12 & 3.98 & 5.37 & 4.40 & 3.70\\
2039 & 3.81 & 4.28 & 4.69 & 5.04 & 5.35 & 4.10 & 5.62 & 4.53 & 3.81\\
2040 & 3.91 & 4.42 & 4.86 & 5.23 & 5.57 & 4.24 & 5.86 & 4.67 & 3.91\\
2041 & 4.03 & 4.57 & 5.04 & 5.44 & 5.79 & 4.37 & 6.11 & 4.81 & 4.03\\
2042 & 4.15 & 4.73 & 5.23 & 5.66 & 6.04 & 4.51 & 6.38 & 4.95 & 4.15\\
2043 & 4.25 & 4.87 & 5.39 & 5.87 & 6.27 & 4.64 & 6.64 & 5.07 & 4.25\\
2044 & 4.37 & 5.01 & 5.58 & 6.07 & 6.51 & 4.77 & 6.90 & 5.19 & 4.37\\
2045 & 4.47 & 5.14 & 5.74 & 6.26 & 6.71 & 4.89 & 7.13 & 5.33 & 4.47\\
2046 & 4.57 & 5.30 & 5.92 & 6.48 & 6.97 & 5.03 & 7.40 & 5.44 & 4.57\\
2047 & 4.68 & 5.44 & 6.10 & 6.68 & 7.20 & 5.16 & 7.66 & 5.55 & 4.68\\
2048 & 4.77 & 5.56 & 6.24 & 6.86 & 7.42 & 5.26 & 7.90 & 5.64 & 4.77\\
2049 & 4.86 & 5.68 & 6.40 & 7.04 & 7.63 & 5.36 & 8.15 & 5.72 & 4.86\\
2050 & 4.94 & 5.78 & 6.55 & 7.21 & 7.81 & 5.47 & 8.37 & 5.80 & 4.94\\
2051 & 5.04 & 5.90 & 6.68 & 7.36 & 8.01 & 5.58 & 8.59 & 5.83 & 5.04\\
2052 & 5.13 & 6.03 & 6.83 & 7.56 & 8.21 & 5.69 & 8.80 & 5.86 & 5.13\\
2053 & 5.19 & 6.13 & 6.96 & 7.73 & 8.42 & 5.78 & 9.04 & 5.93 & 5.19\\
2054 & 5.24 & 6.19 & 7.07 & 7.86 & 8.58 & 5.84 & 9.24 & 5.97 & 5.24\\
2055 & 5.29 & 6.28 & 7.18 & 8.00 & 8.74 & 5.91 & 9.40 & 5.99 & 5.29\\
2056 & 5.35 & 6.36 & 7.28 & 8.11 & 8.88 & 5.97 & 9.59 & 6.04 & 5.35\\
2057 & 5.41 & 6.44 & 7.37 & 8.23 & 9.03 & 6.05 & 9.75 & 6.08 & 5.41\\
2058 & 5.48 & 6.52 & 7.49 & 8.37 & 9.17 & 6.13 & 9.92 & 6.11 & 5.48\\
2059 & 5.55 & 6.62 & 7.60 & 8.49 & 9.32 & 6.20 & 10.09 & 6.13 & 5.55\\
2060 & 5.59 & 6.69 & 7.70 & 8.63 & 9.48 & 6.27 & 10.26 & 6.15 & 5.59\\
2061 & 5.64 & 6.76 & 7.77 & 8.73 & 9.60 & 6.33 & 10.41 & 6.18 & 5.64\\
2062 & 5.68 & 6.82 & 7.86 & 8.83 & 9.73 & 6.38 & 10.58 & 6.20 & 5.68\\
2063 & 5.70 & 6.88 & 7.94 & 8.94 & 9.86 & 6.43 & 10.72 & 6.23 & 5.70\\
2064 & 5.74 & 6.91 & 8.01 & 9.02 & 9.95 & 6.46 & 10.83 & 6.26 & 5.74\\
2065 & 5.77 & 6.96 & 8.06 & 9.10 & 10.06 & 6.51 & 10.96 & 6.26 & 5.77\\
2066 & 5.80 & 7.00 & 8.14 & 9.19 & 10.17 & 6.54 & 11.08 & 6.28 & 5.80\\
2067 & 5.83 & 7.04 & 8.18 & 9.25 & 10.25 & 6.58 & 11.20 & 6.29 & 5.83\\
2068 & 5.86 & 7.09 & 8.24 & 9.32 & 10.36 & 6.62 & 11.31 & 6.28 & 5.86\\
2069 & 5.88 & 7.12 & 8.29 & 9.40 & 10.42 & 6.65 & 11.38 & 6.27 & 5.88\\
2070 & 5.91 & 7.16 & 8.35 & 9.47 & 10.51 & 6.69 & 11.49 & 6.29 & 5.91\\
2071 & 5.95 & 7.21 & 8.40 & 9.53 & 10.59 & 6.72 & 11.60 & 6.31 & 5.95\\
2072 & 6.00 & 7.27 & 8.48 & 9.60 & 10.67 & 6.78 & 11.67 & 6.33 & 6.00\\
2073 & 6.01 & 7.30 & 8.52 & 9.68 & 10.76 & 6.81 & 11.77 & 6.35 & 6.01\\
2074 & 6.03 & 7.33 & 8.55 & 9.72 & 10.82 & 6.83 & 11.85 & 6.38 & 6.03\\
2075 & 6.06 & 7.38 & 8.62 & 9.80 & 10.90 & 6.87 & 11.94 & 6.39 & 6.06\\*
\end{longtable}
\endgroup{}
\endgroup{}


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:rel-ssb-mat-noABCmax)Spawning output relative to the 40 percent of unfished spawning output target by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC.}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:rel-ssb-mat-noABCmax)Spawning output relative to the 40 percent of unfished spawning output target by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35\\
2022 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30\\
2023 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25\\
2024 & 0.27 & 0.28 & 0.28 & 0.28 & 0.28 & 0.28 & 0.29 & 0.29 & 0.27\\
2025 & 0.30 & 0.31 & 0.31 & 0.32 & 0.32 & 0.31 & 0.32 & 0.32 & 0.30\\
2026 & 0.33 & 0.34 & 0.35 & 0.36 & 0.36 & 0.34 & 0.37 & 0.36 & 0.33\\
2027 & 0.36 & 0.38 & 0.39 & 0.40 & 0.41 & 0.37 & 0.41 & 0.40 & 0.36\\
2028 & 0.39 & 0.41 & 0.42 & 0.44 & 0.45 & 0.40 & 0.46 & 0.44 & 0.39\\
2029 & 0.41 & 0.44 & 0.46 & 0.47 & 0.49 & 0.43 & 0.50 & 0.47 & 0.41\\
2030 & 0.44 & 0.47 & 0.49 & 0.51 & 0.53 & 0.46 & 0.54 & 0.50 & 0.44\\
2031 & 0.46 & 0.50 & 0.53 & 0.55 & 0.57 & 0.48 & 0.59 & 0.54 & 0.46\\
2032 & 0.48 & 0.53 & 0.56 & 0.59 & 0.61 & 0.51 & 0.63 & 0.57 & 0.48\\
2033 & 0.51 & 0.55 & 0.59 & 0.63 & 0.65 & 0.54 & 0.68 & 0.60 & 0.51\\
2034 & 0.53 & 0.58 & 0.63 & 0.66 & 0.70 & 0.56 & 0.72 & 0.63 & 0.53\\
2035 & 0.55 & 0.61 & 0.66 & 0.70 & 0.74 & 0.59 & 0.77 & 0.66 & 0.55\\
2036 & 0.57 & 0.64 & 0.70 & 0.74 & 0.78 & 0.62 & 0.82 & 0.68 & 0.57\\
2037 & 0.60 & 0.67 & 0.73 & 0.78 & 0.82 & 0.64 & 0.86 & 0.71 & 0.60\\
2038 & 0.62 & 0.70 & 0.76 & 0.82 & 0.87 & 0.67 & 0.91 & 0.74 & 0.62\\
2039 & 0.64 & 0.72 & 0.79 & 0.86 & 0.91 & 0.69 & 0.96 & 0.77 & 0.64\\
2040 & 0.66 & 0.75 & 0.82 & 0.89 & 0.95 & 0.71 & 1.01 & 0.79 & 0.66\\
2041 & 0.67 & 0.77 & 0.85 & 0.93 & 0.99 & 0.73 & 1.05 & 0.81 & 0.67\\
2042 & 0.69 & 0.80 & 0.89 & 0.96 & 1.03 & 0.76 & 1.09 & 0.84 & 0.69\\
2043 & 0.71 & 0.82 & 0.92 & 1.00 & 1.08 & 0.78 & 1.14 & 0.86 & 0.71\\
2044 & 0.73 & 0.85 & 0.95 & 1.04 & 1.12 & 0.81 & 1.19 & 0.88 & 0.73\\
2045 & 0.75 & 0.87 & 0.98 & 1.08 & 1.16 & 0.83 & 1.24 & 0.90 & 0.75\\
2046 & 0.77 & 0.90 & 1.01 & 1.11 & 1.20 & 0.85 & 1.28 & 0.93 & 0.77\\
2047 & 0.79 & 0.92 & 1.04 & 1.15 & 1.24 & 0.87 & 1.33 & 0.95 & 0.79\\
2048 & 0.81 & 0.95 & 1.07 & 1.18 & 1.28 & 0.89 & 1.37 & 0.97 & 0.81\\
2049 & 0.82 & 0.97 & 1.10 & 1.22 & 1.32 & 0.91 & 1.42 & 0.98 & 0.82\\
2050 & 0.84 & 0.99 & 1.13 & 1.25 & 1.36 & 0.93 & 1.46 & 0.99 & 0.84\\
2051 & 0.85 & 1.01 & 1.15 & 1.28 & 1.40 & 0.95 & 1.50 & 1.00 & 0.85\\
2052 & 0.87 & 1.03 & 1.17 & 1.31 & 1.43 & 0.97 & 1.54 & 1.01 & 0.87\\
2053 & 0.88 & 1.05 & 1.20 & 1.34 & 1.47 & 0.99 & 1.58 & 1.01 & 0.88\\
2054 & 0.89 & 1.07 & 1.23 & 1.37 & 1.50 & 1.00 & 1.62 & 1.02 & 0.89\\
2055 & 0.90 & 1.08 & 1.25 & 1.39 & 1.53 & 1.01 & 1.66 & 1.03 & 0.90\\
2056 & 0.91 & 1.09 & 1.26 & 1.42 & 1.56 & 1.03 & 1.69 & 1.03 & 0.91\\
2057 & 0.92 & 1.11 & 1.28 & 1.44 & 1.59 & 1.04 & 1.72 & 1.04 & 0.92\\
2058 & 0.93 & 1.12 & 1.30 & 1.46 & 1.61 & 1.05 & 1.75 & 1.05 & 0.93\\
2059 & 0.94 & 1.14 & 1.32 & 1.48 & 1.64 & 1.06 & 1.78 & 1.05 & 0.94\\
2060 & 0.95 & 1.15 & 1.34 & 1.51 & 1.66 & 1.08 & 1.81 & 1.06 & 0.95\\
2061 & 0.96 & 1.17 & 1.36 & 1.53 & 1.69 & 1.09 & 1.84 & 1.06 & 0.96\\
2062 & 0.97 & 1.18 & 1.37 & 1.55 & 1.71 & 1.10 & 1.87 & 1.06 & 0.97\\
2063 & 0.98 & 1.19 & 1.39 & 1.57 & 1.74 & 1.11 & 1.90 & 1.07 & 0.98\\
2064 & 0.98 & 1.20 & 1.40 & 1.58 & 1.76 & 1.12 & 1.92 & 1.07 & 0.98\\
2065 & 0.99 & 1.20 & 1.41 & 1.60 & 1.78 & 1.12 & 1.94 & 1.08 & 0.99\\
2066 & 1.00 & 1.21 & 1.42 & 1.62 & 1.80 & 1.13 & 1.97 & 1.08 & 1.00\\
2067 & 1.00 & 1.22 & 1.43 & 1.63 & 1.81 & 1.14 & 1.99 & 1.08 & 1.00\\
2068 & 1.00 & 1.23 & 1.44 & 1.64 & 1.83 & 1.14 & 2.01 & 1.08 & 1.00\\
2069 & 1.01 & 1.23 & 1.45 & 1.65 & 1.85 & 1.15 & 2.03 & 1.08 & 1.01\\
2070 & 1.01 & 1.24 & 1.46 & 1.67 & 1.86 & 1.15 & 2.04 & 1.08 & 1.01\\
2071 & 1.02 & 1.25 & 1.47 & 1.68 & 1.88 & 1.16 & 2.06 & 1.08 & 1.02\\
2072 & 1.02 & 1.26 & 1.48 & 1.69 & 1.89 & 1.17 & 2.08 & 1.09 & 1.02\\
2073 & 1.03 & 1.27 & 1.49 & 1.70 & 1.90 & 1.18 & 2.09 & 1.09 & 1.03\\
2074 & 1.04 & 1.27 & 1.50 & 1.72 & 1.92 & 1.18 & 2.11 & 1.09 & 1.04\\
2075 & 1.04 & 1.28 & 1.51 & 1.72 & 1.93 & 1.19 & 2.13 & 1.10 & 1.04\\*
\end{longtable}
\endgroup{}
\endgroup{}

\clearpage

## Rebuilding alternative time series for rebuilding based on an SS model with sex equal to 1


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:prob-mat-sex1)The probability of rebuilding by year for rebuilding SPR alternatives based on an SS model with sex equal to 1.}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:prob-mat-sex1)The probability of rebuilding by year for rebuilding SPR alternatives based on an SS model with sex equal to 1. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2022 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2023 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2024 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2025 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2026 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2027 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2028 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2029 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2030 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2031 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2032 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2033 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2034 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00 & 0.00\\
2035 & 0.00 & 0.00 & 0.00 & 0.00 & 0.01 & 0.00 & 0.01 & 0.00 & 0.00\\
2036 & 0.00 & 0.00 & 0.00 & 0.01 & 0.02 & 0.00 & 0.05 & 0.00 & 0.00\\
2037 & 0.00 & 0.00 & 0.01 & 0.02 & 0.07 & 0.00 & 0.12 & 0.00 & 0.00\\
2038 & 0.00 & 0.00 & 0.02 & 0.07 & 0.13 & 0.00 & 0.24 & 0.01 & 0.00\\
2039 & 0.00 & 0.01 & 0.05 & 0.13 & 0.24 & 0.00 & 0.36 & 0.02 & 0.00\\
2040 & 0.01 & 0.03 & 0.10 & 0.21 & 0.35 & 0.01 & 0.52 & 0.04 & 0.01\\
2041 & 0.02 & 0.05 & 0.15 & 0.31 & 0.48 & 0.02 & 0.67 & 0.07 & 0.02\\
2042 & 0.04 & 0.08 & 0.22 & 0.40 & 0.62 & 0.04 & 0.78 & 0.11 & 0.04\\
2043 & 0.06 & 0.12 & 0.28 & 0.51 & 0.73 & 0.06 & 0.88 & 0.15 & 0.06\\
2044 & 0.09 & 0.15 & 0.37 & 0.62 & 0.82 & 0.09 & 0.94 & 0.19 & 0.09\\
2045 & 0.12 & 0.21 & 0.45 & 0.71 & 0.89 & 0.12 & 0.97 & 0.25 & 0.12\\
2046 & 0.16 & 0.25 & 0.54 & 0.79 & 0.94 & 0.16 & 0.98 & 0.30 & 0.16\\
2047 & 0.20 & 0.30 & 0.61 & 0.86 & 0.96 & 0.20 & 0.99 & 0.34 & 0.20\\
2048 & 0.24 & 0.36 & 0.69 & 0.90 & 0.98 & 0.24 & 1.00 & 0.41 & 0.24\\
2049 & 0.28 & 0.42 & 0.76 & 0.94 & 0.98 & 0.28 & 1.00 & 0.46 & 0.28\\
2050 & 0.34 & 0.48 & 0.80 & 0.96 & 1.00 & 0.34 & 1.00 & 0.51 & 0.34\\
2051 & 0.39 & 0.53 & 0.86 & 0.97 & 1.00 & 0.39 & 1.00 & 0.57 & 0.39\\
2052 & 0.44 & 0.58 & 0.89 & 0.98 & 1.00 & 0.44 & 1.00 & 0.60 & 0.44\\
2053 & 0.50 & 0.63 & 0.91 & 0.99 & 1.00 & 0.50 & 1.00 & 0.65 & 0.50\\
2054 & 0.54 & 0.68 & 0.93 & 0.99 & 1.00 & 0.54 & 1.00 & 0.70 & 0.54\\
2055 & 0.57 & 0.72 & 0.95 & 0.99 & 1.00 & 0.57 & 1.00 & 0.74 & 0.57\\
2056 & 0.61 & 0.76 & 0.96 & 1.00 & 1.00 & 0.61 & 1.00 & 0.77 & 0.61\\
2057 & 0.66 & 0.80 & 0.97 & 1.00 & 1.00 & 0.66 & 1.00 & 0.80 & 0.66\\
2058 & 0.70 & 0.83 & 0.98 & 1.00 & 1.00 & 0.70 & 1.00 & 0.83 & 0.70\\
2059 & 0.74 & 0.85 & 0.98 & 1.00 & 1.00 & 0.74 & 1.00 & 0.84 & 0.74\\
2060 & 0.77 & 0.86 & 0.99 & 1.00 & 1.00 & 0.77 & 1.00 & 0.86 & 0.77\\
2061 & 0.79 & 0.88 & 0.99 & 1.00 & 1.00 & 0.79 & 1.00 & 0.87 & 0.79\\
2062 & 0.81 & 0.90 & 0.99 & 1.00 & 1.00 & 0.81 & 1.00 & 0.89 & 0.81\\
2063 & 0.83 & 0.92 & 0.99 & 1.00 & 1.00 & 0.83 & 1.00 & 0.90 & 0.83\\
2064 & 0.85 & 0.93 & 1.00 & 1.00 & 1.00 & 0.85 & 1.00 & 0.92 & 0.85\\
2065 & 0.87 & 0.94 & 1.00 & 1.00 & 1.00 & 0.87 & 1.00 & 0.93 & 0.87\\
2066 & 0.89 & 0.95 & 1.00 & 1.00 & 1.00 & 0.89 & 1.00 & 0.94 & 0.89\\
2067 & 0.89 & 0.96 & 1.00 & 1.00 & 1.00 & 0.89 & 1.00 & 0.94 & 0.89\\
2068 & 0.90 & 0.97 & 1.00 & 1.00 & 1.00 & 0.90 & 1.00 & 0.95 & 0.90\\
2069 & 0.91 & 0.97 & 1.00 & 1.00 & 1.00 & 0.91 & 1.00 & 0.96 & 0.91\\
2070 & 0.92 & 0.98 & 1.00 & 1.00 & 1.00 & 0.92 & 1.00 & 0.97 & 0.92\\
2071 & 0.93 & 0.98 & 1.00 & 1.00 & 1.00 & 0.93 & 1.00 & 0.97 & 0.93\\
2072 & 0.94 & 0.98 & 1.00 & 1.00 & 1.00 & 0.94 & 1.00 & 0.98 & 0.94\\
2073 & 0.94 & 0.99 & 1.00 & 1.00 & 1.00 & 0.94 & 1.00 & 0.98 & 0.94\\
2074 & 0.95 & 0.99 & 1.00 & 1.00 & 1.00 & 0.95 & 1.00 & 0.99 & 0.95\\
2075 & 0.96 & 0.99 & 1.00 & 1.00 & 1.00 & 0.96 & 1.00 & 0.99 & 0.96\\*
\end{longtable}
\endgroup{}
\endgroup{}

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:acl-mat-sex1)Catches (mt) by year for rebuilding SPR alternatives based on an SS model with sex equal to 1.}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:acl-mat-sex1)Catches (mt) by year for rebuilding SPR alternatives based on an SS model with sex equal to 1. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.5 & 13.50 & 13.50\\
2022 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.5 & 13.50 & 13.50\\
2023 & 1.79 & 1.41 & 0.93 & 0.56 & 0.25 & 1.79 & 0.0 & 0.03 & 1.79\\
2024 & 1.95 & 1.56 & 1.04 & 0.63 & 0.28 & 1.95 & 0.0 & 0.33 & 1.95\\
2025 & 2.12 & 1.73 & 1.16 & 0.70 & 0.32 & 2.12 & 0.0 & 0.67 & 2.12\\
2026 & 2.30 & 1.91 & 1.29 & 0.78 & 0.36 & 2.30 & 0.0 & 1.02 & 2.30\\
2027 & 2.47 & 2.07 & 1.41 & 0.86 & 0.40 & 2.47 & 0.0 & 1.35 & 2.47\\
2028 & 2.63 & 2.24 & 1.53 & 0.94 & 0.44 & 2.63 & 0.0 & 1.65 & 2.63\\
2029 & 2.78 & 2.40 & 1.65 & 1.02 & 0.47 & 2.78 & 0.0 & 1.92 & 2.78\\
2030 & 2.92 & 2.55 & 1.77 & 1.10 & 0.51 & 2.92 & 0.0 & 2.19 & 2.92\\
2031 & 3.06 & 2.70 & 1.88 & 1.17 & 0.55 & 3.06 & 0.0 & 2.42 & 3.06\\
2032 & 3.18 & 2.84 & 1.99 & 1.25 & 0.59 & 3.18 & 0.0 & 2.65 & 3.18\\
2033 & 3.31 & 2.99 & 2.10 & 1.32 & 0.62 & 3.31 & 0.0 & 2.86 & 3.31\\
2034 & 3.44 & 3.14 & 2.22 & 1.40 & 0.66 & 3.44 & 0.0 & 3.06 & 3.44\\
2035 & 3.56 & 3.28 & 2.33 & 1.47 & 0.70 & 3.56 & 0.0 & 3.27 & 3.56\\
2036 & 3.70 & 3.43 & 2.45 & 1.55 & 0.74 & 3.70 & 0.0 & 3.48 & 3.70\\
2037 & 3.86 & 3.57 & 2.57 & 1.63 & 0.78 & 3.86 & 0.0 & 3.70 & 3.86\\
2038 & 4.00 & 3.72 & 2.68 & 1.71 & 0.82 & 4.00 & 0.0 & 3.92 & 4.00\\
2039 & 4.13 & 3.84 & 2.78 & 1.78 & 0.86 & 4.13 & 0.0 & 4.10 & 4.13\\
2040 & 4.27 & 3.97 & 2.88 & 1.85 & 0.89 & 4.27 & 0.0 & 4.30 & 4.27\\
2041 & 4.41 & 4.10 & 2.98 & 1.92 & 0.93 & 4.41 & 0.0 & 4.46 & 4.41\\
2042 & 4.56 & 4.24 & 3.10 & 2.00 & 0.97 & 4.56 & 0.0 & 4.67 & 4.56\\
2043 & 4.68 & 4.36 & 3.20 & 2.07 & 1.00 & 4.68 & 0.0 & 4.83 & 4.68\\
2044 & 4.82 & 4.49 & 3.30 & 2.15 & 1.04 & 4.82 & 0.0 & 5.01 & 4.82\\
2045 & 4.95 & 4.61 & 3.40 & 2.21 & 1.08 & 4.95 & 0.0 & 5.18 & 4.95\\
2046 & 5.09 & 4.75 & 3.52 & 2.29 & 1.11 & 5.09 & 0.0 & 5.34 & 5.09\\
2047 & 5.23 & 4.88 & 3.62 & 2.36 & 1.15 & 5.23 & 0.0 & 5.51 & 5.23\\
2048 & 5.34 & 4.98 & 3.71 & 2.43 & 1.19 & 5.34 & 0.0 & 5.64 & 5.34\\
2049 & 5.46 & 5.09 & 3.80 & 2.50 & 1.22 & 5.46 & 0.0 & 5.77 & 5.46\\
2050 & 5.55 & 5.19 & 3.88 & 2.55 & 1.25 & 5.55 & 0.0 & 5.89 & 5.55\\
2051 & 5.66 & 5.29 & 3.95 & 2.61 & 1.29 & 5.66 & 0.0 & 6.00 & 5.66\\
2052 & 5.79 & 5.41 & 4.06 & 2.68 & 1.32 & 5.79 & 0.0 & 6.10 & 5.79\\
2053 & 5.88 & 5.50 & 4.13 & 2.73 & 1.35 & 5.88 & 0.0 & 6.17 & 5.88\\
2054 & 5.95 & 5.57 & 4.20 & 2.79 & 1.38 & 5.95 & 0.0 & 6.24 & 5.95\\
2055 & 6.02 & 5.64 & 4.26 & 2.83 & 1.40 & 6.02 & 0.0 & 6.30 & 6.02\\
2056 & 6.09 & 5.71 & 4.32 & 2.87 & 1.43 & 6.09 & 0.0 & 6.36 & 6.09\\
2057 & 6.17 & 5.78 & 4.38 & 2.92 & 1.45 & 6.17 & 0.0 & 6.43 & 6.17\\
2058 & 6.25 & 5.86 & 4.44 & 2.96 & 1.47 & 6.25 & 0.0 & 6.49 & 6.25\\
2059 & 6.34 & 5.94 & 4.51 & 3.01 & 1.50 & 6.34 & 0.0 & 6.56 & 6.34\\
2060 & 6.40 & 6.01 & 4.57 & 3.06 & 1.52 & 6.40 & 0.0 & 6.63 & 6.40\\
2061 & 6.47 & 6.07 & 4.62 & 3.10 & 1.54 & 6.47 & 0.0 & 6.68 & 6.47\\
2062 & 6.53 & 6.13 & 4.67 & 3.13 & 1.56 & 6.53 & 0.0 & 6.73 & 6.53\\
2063 & 6.58 & 6.18 & 4.72 & 3.17 & 1.58 & 6.58 & 0.0 & 6.76 & 6.58\\
2064 & 6.61 & 6.21 & 4.76 & 3.20 & 1.60 & 6.61 & 0.0 & 6.79 & 6.61\\
2065 & 6.65 & 6.25 & 4.79 & 3.23 & 1.62 & 6.65 & 0.0 & 6.83 & 6.65\\
2066 & 6.70 & 6.30 & 4.84 & 3.26 & 1.63 & 6.70 & 0.0 & 6.87 & 6.70\\
2067 & 6.73 & 6.32 & 4.86 & 3.28 & 1.65 & 6.73 & 0.0 & 6.89 & 6.73\\
2068 & 6.78 & 6.37 & 4.90 & 3.31 & 1.66 & 6.78 & 0.0 & 6.93 & 6.78\\
2069 & 6.81 & 6.40 & 4.93 & 3.33 & 1.68 & 6.81 & 0.0 & 6.94 & 6.81\\
2070 & 6.84 & 6.44 & 4.96 & 3.36 & 1.69 & 6.84 & 0.0 & 6.98 & 6.84\\
2071 & 6.89 & 6.47 & 4.99 & 3.38 & 1.70 & 6.89 & 0.0 & 7.02 & 6.89\\
2072 & 6.93 & 6.53 & 5.03 & 3.40 & 1.71 & 6.93 & 0.0 & 7.07 & 6.93\\
2073 & 6.98 & 6.57 & 5.06 & 3.43 & 1.73 & 6.98 & 0.0 & 7.10 & 6.98\\
2074 & 7.00 & 6.59 & 5.09 & 3.45 & 1.74 & 7.00 & 0.0 & 7.11 & 7.00\\
2075 & 7.04 & 6.62 & 5.12 & 3.47 & 1.75 & 7.04 & 0.0 & 7.14 & 7.04\\*
\end{longtable}
\endgroup{}
\endgroup{}

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:ofl-mat-sex1)OFLs (mt) by year for rebuilding SPR alternatives based on an SS model with sex equal to 1.}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:ofl-mat-sex1)OFLs (mt) by year for rebuilding SPR alternatives based on an SS model with sex equal to 1. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 2.38 & 2.38 & 2.38 & 2.38 & 2.38 & 2.38 & 2.38 & 2.38 & 2.38\\
2022 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07 & 2.07\\
2023 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79 & 1.79\\
2024 & 1.95 & 1.96 & 1.98 & 1.99 & 2.00 & 1.95 & 2.01 & 2.01 & 1.95\\
2025 & 2.12 & 2.15 & 2.18 & 2.21 & 2.23 & 2.12 & 2.25 & 2.24 & 2.12\\
2026 & 2.30 & 2.34 & 2.40 & 2.44 & 2.48 & 2.30 & 2.51 & 2.47 & 2.30\\
2027 & 2.47 & 2.53 & 2.60 & 2.66 & 2.71 & 2.47 & 2.76 & 2.69 & 2.47\\
2028 & 2.63 & 2.70 & 2.80 & 2.88 & 2.94 & 2.63 & 3.00 & 2.88 & 2.63\\
2029 & 2.78 & 2.86 & 2.99 & 3.09 & 3.17 & 2.78 & 3.24 & 3.07 & 2.78\\
2030 & 2.92 & 3.02 & 3.17 & 3.29 & 3.39 & 2.92 & 3.48 & 3.24 & 2.92\\
2031 & 3.06 & 3.17 & 3.34 & 3.48 & 3.60 & 3.06 & 3.71 & 3.40 & 3.06\\
2032 & 3.18 & 3.30 & 3.51 & 3.67 & 3.81 & 3.18 & 3.94 & 3.54 & 3.18\\
2033 & 3.31 & 3.44 & 3.66 & 3.86 & 4.02 & 3.31 & 4.16 & 3.69 & 3.31\\
2034 & 3.44 & 3.58 & 3.83 & 4.05 & 4.23 & 3.44 & 4.38 & 3.83 & 3.44\\
2035 & 3.56 & 3.71 & 3.99 & 4.23 & 4.43 & 3.56 & 4.61 & 3.96 & 3.56\\
2036 & 3.70 & 3.86 & 4.17 & 4.44 & 4.67 & 3.70 & 4.87 & 4.11 & 3.70\\
2037 & 3.86 & 4.02 & 4.37 & 4.66 & 4.92 & 3.86 & 5.14 & 4.28 & 3.86\\
2038 & 4.00 & 4.18 & 4.56 & 4.88 & 5.17 & 4.00 & 5.41 & 4.43 & 4.00\\
2039 & 4.13 & 4.32 & 4.74 & 5.09 & 5.39 & 4.13 & 5.67 & 4.57 & 4.13\\
2040 & 4.27 & 4.47 & 4.90 & 5.28 & 5.62 & 4.27 & 5.91 & 4.71 & 4.27\\
2041 & 4.41 & 4.61 & 5.08 & 5.49 & 5.85 & 4.41 & 6.17 & 4.85 & 4.41\\
2042 & 4.56 & 4.77 & 5.27 & 5.71 & 6.10 & 4.56 & 6.45 & 4.99 & 4.56\\
2043 & 4.68 & 4.91 & 5.44 & 5.92 & 6.34 & 4.68 & 6.70 & 5.11 & 4.68\\
2044 & 4.82 & 5.06 & 5.63 & 6.13 & 6.57 & 4.82 & 6.96 & 5.24 & 4.82\\
2045 & 4.95 & 5.20 & 5.79 & 6.32 & 6.79 & 4.95 & 7.21 & 5.37 & 4.95\\
2046 & 5.09 & 5.35 & 5.99 & 6.54 & 7.03 & 5.09 & 7.47 & 5.49 & 5.09\\
2047 & 5.23 & 5.49 & 6.16 & 6.74 & 7.27 & 5.23 & 7.74 & 5.61 & 5.23\\
2048 & 5.34 & 5.61 & 6.31 & 6.94 & 7.49 & 5.34 & 7.98 & 5.71 & 5.34\\
2049 & 5.46 & 5.73 & 6.47 & 7.13 & 7.71 & 5.46 & 8.24 & 5.80 & 5.46\\
2050 & 5.55 & 5.84 & 6.61 & 7.29 & 7.90 & 5.55 & 8.45 & 5.89 & 5.55\\
2051 & 5.66 & 5.95 & 6.74 & 7.45 & 8.10 & 5.66 & 8.68 & 6.00 & 5.66\\
2052 & 5.79 & 6.09 & 6.91 & 7.65 & 8.29 & 5.79 & 8.89 & 6.10 & 5.79\\
2053 & 5.88 & 6.19 & 7.04 & 7.81 & 8.51 & 5.88 & 9.13 & 6.17 & 5.88\\
2054 & 5.95 & 6.27 & 7.15 & 7.96 & 8.69 & 5.95 & 9.34 & 6.24 & 5.95\\
2055 & 6.02 & 6.35 & 7.26 & 8.09 & 8.84 & 6.02 & 9.52 & 6.30 & 6.02\\
2056 & 6.09 & 6.43 & 7.36 & 8.20 & 8.99 & 6.09 & 9.71 & 6.36 & 6.09\\
2057 & 6.17 & 6.50 & 7.46 & 8.33 & 9.13 & 6.17 & 9.86 & 6.43 & 6.17\\
2058 & 6.25 & 6.59 & 7.57 & 8.47 & 9.29 & 6.25 & 10.03 & 6.49 & 6.25\\
2059 & 6.34 & 6.69 & 7.69 & 8.59 & 9.44 & 6.34 & 10.22 & 6.56 & 6.34\\
2060 & 6.40 & 6.77 & 7.79 & 8.73 & 9.60 & 6.40 & 10.39 & 6.63 & 6.40\\
2061 & 6.47 & 6.83 & 7.87 & 8.84 & 9.73 & 6.47 & 10.54 & 6.68 & 6.47\\
2062 & 6.53 & 6.90 & 7.96 & 8.94 & 9.85 & 6.53 & 10.70 & 6.73 & 6.53\\
2063 & 6.58 & 6.95 & 8.03 & 9.04 & 9.98 & 6.58 & 10.85 & 6.76 & 6.58\\
2064 & 6.61 & 6.99 & 8.10 & 9.13 & 10.07 & 6.61 & 10.97 & 6.79 & 6.61\\
2065 & 6.65 & 7.03 & 8.16 & 9.21 & 10.18 & 6.65 & 11.11 & 6.83 & 6.65\\
2066 & 6.70 & 7.09 & 8.24 & 9.30 & 10.30 & 6.70 & 11.22 & 6.87 & 6.70\\
2067 & 6.73 & 7.12 & 8.28 & 9.37 & 10.39 & 6.73 & 11.35 & 6.89 & 6.73\\
2068 & 6.78 & 7.17 & 8.34 & 9.44 & 10.49 & 6.78 & 11.46 & 6.93 & 6.78\\
2069 & 6.81 & 7.21 & 8.39 & 9.51 & 10.56 & 6.81 & 11.54 & 6.94 & 6.81\\
2070 & 6.84 & 7.24 & 8.45 & 9.58 & 10.64 & 6.84 & 11.64 & 6.98 & 6.84\\
2071 & 6.89 & 7.29 & 8.50 & 9.65 & 10.73 & 6.89 & 11.75 & 7.02 & 6.89\\
2072 & 6.93 & 7.35 & 8.57 & 9.72 & 10.81 & 6.93 & 11.83 & 7.07 & 6.93\\
2073 & 6.98 & 7.39 & 8.62 & 9.80 & 10.90 & 6.98 & 11.93 & 7.10 & 6.98\\
2074 & 7.00 & 7.41 & 8.66 & 9.85 & 10.96 & 7.00 & 12.01 & 7.11 & 7.00\\
2075 & 7.04 & 7.46 & 8.72 & 9.92 & 11.04 & 7.04 & 12.10 & 7.14 & 7.04\\*
\end{longtable}
\endgroup{}
\endgroup{}

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:rel-ssb-mat-sex1)Spawning output relative to the 40 percent of unfished spawning output target by year for rebuilding SPR alternatives based on an SS model with sex equal to 1.}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:rel-ssb-mat-sex1)Spawning output relative to the 40 percent of unfished spawning output target by year for rebuilding SPR alternatives based on an SS model with sex equal to 1. \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35 & 0.35\\
2022 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30 & 0.30\\
2023 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25 & 0.25\\
2024 & 0.28 & 0.28 & 0.28 & 0.28 & 0.28 & 0.28 & 0.29 & 0.29 & 0.28\\
2025 & 0.30 & 0.31 & 0.31 & 0.32 & 0.32 & 0.30 & 0.32 & 0.32 & 0.30\\
2026 & 0.34 & 0.34 & 0.35 & 0.36 & 0.36 & 0.34 & 0.37 & 0.36 & 0.34\\
2027 & 0.37 & 0.38 & 0.39 & 0.40 & 0.41 & 0.37 & 0.41 & 0.40 & 0.37\\
2028 & 0.40 & 0.41 & 0.42 & 0.44 & 0.45 & 0.40 & 0.46 & 0.44 & 0.40\\
2029 & 0.42 & 0.44 & 0.46 & 0.47 & 0.49 & 0.42 & 0.50 & 0.47 & 0.42\\
2030 & 0.45 & 0.47 & 0.49 & 0.51 & 0.53 & 0.45 & 0.54 & 0.51 & 0.45\\
2031 & 0.48 & 0.50 & 0.53 & 0.55 & 0.57 & 0.48 & 0.59 & 0.54 & 0.48\\
2032 & 0.51 & 0.53 & 0.56 & 0.59 & 0.61 & 0.51 & 0.63 & 0.57 & 0.51\\
2033 & 0.53 & 0.56 & 0.59 & 0.63 & 0.65 & 0.53 & 0.68 & 0.60 & 0.53\\
2034 & 0.56 & 0.58 & 0.63 & 0.66 & 0.70 & 0.56 & 0.72 & 0.63 & 0.56\\
2035 & 0.59 & 0.61 & 0.66 & 0.70 & 0.74 & 0.59 & 0.77 & 0.66 & 0.59\\
2036 & 0.61 & 0.64 & 0.70 & 0.74 & 0.78 & 0.61 & 0.82 & 0.69 & 0.61\\
2037 & 0.64 & 0.67 & 0.73 & 0.78 & 0.83 & 0.64 & 0.86 & 0.71 & 0.64\\
2038 & 0.67 & 0.70 & 0.76 & 0.82 & 0.87 & 0.67 & 0.91 & 0.74 & 0.67\\
2039 & 0.69 & 0.72 & 0.80 & 0.86 & 0.91 & 0.69 & 0.96 & 0.77 & 0.69\\
2040 & 0.71 & 0.75 & 0.83 & 0.89 & 0.95 & 0.71 & 1.01 & 0.79 & 0.71\\
2041 & 0.73 & 0.77 & 0.86 & 0.93 & 0.99 & 0.73 & 1.05 & 0.81 & 0.73\\
2042 & 0.76 & 0.80 & 0.89 & 0.97 & 1.03 & 0.76 & 1.09 & 0.84 & 0.76\\
2043 & 0.79 & 0.82 & 0.92 & 1.00 & 1.08 & 0.79 & 1.14 & 0.86 & 0.79\\
2044 & 0.81 & 0.85 & 0.95 & 1.04 & 1.12 & 0.81 & 1.19 & 0.88 & 0.81\\
2045 & 0.83 & 0.88 & 0.98 & 1.08 & 1.16 & 0.83 & 1.24 & 0.90 & 0.83\\
2046 & 0.86 & 0.90 & 1.01 & 1.11 & 1.20 & 0.86 & 1.28 & 0.93 & 0.86\\
2047 & 0.88 & 0.92 & 1.04 & 1.15 & 1.24 & 0.88 & 1.33 & 0.95 & 0.88\\
2048 & 0.90 & 0.95 & 1.07 & 1.19 & 1.28 & 0.90 & 1.37 & 0.97 & 0.90\\
2049 & 0.92 & 0.97 & 1.10 & 1.22 & 1.32 & 0.92 & 1.42 & 0.98 & 0.92\\
2050 & 0.94 & 0.99 & 1.13 & 1.25 & 1.36 & 0.94 & 1.46 & 1.00 & 0.94\\
2051 & 0.96 & 1.01 & 1.15 & 1.28 & 1.40 & 0.96 & 1.50 & 1.02 & 0.96\\
2052 & 0.98 & 1.03 & 1.18 & 1.31 & 1.43 & 0.98 & 1.54 & 1.03 & 0.98\\
2053 & 1.00 & 1.05 & 1.20 & 1.34 & 1.47 & 1.00 & 1.58 & 1.05 & 1.00\\
2054 & 1.01 & 1.07 & 1.23 & 1.37 & 1.50 & 1.01 & 1.62 & 1.06 & 1.01\\
2055 & 1.02 & 1.08 & 1.25 & 1.39 & 1.53 & 1.02 & 1.66 & 1.07 & 1.02\\
2056 & 1.04 & 1.10 & 1.27 & 1.42 & 1.56 & 1.04 & 1.69 & 1.08 & 1.04\\
2057 & 1.05 & 1.11 & 1.28 & 1.44 & 1.59 & 1.05 & 1.72 & 1.09 & 1.05\\
2058 & 1.06 & 1.13 & 1.30 & 1.46 & 1.61 & 1.06 & 1.75 & 1.11 & 1.06\\
2059 & 1.08 & 1.14 & 1.32 & 1.49 & 1.64 & 1.08 & 1.78 & 1.12 & 1.08\\
2060 & 1.09 & 1.15 & 1.34 & 1.51 & 1.66 & 1.09 & 1.81 & 1.13 & 1.09\\
2061 & 1.10 & 1.17 & 1.36 & 1.53 & 1.69 & 1.10 & 1.84 & 1.14 & 1.10\\
2062 & 1.11 & 1.18 & 1.37 & 1.55 & 1.71 & 1.11 & 1.87 & 1.15 & 1.11\\
2063 & 1.12 & 1.19 & 1.39 & 1.57 & 1.74 & 1.12 & 1.90 & 1.16 & 1.12\\
2064 & 1.13 & 1.20 & 1.40 & 1.59 & 1.76 & 1.13 & 1.92 & 1.16 & 1.13\\
2065 & 1.14 & 1.21 & 1.41 & 1.60 & 1.78 & 1.14 & 1.94 & 1.17 & 1.14\\
2066 & 1.15 & 1.21 & 1.42 & 1.62 & 1.80 & 1.15 & 1.97 & 1.18 & 1.15\\
2067 & 1.15 & 1.22 & 1.43 & 1.63 & 1.82 & 1.15 & 1.99 & 1.18 & 1.15\\
2068 & 1.16 & 1.23 & 1.44 & 1.64 & 1.83 & 1.16 & 2.01 & 1.19 & 1.16\\
2069 & 1.16 & 1.24 & 1.45 & 1.65 & 1.85 & 1.16 & 2.03 & 1.19 & 1.16\\
2070 & 1.17 & 1.24 & 1.46 & 1.67 & 1.86 & 1.17 & 2.04 & 1.19 & 1.17\\
2071 & 1.18 & 1.25 & 1.47 & 1.68 & 1.88 & 1.18 & 2.06 & 1.20 & 1.18\\
2072 & 1.19 & 1.26 & 1.48 & 1.69 & 1.89 & 1.19 & 2.08 & 1.21 & 1.19\\
2073 & 1.20 & 1.27 & 1.49 & 1.71 & 1.90 & 1.20 & 2.09 & 1.22 & 1.20\\
2074 & 1.20 & 1.27 & 1.50 & 1.72 & 1.92 & 1.20 & 2.11 & 1.22 & 1.20\\
2075 & 1.20 & 1.28 & 1.51 & 1.72 & 1.93 & 1.20 & 2.13 & 1.22 & 1.20\\*
\end{longtable}
\endgroup{}
\endgroup{}

<!--chapter:end:52tables.Rmd-->

\clearpage
# Figures

<!-- Main run figures -->

![Probability of rebuilding by year for alternative rebuilding strategies.\label{fig:prob-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/930_F2017_2019_ageStruc2021/rebuilding_probability.png){width=100% height=100% alt="Probability of rebuilding by year for alternative rebuilding strategies."}


![Catches (mt) by year for alternative rebuilding strategies.\label{fig:acl-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/930_F2017_2019_ageStruc2021/rebuilding_acl.png){width=100% height=100% alt="Catches (mt) by year for alternative rebuilding strategies."}


![Spawning output relative to the management target of 40 percent of unfished spawning output by year for alternative rebuilding strategies.\label{fig:rel-ssb-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/930_F2017_2019_ageStruc2021/rebuilding_relative_sb.png){width=100% height=100% alt="Spawning output relative to the management target of 40 percent of unfished spawning output by year for alternative rebuilding strategies."}


![Spawning output by year for alternative rebuilding strategies.\label{fig:rel-ssb-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/930_F2017_2019_ageStruc2021/rebuilding_ssb.png){width=100% height=100% alt="Spawning output by year for alternative rebuilding strategies."}


<!-- Runs with no abc max -->

![Probability of rebuilding by year for alternative rebuilding strategies when not constraining catches by the ABC.\label{fig:prob-fig-noABCmax}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/931_no_abc_max/rebuilding_probability.png){width=100% height=100% alt="Probability of rebuilding by year for alternative rebuilding strategies when not constraining catches by the ABC."}


![Catches (mt) by year for alternative rebuilding strategies when not constraining catches by the ABC.\label{fig:acl-fig-noABCmax}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/931_no_abc_max/rebuilding_acl.png){width=100% height=100% alt="Catches (mt) by year for alternative rebuilding strategies when not constraining catches by the ABC."}


![Spawning output relative to the management target of 40 percent of unfished spawning output by year for alternative rebuilding strategies when not constraining catches by the ABC.\label{fig:rel-ssb-fig-noABCmax}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/931_no_abc_max/rebuilding_relative_sb.png){width=100% height=100% alt="Spawning output relative to the management target of 40 percent of unfished spawning output by year for alternative rebuilding strategies when not constraining catches by the ABC."}


![Spawning output by year for alternative rebuilding strategies when not constraining catches by the ABC.\label{fig:rel-ssb-fig-noABCmax}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/931_no_abc_max/rebuilding_ssb.png){width=100% height=100% alt="Spawning output by year for alternative rebuilding strategies when not constraining catches by the ABC."}


<!-- Runs based on SS model with sex = 1 -->

![Probability of rebuilding by year for alternative rebuilding strategies when based on an SS model with sex = 1.\label{fig:prob-fig-sex1}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/tests/4_test_run_oneSex/rebuilding_probability.png){width=100% height=100% alt="Probability of rebuilding by year for alternative rebuilding strategies when based on an SS model with sex = 1."}


![Catches (mt) by year for alternative rebuilding strategies when based on an SS model with sex = 1.\label{fig:acl-fig-sex1}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/tests/4_test_run_oneSex/rebuilding_acl.png){width=100% height=100% alt="Catches (mt) by year for alternative rebuilding strategies when based on an SS model with sex = 1."}


![Spawning output relative to the management target of 40 percent of unfished spawning output by year for alternative rebuilding strategies when based on an SS model with sex = 1.\label{fig:rel-ssb-fig-sex1}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/tests/4_test_run_oneSex/rebuilding_relative_sb.png){width=100% height=100% alt="Spawning output relative to the management target of 40 percent of unfished spawning output by year for alternative rebuilding strategies when based on an SS model with sex = 1."}


![Spawning output by year for alternative rebuilding strategies when based on an SS model with sex = 1.\label{fig:rel-ssb-fig-sex1}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/tests/4_test_run_oneSex/rebuilding_ssb.png){width=100% height=100% alt="Spawning output by year for alternative rebuilding strategies when based on an SS model with sex = 1."}

<!--chapter:end:53figures.Rmd-->

\clearpage
# Appendix

## Rebuilder data file

The rebuild.dat file used for the SPR alternative analysis has been provided as a separate file.

<!--chapter:end:60appendix.Rmd-->

