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
title: DRAFT Rebuilding analysis for quillback rockfish (_Sebastes maliger_) in U.S. waters off the coast of California based on the 2021 stock assessment
---

<!--chapter:end:00title.Rmd-->

\pagebreak
\pagenumbering{roman}
\setcounter{page}{1}

\renewcommand{\thetable}{\roman{table}}
\renewcommand{\thefigure}{\roman{figure}}

\setlength\parskip{0.5em plus 0.1em minus 0.2em}

# Disclaimer{-}

These materials do not constitute a formal publication and are for information only. They are in a pre-review, pre-decisional state and should not be formally cited (or reproduced). They are to be considered provisional and do not represent any determination or policy of NOAA or the Department of Commerce.

\pagebreak

<!--chapter:end:01a.Rmd-->

# Summary{-}

This rebuilding analysis is for the sub-stock of quillback rockfish (_Sebastes maliger_) in waters off California. The analysis is based on the 2021 stock assessment [@Langseth_status_2021]. The 2021 assessment model estimated the quillback rockfish population to be at 14% of the unexploited equilibrium spawning output at the beginning of 2021. This rebuilding analysis compares the results of applying a suite of potential management actions to the stock for 2023 and beyond.

The results of the analysis show that the value for $\text{T}_\text{MIN}$, the median year for rebuilding to the target level in the absence of fishing since the year of declaration (2023), is 2040. The estimated generation time for quillback rockfish was estimated to be 26 years. In conjunction with $\text{T}_\text{MIN}$ and the mean generation time, $\text{T}_\text{MAX}$ was estimated to be 2066. An SPR = 0.581 harvest rate generates a 50% probability of recovery by $\text{T}_\text{MID}$ where $\text{T}_\text{MID}$ was 2053, an intermediate year between $\text{T}_\text{MIN}$ and $\text{T}_\text{MAX}$.

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

The 2021 assessment of quillback rockfish (_Sebastes maliger_) in California waters documented that the population of quillback rockfish was below the Minimum Stock Size Threshold (MSST), which is 25% of unfished spawning output for rockfish stocks, in 2021 [@Langseth_status_2021]. The population declined below MSST starting in 1992, reached it lowest values in the mid-1990s but increased to near the MSST in the 2000s and early 2010s, and declined in recent years. The stock is expected to be declared overfished for 2023 in 2021. Given the assumed productivity of the stock combined with the longevity of quillback rockfish a range of alternative rebuilding approaches were examined, and are described in this report, with rebuilding ranging from 2040 - 2065 based on various SPR harvest rates from 0.5 to 1 (no harvest). 


# Overview of the 2021 stock assessment

The 2021 assessment of quillback rockfish assessed the stock as three separate sub-stocks along the U.S. west coast: Washington, Oregon, and California. These were the first assessments of quillback rockfish conducted within Stock Synthesis [@methot_stock_2013] that used catch and length composition data to inform model estimates around stock size and status. The previous assessment of quillback rockfish conducted in 2010 was a coastwide assessment modeled using Depletion-Based Stock Reduction Analysis (DB-SRA) to provide estimates of coastwide OFLs using catch data and biological information [@DickandMacCall_dbsra_2010]. DB-SRA is a catch-only model and does not assess overfished status; the 2010 assessment assumed that current depletion was distributed around the management target of 40%. The 2010 assessment found there was a 52% chance that quillback rockfish was experiencing overfishing, as recent coastwide catch of quillback rockfish slightly exceeded the median coastwide OFL estimate at the time. Recent catches of quillback rockfish for the current assessment also exceed the ACL contributions for the species in all modeled areas. 

Estimates of depletion in 2021 for the sub-stocks off Washington and Oregon were above the MSST threshold, but the estimate of depletion for the sub-stock off California was 14%. See [@Langseth_status_2021] for additional results from the California quillback rockfish base model.

California quillback rockfish was assessed using a one-sex model with coastwide life history parameters combined across sexes. Life history parameters were estimated externally and then fixed within the model. Natural mortality and steepness were both fixed, at the median and mean of the priors, respectively. Annual recruitment deviations were estimated within the base model. The model for quillback rockfish in California waters included two fishing fleets, a commercial and a recreational fleet. The majority of the removals and length composition data arose from the recreational fleet. Recreational removals peaked in the late 1970s and early 1980s, with two years of large catches in 1984 and 1993. Removals declined sharply in 1994, but increased to levels similar to the late 1970s and early 1980s in the mid 2000s and again in recent years. Commercial removals peaked in the mid to late 1990s, with one year of exceptionally large catches in 1991. Removals declined through the mid 2010s, but increased in recent years. Selectivity for the commercial and recreational fleets was specified to be asymptotic. The assessment model decision table explored uncertainty around stock size and status using lower ($M$ = 0.0464) and higher ($M$ = 0.0744) natural mortality ($M$) values relative to the base model.

Sensitivities to modeling choices, catch history, and parameter values were explored and showed general support for the base model estimates of stock status and depletion. Sensitivities to the von Bertalanffy growth coefficient ($k$, whether estimated on its own or along with $L_\infty$) and natural mortality showed that model estimates of depletion were sensitive to these parameter choices.  

# Management performance under rebuilding

This is the first rebuilding plan for quillback rockfish in waters off the coast of California.



<!--chapter:end:11introduction.Rmd-->

# Rebuilding calculations

This rebuilding analysis was conducted in September, 2021 using software developed by A. Punt (version 3.12h, August 2021). The input file for the analysis is provided in [Appendix A](#append_a). The steps followed were: 

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

The estimated parameters of the stock recruitment relationship including the unexploited equilibrium recruitment (natural log of $R_0$ = 3.168), steepness ($h$ = 0.72), and degree of recruitment variability ($\sigma_R = 0.60$) from the 2021 assessment were used to generate future recruitments in the rebuilding analysis.


## Population biology

The biological parameters used for the rebuilding analysis were based on the values from the 2021 assessment. Biological parameters in the assessment were aggregated across sex and constant across time. The rebuilding analysis was based on a single sex model. 
<!-- Biological values used as input into the rebuilding analysis are provided in (Table \ref{tab:biology-base}). -->


## Fishery selectivity, and removal allocations

The selectivity used in the rebuilding analysis was obtained from the 2021 assessment. Selectivity in the assessment model was constant across time for each fishing fleet. The relative allocation of catch among fleets in the rebuilding analysis was informed using the relative fishing mortality from the assessment averaged over recent years (2017-2019). This choice provides some consistency between recent model results and forecasts from the rebuilding analysis, accounting for the unique dynamics in 2020 caused by the COVID-19 pandemic. 


## Inclusion of uncertainty

Model and parameter uncertainty is included in the rebuilding analysis via 1,000 random simulations of stochastic future recruitment strengths and integration over alternative low ($M$ = 0.0464) and high ($M$ = 0.0744) states of nature for values of natural mortality ($M$). Other potential states of nature were explored for the assessment, including for low and high ln($R0$) and high and low $L_{\infty}$, but alternative values of natural mortality encapsulated a slightly wider range of depletion estimates compared to the other states of natures. The base model was given 50% of the weight (500 simulations) and each alternative natural mortality state of nature was given 25% (250 simulations) of the weight. 


## Alternate rebuilding strategies analyzed

Assuming that a constant rate of harvest will be applied throughout a rebuilding period, the basis for rebuilding alternatives can be divided into two approaches: 1) strategies based on selection of a constant harvest rate (SPR rate), or 2) strategies based on selection of a $\text{T}_\text{TARGET}$ (year for 50% probability of recovery). This rebuilding analysis presents the following alternate strategies, which are a combination of those specified in the rebuilding Terms of Reference (TOR) and additional strategies. The additional strategies are based on the selection of a SPR harvest rate or rebuilding by a selected target year.  

\begin{enumerate}
	\item Eliminate all harvest, F = 0, beginning in the next management cycle, 2023, the same as setting a constant SPR harvest rate of 1.0.
	\item Apply the harvest rate that would generate the ACL contributions specified for the current year (i.e., the latest year specified in regulations). 
	\item Apply a range of SPR values: 
	\begin{enumerate}
	 \item SPR = 0.50,
	 \item SPR = 0.60,
	 \item SPR = 0.70,
	 \item SPR = 0.80, and
	 \item SPR = 0.90. 
	\end{enumerate}
	\item Apply SPR harvest rates that are estimated to lead to a 50$\%$ probability of recovery by alternative target years: 
	\begin{enumerate}
	 \item by $\text{T}_\text{MAX}$ from the current cycle, and 
	 \item by $\text{T}_\text{MID}$ from the current cycle, which is the year midway between $\text{T}_\text{MIN}$ and $\text{T}_\text{MAX}$.
	\end{enumerate}
	\item Apply the default harvest policy based on the 40:10 harvest control rule with time-varying category 2 $\sigma$ = 1.0 and $P^*$ = 0.45.
	\item Apply the ABC harvest rate with time-varying category 2 $\sigma$ = 1.0 and $P^*$ = 0.45.
\end{enumerate}

The sum of ACL contributions for quillback rockfish from the southern management area and the percent allocation for California (28.7$\%$) in the northern management area as provided by the Groundfish Management Team (GMT) were larger than the catch resulting from applying an SPR of 0.5, implying an SPR rate of below 0.5 for this run, so results from this run are not provided in this report. Similarly, the SPR rate that led to a 50$\%$ probability of recovery by $\text{T}_\text{MAX}$ was less than 0.5 so results from the $\text{T}_\text{MAX}$ strategy are not presented in this report.

No current rebuilding plan exists for quillback rockfish in California waters so the alternatives related to the results of a previous rebuilding plan as specified in the rebuilding TOR could not be done. These include:

\begin{itemize}
 \item Apply the spawning potential ratio or relevant harvest control run in the current rebuilding plan. 
 \item Apply the harvest rate that is estimated to lead to a 50$\%$ probability of recovery by the current $\text{T}_\text{TARGET}$.
 \item Apply the harvest rate that is estimated to lead to a 50$\%$ probability of recovery by the $\text{T}_\text{MAX}$ from the previous cycle.
\end{itemize}

All of the above rebuilding strategies were conducted assuming removals of 13.5 mt in 2021 and 2022 as recommended by the GMT. <!-- A sensitivity examining the impact of reducing removals in 2021 and 2022 to the ACL values of 5.83 mt for 2021 and 5.84 mt for 2022 was conducted using only the fixed SPR harvest rate alternatives listed above. -->
<!-- [This is currently not done but Im leaving the text in as a place holder should it be asked for] --> 

The Pacific Fishery Management Council's (Council) Scientific and Statistical Committee (SSC) requested at the September Council meeting that an additional rebuilding sensitivity be done examining the impact of blocking both recreational and commercial selectivity at 1916-2000 and 2001-2020, assuming asymptotic selectivity for the early blocks and allowing estimation of dome-shaped selectivity for the recent blocks. This sensitivity was conducted without integration over alternative states of nature for natural mortality, given its treatment as a sensitivity. 
<!-- The biological parameters on which the projections are based for this sensitivity are provided in [Appendix B](#append_b) (Table \ref{tab:biology-sens}). -->

<!--chapter:end:20rebuilding.Rmd-->

# Results

## Rebuilding reference points

<!-- The following reference points reported below are based on assumed full removals of 13.5 and 13.5 mt in 2021 and 2022.  The reference points based on assuming lower removals in 2021 and 2022 are presented as sensitivities later in the results section. -->

Reference points calculated based on this rebuilding analysis are given in Table \ref{tab:ref-points}. The minimum time required for rebuilding, $\text{T}_\text{MIN}$, with no fishing (F=0) starting in 2023 was estimated to be 17 years, corresponding to the stock being rebuilt by 2040, assuming the default removals for 2021 and 2022.  The mean generation time was estimated to be 26 years. The maximum time allowed for rebuilding, $\text{T}_\text{MAX}$, is defined as the $\text{T}_\text{MIN}$ plus the mean generation time for stocks that require more than 10 years to rebuild.  Quillback rockfish was unable to rebuild within 10 years so the estimated $\text{T}_\text{MAX}$ was 2066. $\text{T}_\text{TARGET}$, and $\text{SPR}_\text{TARGET}$ are not specified since this is the first rebuilding plan for quillback rockfish and these values have not been set via the Council's process.

A rebuilding strategy is presented below and includes a rebuilding target year termed $\text{T}_\text{MID}$, which equals 2053 and is the mid-point between $\text{T}_\text{MIN}$ and $\text{T}_\text{MAX}$. The Council may opt to select a $\text{T}_\text{TARGET}$ earlier or later than this $\text{T}_\text{MID}$ value based on fishery, economic, or other factors.

## Alternative harvest policy projections

Summary results from the rebuilding alternatives are presented in Table \ref{tab:reb-options}. Detailed
results are presented in Tables \ref{tab:prob-mat}-\ref{tab:rel-ssb-mat} and Figures \ref{fig:prob-fig}-\ref{fig:ssb-fig}.

The target rebuilding year based on the various rebuilding strategies ranged from 2040 - 2065 (Table \ref{tab:reb-options}). The probability of rebuilding by year steadily increased across the alternative SPR values with full rebuilding (reaching a probability of greater than 50%) by 2065 when the lowest SPR of 0.50 was applied (Table \ref{tab:prob-mat} and Figure \ref{fig:prob-fig}). The recommended removals in 2023, the first year of rebuilding, were low ranging between 0.04 - 2.05 mt across strategies excluding the no-harvest strategy (Table \ref{tab:acl-mat}), with the recommended removals slowly increasing by year during the rebuilding period (Figure \ref{fig:acl-fig}). The estimated Overfishing Limits (OFLs) for each rebuilding alternative are given in Table \ref{tab:ofl-mat}. The change in spawning output by year relative to the spawning output target, 40% of unfished, under each of the alternatives are shown by year in Table \ref{tab:rel-ssb-mat} and Figure \ref{fig:rel-ssb-fig}. The harvest rate to obtain a 50% probability of recovery by $\text{T}_\text{MAX}$ corresponds to an SPR that is lower than 0.5, so is not provided in the tables. 

<!-- Reducing the assumed removals in 2021 and 2022 had only a limited impact on the estimated rebuilding by SPR rate (Table \ref{tab:reb-options-catch}). Reducing the removals in 2021 and 2022 decreased the minimum time for rebuilding ($\text{T}_\text{MIN}$) to 2042, two years earlier compared to the initial rebuilding alternatives.  The reduction of the $\text{T}_\text{MIN}$ resulted in a decrease in the $\text{T}_\text{MAX}$ to 2066. The probability of rebuilding, annual catches, OFLs, and relative spawning outputs by year are shown in Tables \ref{tab:prob-mat-catch} - \ref{tab:rel-ssb-mat-catch}.  -->


## Results for sensitivity on selectivity blocks and form

Reference points and summary results for the sensitivity rebuilding analysis that was based on a model with selectivity blocks for both the recreational and commercial fleets applied in 2001 with dome-shaped selectivity in the recent blocks are shown in Tables \ref{tab:ref-points-sens} and \ref{tab:reb-options-sens}. $\text{T}_\text{MIN}$ was one year earlier than the base rebuilding analysis, but because mean generation time was one year earlier (due to not applying uncertainty from the natural mortality states of nature), $\text{T}_\text{MAX}$ was the same as the base rebuilding analysis. Time to targets across the various rebuilding strategies occurred one to three years earlier than the base rebuilding model. Recommended removals in 2023 were also larger than the base, ranging between 0.3 - 2.45 mt, given the slightly higher spawning output and SPR in 2021 compared to the base model. 

Comparisons between stock synthesis output from the adopted base model and the sensitivity run are provided in [Appendix B]{#append_b}. The sensitivity had slightly higher estimates of unfished spawning output (Figure \ref{fig:ssb-sens}) and similar depletion estimates (Figure \ref{fig:depl-sens}) compared to the adopted base model. Selectivity in the recent block was domed at large sizes for both the recreational and commercial fleets, and right shifted in recent years for the commercial fleet (Figure \ref{fig:selex-sens}) so the time series of information entered into the sensitivity rebuilding analysis were different from the time series entered into the base rebuilding analysis, contributing to differences in results. 

We do not consider the sensitivity model to be an improvement over the base model. The shifts in the selectivity curve for the commercial fleet in the sensitivity model fit the lower observed commercial mean lengths in the 1990s and the higher observed commercial mean lengths starting around 2010 better than the base model (Figures \ref{fig:MeanLengthFit-com-base} and \ref{fig:MeanLengthFit-com-sens}), leading to an improvement in AIC (Table \ref{tab:sens-table-withComBlock}). However, the change in estimated commercial mean length in 2001 for the sensitivity model does not align with a shift in the commercial mean length data at that time. Furthermore, the mode and right side of the estimated aggregate length distribution from the commercial fleet are shifted right, and overestimate the proportion of larger fish on aggregate compared to the base model (Figures \ref{fig:aggLenFit-base} and \ref{fig:aggLenFit-sens}). Combined with the similarities in estimates of population scale and status, the base model is preferred due to parsimony. 

<!--chapter:end:30results.Rmd-->

# Acknowledgements
Andre Punt (University of Washington) updated the rebuilder program to apply time-varying $\sigma$ for the Acceptable Biological Catch and 40-10 scenarios. Andre Punt and Owen Hamel (NOAA) provided assistant in understanding and applying the rebuilder program. Owen Hamel provided comments on early drafts of the analysis.


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

<!-- ## Biological information -->
<!-- ```{r, results = 'asis'} -->
<!-- quants = data.frame("Age" = 0:90, "M" = rep(0.057,length(base.920$endgrowth$int_Age)), #M at age -->
<!--            "Mat" = base.920$endgrowth$Age_Mat, #Maturity at age -->
<!--            "Fec" = c(0,base.920$endgrowth$`Mat*Fecund`[-1]), #Fecundity at age * maturity at age. Reset age 0 to 0 -->
<!--            "W" = base.920$endgrowth$`Wt_Mid`, #Weight at age, mid year weight -->
<!--            "SelCom" = unlist(base.920$ageselex[base.920$ageselex$Label == "2021_1_Asel2", which(names(base.920$ageselex)=="0"):which(names(base.920$ageselex)=="90")]), #Selectivity com -->
<!--            "SelRec" = unlist(base.920$ageselex[base.920$ageselex$Label == "2021_2_Asel2", which(names(base.920$ageselex)=="0"):which(names(base.920$ageselex)=="90")]), #Selectivity weight, rec -->
<!--            "N2023" = unlist(base.920$natage[base.920$natage$Yr == 2023 & base.920$natage$`Beg/Mid`=="B", c(which(names(base.920$natage)=="0"):which(names(base.920$natage)=="90"))]), #Beg N at age 2023 -->
<!--            "N2021" = unlist(base.920$natage[base.920$natage$Yr == 2021 & base.920$natage$`Beg/Mid`=="B", c(which(names(base.920$natage)=="0"):which(names(base.920$natage)=="90"))])) #Beg N at age 2021 -->
<!-- col_names = c("Age", -->
<!--               "Natural Mortality",  -->
<!--               "Maturity", -->
<!--               "Fecundity",  -->
<!--               "Weight", -->
<!--               "Selectivity, Com.",  -->
<!--               "Selectivity, Rec.",  -->
<!--               "Numbers, 2023",  -->
<!--               "Numbers, 2021") -->
<!-- table_format(x = quants, -->
<!--              caption = "Biological information by age on which the base rebuilding analysis projections are based. The assessment model and rebuilding analysis assumed a single sex so values are not provided by sex", -->
<!--              label = "biology-base", -->
<!--              align = 'l', -->
<!--              col_names = col_names, -->
<!--              row.names = FALSE, -->
<!--              digits = 4) -->
<!-- ``` -->

<!-- ## Rebuilding reference points and summary of alternatives -->

## Base rebuilding reference points and policy projections

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2cm}}
\caption{(\#tab:ref-points)Summary of the base rebuilding reference points.}\\
\toprule
Quantity & 2021 Assessment Values\\
\midrule
\endfirsthead
\caption[]{(\#tab:ref-points)Summary of the base rebuilding reference points. \textit{(continued)}}\\
\toprule
Quantity & 2021 Assessment Values\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
SB0 (millions of eggs) & 55.08\\
SB40 (millions of eggs) & 22.035\\
SB2021 (millions of eggs) & 7.745\\
Year rebuilding begins & 2023\\
Current year & 2021\\
Tmin & 2040\\
Mean generation time (years) & 26\\
Tmax & 2066\\
TF=0 & 2040\\
Ttarget & TBD\\
SPRtarget & TBD\\
Current SPR (2021) & 0.1165\\*
\end{longtable}
\endgroup{}
\endgroup{}

<!-- ## Summary of alternatives -->

<!-- Base rebuilder -->
\begingroup\fontsize{10}{12}\selectfont

\begin{landscape}\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:reb-options)Results of base rebuilding alternatives based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021-22. SPR for the ABC and 40-10 strategies is provided as a dash (-) because these strategies do not have a constant SPR value}\\
\toprule
 & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:reb-options)Results of base rebuilding alternatives based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021-22. SPR for the ABC and 40-10 strategies is provided as a dash (-) because these strategies do not have a constant SPR value \textit{(continued)}}\\
\toprule
 & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 Assumed Removals (mt) & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5\\
2022 Assumed Removals (mt) & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5\\
2023 ACL (mt) & 2.05 & 1.42 & 0.94 & 0.56 & 0.25 & 1.52 & 0 & 0.04 & 1.79\\
2024 ACL (mt) & 2.24 & 1.57 & 1.05 & 0.63 & 0.29 & 1.68 & 0 & 0.33 & 1.95\\
SPR & 0.5 & 0.6 & 0.7 & 0.8 & 0.9 & 0.581 & 1 & - & -\\
Ttarget & 2065 & 2051 & 2046 & 2043 & 2042 & 2053 & 2040 & 2051 & 2055\\
Tmax & 2066 & 2066 & 2066 & 2066 & 2066 & 2066 & 2066 & 2066 & 2066\\
Probability of recovery by Tmax & 0.525 & 0.897 & 0.979 & 0.999 & 1 & 0.852 & 1 & 0.905 & 0.821\\*
\end{longtable}
\endgroup{}
\end{landscape}
\endgroup{}
\clearpage

## Base rebuilding time series 

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:prob-mat)Probability of recovery by year for base rebuilding strategies}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:prob-mat)Probability of recovery by year for base rebuilding strategies \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2022 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2023 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2024 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2025 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2026 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2027 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2028 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000 & 0.000\\
2029 & 0.000 & 0.000 & 0.001 & 0.001 & 0.001 & 0.000 & 0.003 & 0.000 & 0.000\\
2030 & 0.000 & 0.001 & 0.003 & 0.006 & 0.009 & 0.001 & 0.016 & 0.001 & 0.001\\
2031 & 0.001 & 0.003 & 0.008 & 0.018 & 0.037 & 0.003 & 0.075 & 0.003 & 0.001\\
2032 & 0.001 & 0.007 & 0.018 & 0.046 & 0.099 & 0.005 & 0.147 & 0.006 & 0.003\\
2033 & 0.003 & 0.014 & 0.046 & 0.098 & 0.160 & 0.012 & 0.215 & 0.012 & 0.009\\
2034 & 0.007 & 0.031 & 0.075 & 0.146 & 0.204 & 0.027 & 0.231 & 0.028 & 0.017\\
2035 & 0.013 & 0.050 & 0.108 & 0.184 & 0.230 & 0.042 & 0.255 & 0.046 & 0.033\\
2036 & 0.022 & 0.061 & 0.144 & 0.214 & 0.248 & 0.049 & 0.274 & 0.055 & 0.041\\
2037 & 0.026 & 0.084 & 0.168 & 0.234 & 0.279 & 0.065 & 0.316 & 0.070 & 0.053\\
2038 & 0.031 & 0.097 & 0.187 & 0.263 & 0.321 & 0.083 & 0.376 & 0.090 & 0.065\\
2039 & 0.034 & 0.121 & 0.226 & 0.314 & 0.377 & 0.101 & 0.431 & 0.112 & 0.078\\
2040 & 0.043 & 0.141 & 0.274 & 0.357 & 0.422 & 0.118 & 0.510 & 0.137 & 0.095\\
2041 & 0.054 & 0.173 & 0.306 & 0.403 & 0.490 & 0.143 & 0.586 & 0.170 & 0.111\\
2042 & 0.067 & 0.201 & 0.352 & 0.446 & 0.557 & 0.170 & 0.648 & 0.206 & 0.140\\
2043 & 0.078 & 0.237 & 0.388 & 0.502 & 0.620 & 0.197 & 0.695 & 0.243 & 0.157\\
2044 & 0.093 & 0.272 & 0.426 & 0.562 & 0.662 & 0.230 & 0.740 & 0.280 & 0.191\\
2045 & 0.105 & 0.311 & 0.461 & 0.605 & 0.709 & 0.263 & 0.758 & 0.314 & 0.220\\
2046 & 0.121 & 0.342 & 0.508 & 0.647 & 0.746 & 0.304 & 0.788 & 0.352 & 0.256\\
2047 & 0.138 & 0.368 & 0.550 & 0.688 & 0.773 & 0.337 & 0.821 & 0.384 & 0.292\\
2048 & 0.150 & 0.398 & 0.597 & 0.731 & 0.805 & 0.363 & 0.853 & 0.421 & 0.319\\
2049 & 0.165 & 0.437 & 0.626 & 0.764 & 0.834 & 0.387 & 0.886 & 0.451 & 0.346\\
2050 & 0.189 & 0.472 & 0.658 & 0.800 & 0.868 & 0.417 & 0.914 & 0.483 & 0.375\\
2051 & 0.211 & 0.500 & 0.707 & 0.830 & 0.898 & 0.448 & 0.932 & 0.513 & 0.408\\
2052 & 0.228 & 0.528 & 0.743 & 0.858 & 0.918 & 0.478 & 0.950 & 0.548 & 0.436\\
2053 & 0.242 & 0.551 & 0.777 & 0.883 & 0.934 & 0.500 & 0.972 & 0.583 & 0.465\\
2054 & 0.272 & 0.591 & 0.805 & 0.902 & 0.951 & 0.525 & 0.978 & 0.626 & 0.490\\
2055 & 0.293 & 0.631 & 0.832 & 0.918 & 0.970 & 0.557 & 0.987 & 0.653 & 0.509\\
2056 & 0.311 & 0.661 & 0.858 & 0.937 & 0.976 & 0.601 & 0.991 & 0.689 & 0.541\\
2057 & 0.331 & 0.690 & 0.878 & 0.952 & 0.983 & 0.638 & 0.997 & 0.716 & 0.586\\
2058 & 0.353 & 0.719 & 0.896 & 0.962 & 0.991 & 0.660 & 0.999 & 0.751 & 0.616\\
2059 & 0.378 & 0.745 & 0.917 & 0.970 & 0.996 & 0.690 & 1.000 & 0.774 & 0.638\\
2060 & 0.399 & 0.766 & 0.931 & 0.979 & 0.996 & 0.711 & 1.000 & 0.797 & 0.670\\
2061 & 0.419 & 0.793 & 0.944 & 0.983 & 0.998 & 0.741 & 1.000 & 0.819 & 0.701\\
2062 & 0.446 & 0.819 & 0.952 & 0.992 & 0.998 & 0.767 & 1.000 & 0.842 & 0.721\\
2063 & 0.467 & 0.848 & 0.960 & 0.996 & 0.999 & 0.797 & 1.000 & 0.864 & 0.748\\
2064 & 0.492 & 0.866 & 0.964 & 0.998 & 0.999 & 0.827 & 1.000 & 0.879 & 0.774\\
2065 & 0.504 & 0.880 & 0.969 & 0.998 & 0.999 & 0.841 & 1.000 & 0.897 & 0.808\\
2066 & 0.525 & 0.897 & 0.979 & 0.999 & 1.000 & 0.852 & 1.000 & 0.905 & 0.821\\*
\end{longtable}
\endgroup{}
\endgroup{}
\clearpage

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:acl-mat)Catches (mt) by year for base rebuilding strategies}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:acl-mat)Catches (mt) by year for base rebuilding strategies \textit{(continued)}}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.5 & 13.50 & 13.50\\
2022 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.50 & 13.5 & 13.50 & 13.50\\
2023 & 2.05 & 1.42 & 0.94 & 0.56 & 0.25 & 1.52 & 0.0 & 0.04 & 1.79\\
2024 & 2.24 & 1.57 & 1.05 & 0.63 & 0.29 & 1.68 & 0.0 & 0.33 & 1.95\\
2025 & 2.46 & 1.74 & 1.17 & 0.71 & 0.32 & 1.86 & 0.0 & 0.67 & 2.13\\
2026 & 2.68 & 1.91 & 1.29 & 0.79 & 0.36 & 2.04 & 0.0 & 1.02 & 2.30\\
2027 & 2.89 & 2.08 & 1.42 & 0.87 & 0.40 & 2.22 & 0.0 & 1.35 & 2.47\\
2028 & 3.08 & 2.24 & 1.53 & 0.94 & 0.44 & 2.39 & 0.0 & 1.65 & 2.63\\
2029 & 3.26 & 2.39 & 1.65 & 1.02 & 0.47 & 2.54 & 0.0 & 1.92 & 2.77\\
2030 & 3.45 & 2.54 & 1.76 & 1.09 & 0.51 & 2.70 & 0.0 & 2.17 & 2.91\\
2031 & 3.61 & 2.68 & 1.88 & 1.17 & 0.55 & 2.85 & 0.0 & 2.40 & 3.03\\
2032 & 3.79 & 2.84 & 1.99 & 1.25 & 0.59 & 3.01 & 0.0 & 2.63 & 3.17\\
2033 & 3.95 & 2.97 & 2.10 & 1.32 & 0.62 & 3.15 & 0.0 & 2.84 & 3.29\\
2034 & 4.13 & 3.12 & 2.21 & 1.40 & 0.66 & 3.31 & 0.0 & 3.04 & 3.42\\
2035 & 4.29 & 3.27 & 2.33 & 1.48 & 0.70 & 3.46 & 0.0 & 3.26 & 3.54\\
2036 & 4.47 & 3.42 & 2.44 & 1.55 & 0.74 & 3.61 & 0.0 & 3.47 & 3.69\\
2037 & 4.63 & 3.56 & 2.56 & 1.63 & 0.78 & 3.76 & 0.0 & 3.71 & 3.84\\
2038 & 4.77 & 3.69 & 2.66 & 1.70 & 0.82 & 3.90 & 0.0 & 3.91 & 3.97\\
2039 & 4.91 & 3.81 & 2.76 & 1.78 & 0.85 & 4.02 & 0.0 & 4.07 & 4.10\\
2040 & 5.04 & 3.94 & 2.86 & 1.85 & 0.89 & 4.15 & 0.0 & 4.26 & 4.23\\
2041 & 5.17 & 4.06 & 2.96 & 1.91 & 0.92 & 4.28 & 0.0 & 4.42 & 4.36\\
2042 & 5.33 & 4.20 & 3.08 & 1.99 & 0.96 & 4.42 & 0.0 & 4.61 & 4.51\\
2043 & 5.44 & 4.32 & 3.17 & 2.06 & 1.00 & 4.54 & 0.0 & 4.78 & 4.63\\
2044 & 5.60 & 4.45 & 3.27 & 2.13 & 1.04 & 4.68 & 0.0 & 4.95 & 4.77\\
2045 & 5.72 & 4.56 & 3.37 & 2.20 & 1.07 & 4.79 & 0.0 & 5.10 & 4.88\\
2046 & 5.87 & 4.70 & 3.49 & 2.28 & 1.11 & 4.93 & 0.0 & 5.26 & 5.03\\
2047 & 6.00 & 4.83 & 3.58 & 2.34 & 1.14 & 5.07 & 0.0 & 5.42 & 5.17\\
2048 & 6.11 & 4.93 & 3.67 & 2.41 & 1.18 & 5.17 & 0.0 & 5.56 & 5.27\\
2049 & 6.22 & 5.04 & 3.77 & 2.47 & 1.21 & 5.28 & 0.0 & 5.69 & 5.39\\
2050 & 6.31 & 5.12 & 3.84 & 2.53 & 1.24 & 5.37 & 0.0 & 5.78 & 5.48\\
2051 & 6.38 & 5.20 & 3.91 & 2.58 & 1.27 & 5.44 & 0.0 & 5.85 & 5.55\\
2052 & 6.49 & 5.29 & 3.98 & 2.63 & 1.30 & 5.55 & 0.0 & 5.94 & 5.66\\
2053 & 6.58 & 5.40 & 4.06 & 2.69 & 1.33 & 5.64 & 0.0 & 6.03 & 5.75\\
2054 & 6.65 & 5.45 & 4.12 & 2.74 & 1.36 & 5.70 & 0.0 & 6.09 & 5.81\\
2055 & 6.71 & 5.51 & 4.17 & 2.78 & 1.38 & 5.75 & 0.0 & 6.14 & 5.88\\
2056 & 6.81 & 5.59 & 4.24 & 2.82 & 1.40 & 5.84 & 0.0 & 6.24 & 5.96\\
2057 & 6.88 & 5.66 & 4.30 & 2.87 & 1.43 & 5.91 & 0.0 & 6.31 & 6.04\\
2058 & 6.98 & 5.75 & 4.37 & 2.91 & 1.45 & 6.00 & 0.0 & 6.38 & 6.13\\
2059 & 7.04 & 5.82 & 4.43 & 2.97 & 1.47 & 6.07 & 0.0 & 6.44 & 6.19\\
2060 & 7.12 & 5.90 & 4.49 & 3.01 & 1.50 & 6.15 & 0.0 & 6.51 & 6.28\\
2061 & 7.15 & 5.93 & 4.53 & 3.05 & 1.52 & 6.18 & 0.0 & 6.53 & 6.31\\
2062 & 7.19 & 5.96 & 4.57 & 3.07 & 1.54 & 6.23 & 0.0 & 6.57 & 6.36\\
2063 & 7.25 & 6.03 & 4.62 & 3.11 & 1.56 & 6.28 & 0.0 & 6.62 & 6.41\\
2064 & 7.28 & 6.07 & 4.66 & 3.14 & 1.57 & 6.31 & 0.0 & 6.64 & 6.45\\
2065 & 7.35 & 6.12 & 4.70 & 3.17 & 1.59 & 6.38 & 0.0 & 6.69 & 6.51\\
2066 & 7.37 & 6.17 & 4.74 & 3.19 & 1.61 & 6.42 & 0.0 & 6.72 & 6.56\\*
\end{longtable}
\endgroup{}
\endgroup{}
\clearpage

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:ofl-mat)OFLs (mt) by year for base rebuilding strategies}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:ofl-mat)OFLs (mt) by year for base rebuilding strategies \textit{(continued)}}\\
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
2024 & 1.94 & 1.96 & 1.98 & 1.99 & 2.00 & 1.96 & 2.01 & 2.01 & 1.95\\
2025 & 2.11 & 2.15 & 2.19 & 2.21 & 2.24 & 2.14 & 2.25 & 2.24 & 2.13\\
2026 & 2.27 & 2.34 & 2.40 & 2.44 & 2.48 & 2.33 & 2.51 & 2.47 & 2.30\\
2027 & 2.43 & 2.53 & 2.60 & 2.67 & 2.72 & 2.51 & 2.76 & 2.69 & 2.47\\
2028 & 2.57 & 2.69 & 2.79 & 2.87 & 2.94 & 2.67 & 3.00 & 2.88 & 2.63\\
2029 & 2.69 & 2.85 & 2.97 & 3.07 & 3.15 & 2.82 & 3.23 & 3.05 & 2.77\\
2030 & 2.82 & 3.00 & 3.15 & 3.27 & 3.38 & 2.97 & 3.46 & 3.22 & 2.91\\
2031 & 2.92 & 3.14 & 3.32 & 3.46 & 3.58 & 3.10 & 3.69 & 3.37 & 3.03\\
2032 & 3.04 & 3.29 & 3.49 & 3.65 & 3.79 & 3.25 & 3.92 & 3.53 & 3.17\\
2033 & 3.14 & 3.41 & 3.64 & 3.83 & 3.99 & 3.37 & 4.13 & 3.66 & 3.29\\
2034 & 3.25 & 3.55 & 3.81 & 4.02 & 4.20 & 3.50 & 4.36 & 3.81 & 3.42\\
2035 & 3.35 & 3.69 & 3.97 & 4.21 & 4.42 & 3.63 & 4.59 & 3.95 & 3.54\\
2036 & 3.48 & 3.84 & 4.15 & 4.41 & 4.63 & 3.77 & 4.83 & 4.10 & 3.69\\
2037 & 3.60 & 4.00 & 4.34 & 4.63 & 4.88 & 3.93 & 5.10 & 4.27 & 3.84\\
2038 & 3.71 & 4.15 & 4.52 & 4.84 & 5.12 & 4.07 & 5.37 & 4.41 & 3.97\\
2039 & 3.82 & 4.28 & 4.69 & 5.05 & 5.35 & 4.20 & 5.62 & 4.54 & 4.10\\
2040 & 3.92 & 4.43 & 4.86 & 5.25 & 5.59 & 4.34 & 5.88 & 4.67 & 4.23\\
2041 & 4.02 & 4.56 & 5.03 & 5.44 & 5.80 & 4.47 & 6.11 & 4.80 & 4.36\\
2042 & 4.15 & 4.72 & 5.22 & 5.66 & 6.04 & 4.61 & 6.38 & 4.94 & 4.51\\
2043 & 4.23 & 4.86 & 5.39 & 5.86 & 6.27 & 4.74 & 6.64 & 5.06 & 4.63\\
2044 & 4.36 & 5.00 & 5.56 & 6.06 & 6.51 & 4.88 & 6.90 & 5.19 & 4.77\\
2045 & 4.45 & 5.13 & 5.72 & 6.24 & 6.71 & 5.00 & 7.13 & 5.32 & 4.88\\
2046 & 4.57 & 5.28 & 5.92 & 6.47 & 6.95 & 5.15 & 7.38 & 5.44 & 5.03\\
2047 & 4.67 & 5.43 & 6.08 & 6.66 & 7.17 & 5.29 & 7.64 & 5.55 & 5.17\\
2048 & 4.75 & 5.54 & 6.23 & 6.86 & 7.40 & 5.39 & 7.90 & 5.64 & 5.27\\
2049 & 4.84 & 5.67 & 6.40 & 7.03 & 7.60 & 5.52 & 8.13 & 5.73 & 5.39\\
2050 & 4.91 & 5.76 & 6.52 & 7.19 & 7.79 & 5.60 & 8.35 & 5.80 & 5.48\\
2051 & 4.96 & 5.84 & 6.64 & 7.34 & 7.97 & 5.68 & 8.55 & 5.88 & 5.55\\
2052 & 5.05 & 5.95 & 6.75 & 7.48 & 8.14 & 5.79 & 8.73 & 5.96 & 5.66\\
2053 & 5.12 & 6.07 & 6.89 & 7.65 & 8.32 & 5.89 & 8.95 & 6.04 & 5.75\\
2054 & 5.17 & 6.13 & 7.00 & 7.78 & 8.49 & 5.95 & 9.14 & 6.09 & 5.81\\
2055 & 5.22 & 6.19 & 7.08 & 7.91 & 8.68 & 6.01 & 9.35 & 6.15 & 5.88\\
2056 & 5.30 & 6.29 & 7.20 & 8.02 & 8.78 & 6.10 & 9.50 & 6.25 & 5.96\\
2057 & 5.35 & 6.36 & 7.30 & 8.16 & 8.95 & 6.17 & 9.68 & 6.31 & 6.04\\
2058 & 5.43 & 6.46 & 7.42 & 8.27 & 9.07 & 6.27 & 9.83 & 6.39 & 6.13\\
2059 & 5.47 & 6.54 & 7.53 & 8.43 & 9.25 & 6.34 & 10.01 & 6.44 & 6.19\\
2060 & 5.54 & 6.63 & 7.63 & 8.56 & 9.40 & 6.43 & 10.19 & 6.51 & 6.28\\
2061 & 5.56 & 6.66 & 7.70 & 8.66 & 9.54 & 6.45 & 10.34 & 6.53 & 6.31\\
2062 & 5.59 & 6.70 & 7.76 & 8.74 & 9.64 & 6.51 & 10.47 & 6.57 & 6.36\\
2063 & 5.64 & 6.77 & 7.84 & 8.83 & 9.74 & 6.55 & 10.60 & 6.62 & 6.41\\
2064 & 5.66 & 6.82 & 7.90 & 8.92 & 9.87 & 6.60 & 10.74 & 6.64 & 6.45\\
2065 & 5.71 & 6.88 & 7.98 & 9.00 & 9.96 & 6.66 & 10.85 & 6.69 & 6.51\\
2066 & 5.73 & 6.94 & 8.04 & 9.07 & 10.07 & 6.71 & 10.98 & 6.72 & 6.56\\*
\end{longtable}
\endgroup{}
\endgroup{}
\clearpage

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:rel-ssb-mat)Spawning output relative to the 40 percent of unfished spawning output target by year for base rebuilding strategies}\\
\toprule
Year & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:rel-ssb-mat)Spawning output relative to the 40 percent of unfished spawning output target by year for base rebuilding strategies \textit{(continued)}}\\
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
2024 & 0.27 & 0.28 & 0.28 & 0.28 & 0.28 & 0.28 & 0.29 & 0.29 & 0.28\\
2025 & 0.30 & 0.31 & 0.31 & 0.32 & 0.32 & 0.31 & 0.32 & 0.32 & 0.30\\
2026 & 0.33 & 0.34 & 0.35 & 0.36 & 0.36 & 0.34 & 0.37 & 0.36 & 0.34\\
2027 & 0.36 & 0.38 & 0.39 & 0.40 & 0.41 & 0.37 & 0.41 & 0.40 & 0.37\\
2028 & 0.39 & 0.41 & 0.42 & 0.44 & 0.45 & 0.41 & 0.46 & 0.44 & 0.40\\
2029 & 0.41 & 0.44 & 0.46 & 0.48 & 0.49 & 0.43 & 0.50 & 0.47 & 0.43\\
2030 & 0.44 & 0.47 & 0.49 & 0.51 & 0.53 & 0.46 & 0.54 & 0.50 & 0.45\\
2031 & 0.46 & 0.50 & 0.53 & 0.55 & 0.57 & 0.49 & 0.59 & 0.54 & 0.48\\
2032 & 0.48 & 0.53 & 0.56 & 0.59 & 0.61 & 0.52 & 0.63 & 0.57 & 0.51\\
2033 & 0.51 & 0.56 & 0.59 & 0.63 & 0.66 & 0.55 & 0.68 & 0.60 & 0.53\\
2034 & 0.53 & 0.58 & 0.63 & 0.66 & 0.70 & 0.57 & 0.72 & 0.63 & 0.56\\
2035 & 0.55 & 0.61 & 0.66 & 0.70 & 0.74 & 0.60 & 0.77 & 0.66 & 0.59\\
2036 & 0.57 & 0.64 & 0.70 & 0.74 & 0.78 & 0.63 & 0.82 & 0.68 & 0.61\\
2037 & 0.60 & 0.67 & 0.73 & 0.78 & 0.83 & 0.66 & 0.87 & 0.71 & 0.64\\
2038 & 0.62 & 0.70 & 0.76 & 0.82 & 0.87 & 0.68 & 0.91 & 0.74 & 0.67\\
2039 & 0.64 & 0.72 & 0.80 & 0.86 & 0.91 & 0.71 & 0.96 & 0.77 & 0.69\\
2040 & 0.65 & 0.75 & 0.82 & 0.89 & 0.95 & 0.73 & 1.01 & 0.79 & 0.71\\
2041 & 0.67 & 0.77 & 0.85 & 0.93 & 0.99 & 0.75 & 1.05 & 0.81 & 0.73\\
2042 & 0.69 & 0.79 & 0.88 & 0.96 & 1.03 & 0.78 & 1.09 & 0.83 & 0.76\\
2043 & 0.71 & 0.82 & 0.92 & 1.00 & 1.08 & 0.80 & 1.14 & 0.85 & 0.78\\
2044 & 0.72 & 0.84 & 0.95 & 1.04 & 1.12 & 0.82 & 1.19 & 0.88 & 0.80\\
2045 & 0.74 & 0.87 & 0.98 & 1.07 & 1.16 & 0.84 & 1.23 & 0.90 & 0.82\\
2046 & 0.76 & 0.89 & 1.00 & 1.10 & 1.19 & 0.87 & 1.28 & 0.92 & 0.84\\
2047 & 0.78 & 0.91 & 1.03 & 1.14 & 1.23 & 0.89 & 1.32 & 0.93 & 0.87\\
2048 & 0.80 & 0.94 & 1.06 & 1.17 & 1.28 & 0.91 & 1.37 & 0.95 & 0.89\\
2049 & 0.81 & 0.96 & 1.09 & 1.21 & 1.31 & 0.93 & 1.41 & 0.97 & 0.91\\
2050 & 0.83 & 0.98 & 1.11 & 1.24 & 1.35 & 0.95 & 1.45 & 0.99 & 0.93\\
2051 & 0.84 & 0.99 & 1.14 & 1.27 & 1.38 & 0.96 & 1.49 & 1.00 & 0.94\\
2052 & 0.85 & 1.01 & 1.16 & 1.29 & 1.41 & 0.98 & 1.52 & 1.01 & 0.96\\
2053 & 0.86 & 1.03 & 1.18 & 1.32 & 1.44 & 1.00 & 1.56 & 1.03 & 0.97\\
2054 & 0.87 & 1.04 & 1.20 & 1.34 & 1.47 & 1.01 & 1.59 & 1.04 & 0.98\\
2055 & 0.88 & 1.06 & 1.22 & 1.37 & 1.50 & 1.02 & 1.62 & 1.05 & 1.00\\
2056 & 0.89 & 1.07 & 1.24 & 1.39 & 1.54 & 1.04 & 1.66 & 1.06 & 1.01\\
2057 & 0.90 & 1.09 & 1.26 & 1.41 & 1.56 & 1.05 & 1.70 & 1.08 & 1.03\\
2058 & 0.91 & 1.10 & 1.28 & 1.44 & 1.59 & 1.07 & 1.73 & 1.09 & 1.04\\
2059 & 0.93 & 1.12 & 1.29 & 1.46 & 1.61 & 1.08 & 1.75 & 1.10 & 1.06\\
2060 & 0.93 & 1.14 & 1.31 & 1.48 & 1.64 & 1.10 & 1.79 & 1.11 & 1.07\\
2061 & 0.94 & 1.15 & 1.33 & 1.50 & 1.67 & 1.10 & 1.82 & 1.12 & 1.08\\
2062 & 0.95 & 1.16 & 1.35 & 1.52 & 1.69 & 1.11 & 1.85 & 1.13 & 1.09\\
2063 & 0.96 & 1.16 & 1.36 & 1.54 & 1.71 & 1.12 & 1.87 & 1.14 & 1.10\\
2064 & 0.96 & 1.17 & 1.37 & 1.56 & 1.73 & 1.13 & 1.89 & 1.15 & 1.11\\
2065 & 0.97 & 1.18 & 1.38 & 1.58 & 1.75 & 1.14 & 1.92 & 1.15 & 1.12\\
2066 & 0.98 & 1.20 & 1.40 & 1.59 & 1.77 & 1.16 & 1.94 & 1.16 & 1.13\\*
\end{longtable}
\endgroup{}
\endgroup{}

\clearpage

## Sensitivity rebuilding reference points and policy projections

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2cm}}
\caption{(\#tab:ref-points-sens)Summary of the rebuilding sensitivity reference points}\\
\toprule
Parameter & 2021 Assessment Values\\
\midrule
\endfirsthead
\caption[]{(\#tab:ref-points-sens)Summary of the rebuilding sensitivity reference points \textit{(continued)}}\\
\toprule
Parameter & 2021 Assessment Values\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
SB0 (millions of eggs) & 58.69\\
SB40 (millions of eggs) & 23.475\\
SB2021 (millions of eggs) & 8.71\\
Year rebuilding begins & 2023\\
Current year & 2021\\
Tmin & 2039\\
Mean generation time (years) & 27\\
Tmax & 2066\\
TF=0 & 2039\\
Ttarget & TBD\\
SPRtarget & TBD\\
Current SPR (2021) & 0.1367\\*
\end{longtable}
\endgroup{}
\endgroup{}


<!-- ## Summary of alternatives -->

<!-- Sensitivity rebuilder -->
\begingroup\fontsize{10}{12}\selectfont

\begin{landscape}\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}>{\raggedright\arraybackslash}p{1.1cm}}
\caption{(\#tab:reb-options-sens)Results of rebuilding sensitivity based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021-22. Rebuilding sensitivity blocks selectivity in 2001 and allows dome-shaped selectivity. SPR for the ABC and 40-10 strategies is provided as a dash (-) because these strategies do not have a constant SPR value}\\
\toprule
 & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endfirsthead
\caption[]{(\#tab:reb-options-sens)Results of rebuilding sensitivity based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021-22. Rebuilding sensitivity blocks selectivity in 2001 and allows dome-shaped selectivity. SPR for the ABC and 40-10 strategies is provided as a dash (-) because these strategies do not have a constant SPR value \textit{(continued)}}\\
\toprule
 & SPR= .500       & SPR= .600       & SPR= .700       & SPR= .800       & SPR= .900       & Yr=Tmid         & F=0             & 40-10 rule      & ABC Rule       \\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 Assumed Removals (mt) & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5\\
2022 Assumed Removals (mt) & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5 & 13.5\\
2023 ACL (mt) & 2.45 & 1.69 & 1.12 & 0.67 & 0.3 & 1.71 & 0 & 0.38 & 2.14\\
2024 ACL (mt) & 2.66 & 1.86 & 1.24 & 0.75 & 0.34 & 1.88 & 0 & 0.7 & 2.31\\
SPR & 0.5 & 0.6 & 0.7 & 0.8 & 0.9 & 0.597 & 1 & - & -\\
Ttarget & 2062 & 2050 & 2045 & 2042 & 2040 & 2050 & 2039 & 2049 & 2052\\
Tmax & 2066 & 2066 & 2066 & 2066 & 2066 & 2066 & 2066 & 2066 & 2066\\
Probability of recovery by Tmax & 0.608 & 0.96 & 0.997 & 1 & 1 & 0.956 & 1 & 0.947 & 0.901\\*
\end{longtable}
\endgroup{}
\end{landscape}
\endgroup{}

\clearpage

<!-- ## Rebuilding alternative time series when catches are not constrained by the ABC -->

<!-- ```{r, results = 'asis'} -->
<!-- out = as.data.frame(round(reb[[2]]$prob_matrix[1:47, ],3)) -->
<!-- table_format(x = out, -->
<!--              caption = "Probability of recovery by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC.", -->
<!--              label = "prob-mat-noABCmax", -->
<!--              align = 'l', -->
<!--              digits = 2, -->
<!--              col_names = colnames(out)) -->
<!-- ``` -->


<!-- ```{r, results = 'asis'} -->
<!-- out = as.data.frame(round(reb[[2]]$acl_matrix[1:47, ],2)) -->
<!-- table_format(x = out, -->
<!--              caption = "Catches (mt) by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC.", -->
<!--              label = "acl-mat-noABCmax", -->
<!--              align = 'l', -->
<!--              digits = 2, -->
<!--              col_names = colnames(out)) -->
<!-- ``` -->

<!-- ```{r, results = 'asis'} -->
<!-- out = as.data.frame(round(reb[[2]]$ofl_matrix[1:47, ],2)) -->
<!-- table_format(x = out, -->
<!--              caption = "OFLs (mt) by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC.", -->
<!--              label = "ofl-mat-noABCmax", -->
<!--              align = 'l', -->
<!--              digits = 2, -->
<!--              col_names = colnames(out)) -->
<!-- ``` -->


<!-- ```{r, results = 'asis'} -->
<!-- out = as.data.frame(round(reb[[2]]$relativeb_matrix[1:47, ],2)) -->
<!-- table_format(x = out, -->
<!--              caption = "Spawning output relative to the 40 percent of unfished spawning output target by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC.", -->
<!--              label = "rel-ssb-mat-noABCmax", -->
<!--              align = 'l', -->
<!--              digits = 2, -->
<!--              col_names = colnames(out)) -->
<!-- ``` -->

<!-- \clearpage -->

<!-- ## Rebuilding alternative time series for rebuilding based on an SS model with sex equal to 1 -->


<!-- ```{r, results = 'asis'} -->
<!-- out = as.data.frame(round(reb[[3]]$prob_matrix[1:55, ],3)) -->
<!-- table_format(x = out, -->
<!--              caption = "The probability of rebuilding by year for rebuilding SPR alternatives based on an SS model with sex equal to 1.", -->
<!--              label = "prob-mat-sex1", -->
<!--              align = 'l', -->
<!--              digits = 2, -->
<!--              col_names = colnames(out)) -->
<!-- ``` -->

<!-- ```{r, results = 'asis'} -->
<!-- out = as.data.frame(round(reb[[3]]$acl_matrix[1:55, ],2)) -->
<!-- table_format(x = out, -->
<!--              caption = "Catches (mt) by year for rebuilding SPR alternatives based on an SS model with sex equal to 1.", -->
<!--              label = "acl-mat-sex1", -->
<!--              align = 'l', -->
<!--              digits = 2, -->
<!--              col_names = colnames(out)) -->
<!-- ``` -->

<!-- ```{r, results = 'asis'} -->
<!-- out = as.data.frame(round(reb[[3]]$ofl_matrix[1:55, ],2)) -->
<!-- table_format(x = out, -->
<!--              caption = "OFLs (mt) by year for rebuilding SPR alternatives based on an SS model with sex equal to 1.", -->
<!--              label = "ofl-mat-sex1", -->
<!--              align = 'l', -->
<!--              digits = 2, -->
<!--              col_names = colnames(out)) -->
<!-- ``` -->

<!-- ```{r, results = 'asis'} -->
<!-- out = as.data.frame(round(reb[[3]]$relativeb_matrix[1:55, ],2)) -->
<!-- table_format(x = out, -->
<!--              caption = "Spawning output relative to the 40 percent of unfished spawning output target by year for rebuilding SPR alternatives based on an SS model with sex equal to 1.", -->
<!--              label = "rel-ssb-mat-sex1", -->
<!--              align = 'l', -->
<!--              digits = 2, -->
<!--              col_names = colnames(out)) -->
<!-- ``` -->


<!--chapter:end:52tables.Rmd-->

\clearpage
# Figures

<!-- Main run figures -->

![Probability of rebuilding by year for the base alternative rebuilding strategies.\label{fig:prob-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up/figures/rebuilding_probability_forREPORT.png){width=100% height=100% alt="Probability of rebuilding by year for the base alternative rebuilding strategies."}


![Catches (mt) by year for the base alternative rebuilding strategies.\label{fig:acl-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up/figures/rebuilding_acl_forREPORT.png){width=100% height=100% alt="Catches (mt) by year for the base alternative rebuilding strategies."}


![Spawning output relative to the management target of 40 percent of unfished spawning output by year for the base alternative rebuilding strategies.\label{fig:rel-ssb-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up/figures/rebuilding_relative_sb_forREPORT.png){width=100% height=100% alt="Spawning output relative to the management target of 40 percent of unfished spawning output by year for the base alternative rebuilding strategies."}


![Spawning output by year for the base alternative rebuilding strategies.\label{fig:ssb-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up/figures/rebuilding_ssb_forREPORT.png){width=100% height=100% alt="Spawning output by year for the base alternative rebuilding strategies."}


<!-- <!-- Runs with no abc max -->
<!-- ```{r, results = 'asis'} -->
<!-- add_figure( -->
<!-- filein = file.path(reb[[2]]$loc, "rebuilding_probability.png"),  -->
<!-- caption = "Probability of rebuilding by year for alternative rebuilding strategies when not constraining catches by the ABC", -->
<!-- label = 'prob-fig-noABCmax') -->
<!-- ``` -->

<!-- ```{r, results = 'asis'} -->
<!-- add_figure( -->
<!-- filein = file.path(reb[[2]]$loc, "rebuilding_acl.png"),  -->
<!-- caption = "Catches (mt) by year for alternative rebuilding strategies when not constraining catches by the ABC", -->
<!-- label = 'acl-fig-noABCmax') -->
<!-- ``` -->

<!-- ```{r, results = 'asis'} -->
<!-- add_figure( -->
<!-- filein = file.path(reb[[2]]$loc, "rebuilding_relative_sb.png"),  -->
<!-- caption = "Spawning output relative to the management target of 40 percent of unfished spawning output by year for alternative rebuilding strategies when not constraining catches by the ABC", -->
<!-- label = 'rel-ssb-fig-noABCmax') -->
<!-- ``` -->

<!-- ```{r, results = 'asis'} -->
<!-- add_figure( -->
<!-- filein = file.path(reb[[2]]$loc, "rebuilding_ssb.png"),  -->
<!-- caption = "Spawning output by year for alternative rebuilding strategies when not constraining catches by the ABC", -->
<!-- label = 'ssb-fig-noABCmax') -->
<!-- ``` -->


<!-- <!-- Runs based on SS model with sex = 1 -->
<!-- ```{r, results = 'asis'} -->
<!-- add_figure( -->
<!-- filein = file.path(reb[[3]]$loc, "rebuilding_probability.png"),  -->
<!-- caption = "Probability of rebuilding by year for alternative rebuilding strategies when based on an SS model with sex = 1", -->
<!-- label = 'prob-fig-sex1') -->
<!-- ``` -->

<!-- ```{r, results = 'asis'} -->
<!-- add_figure( -->
<!-- filein = file.path(reb[[3]]$loc, "rebuilding_acl.png"),  -->
<!-- caption = "Catches (mt) by year for alternative rebuilding strategies when based on an SS model with sex = 1", -->
<!-- label = 'acl-fig-sex1') -->
<!-- ``` -->

<!-- ```{r, results = 'asis'} -->
<!-- add_figure( -->
<!-- filein = file.path(reb[[3]]$loc, "rebuilding_relative_sb.png"),  -->
<!-- caption = "Spawning output relative to the management target of 40 percent of unfished spawning output by year for alternative rebuilding strategies when based on an SS model with sex = 1", -->
<!-- label = 'rel-ssb-fig-sex1') -->
<!-- ``` -->

<!-- ```{r, results = 'asis'} -->
<!-- add_figure( -->
<!-- filein = file.path(reb[[3]]$loc, "rebuilding_ssb.png"),  -->
<!-- caption = "Spawning output by year for alternative rebuilding strategies when based on an SS model with sex = 1", -->
<!-- label = 'ssb-fig-sex1') -->
<!-- ``` -->

<!--chapter:end:53figures.Rmd-->

\clearpage
# Appendix

## Appendix A: Rebuilder data file.{#append_a}

The rebuild.dat file used for the base rebuilding analysis has been provided as a separate file.

\clearpage
<!-- ## Appendix B: Biological information used for the sensitivity rebuilder analysis with dome-shaped selectivity and blocks.{#append_b} -->

<!-- ```{r, results = 'asis'} -->
<!-- quants = data.frame("Age" = 0:90, "M" = rep(0.057,length(sens.940$endgrowth$int_Age)), #M at age -->
<!--            "Mat" = sens.940$endgrowth$Age_Mat, #Maturity at age -->
<!--            "Fec" = c(0,sens.940$endgrowth$`Mat*Fecund`[-1]), #Fecundity at age * maturity at age. Reset age 0 to 0 -->
<!--            "W" = sens.940$endgrowth$`Wt_Mid`, #Weight at age, mid year weight -->
<!--            "SelCom" = unlist(sens.940$ageselex[sens.940$ageselex$Label == "2021_1_Asel2", which(names(sens.940$ageselex)=="0"):which(names(sens.940$ageselex)=="90")]), #Selectivity com -->
<!--            "SelRec" = unlist(sens.940$ageselex[sens.940$ageselex$Label == "2021_2_Asel2", which(names(sens.940$ageselex)=="0"):which(names(sens.940$ageselex)=="90")]), #Selectivity weight, rec -->
<!--            "N2023" = unlist(sens.940$natage[sens.940$natage$Yr == 2023 & sens.940$natage$`Beg/Mid`=="B", c(which(names(sens.940$natage)=="0"):which(names(sens.940$natage)=="90"))]), #Beg N at age 2023 -->
<!--            "N2021" = unlist(sens.940$natage[sens.940$natage$Yr == 2021 & sens.940$natage$`Beg/Mid`=="B", c(which(names(sens.940$natage)=="0"):which(names(sens.940$natage)=="90"))])) #Beg N at age 2021 -->
<!-- col_names = c("Age", -->
<!--               "Natural Mortality",  -->
<!--               "Maturity", -->
<!--               "Fecundity",  -->
<!--               "Weight", -->
<!--               "Selectivity, Com",  -->
<!--               "Selectivity, Rec",  -->
<!--               "Numbers, 2023",  -->
<!--               "Numbers, 2021") -->
<!-- table_format(x = quants, -->
<!--              caption = "Biological information by age from the stock synthesis sensitivity model that informs the rebuilding sensitivity. The sensitivity model and rebuilding sensitivity assumed a single sex so values are not provided by sex", -->
<!--              label = "biology-sens", -->
<!--              align = 'l', -->
<!--              col_names = col_names, -->
<!--              row.names = FALSE, -->
<!--              digits = 4) -->
<!-- ``` -->

<!-- \clearpage -->

## Appendix B: Comparison between the approved stock synthesis base case model and the stock synthesis sensitivity model with dome-shaped selectivity and blocks in 2001.{#append_b}

<!-- tab:sensitivity table -->
\include{tex_tables/sensitivity_table.tex}


<!-- Spawning output and status comparisons -->

![Change in estimated spawning output for the adopted stock synthesis base model (base) and the stock synthesis sensitivity model (RecCom Block 2001). Shading indicates 95 percent confidence intervals around each scenario.\label{fig:ssb-sens}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up/figures/rebuilder_sensitivities_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Change in estimated spawning output for the adopted stock synthesis base model (base) and the stock synthesis sensitivity model (RecCom Block 2001). Shading indicates 95 percent confidence intervals around each scenario."}

![Change in estimated fraction of unfished for the adopted stock synthesis base model (base) and the stock synthesis sensitivity model that informs the rebuilding sensitivity (RecCom Block 2001). Shading indicates 95 percent confidence intervals around each scenario.\label{fig:depl-sens}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up/figures/rebuilder_sensitivities_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Change in estimated fraction of unfished for the adopted stock synthesis base model (base) and the stock synthesis sensitivity model that informs the rebuilding sensitivity (RecCom Block 2001). Shading indicates 95 percent confidence intervals around each scenario."}



![Recreational and commercial selectivity for the stock synthesis sensitvity model with blocks in 2001 and allowing dome-shaped selectivity (red lines) compared to the selectivity for the adopted base model (blue lines).\label{fig:selex-sens}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up/figures/selex_compare.png){width=100% height=100% alt="Recreational and commercial selectivity for the stock synthesis sensitvity model with blocks in 2001 and allowing dome-shaped selectivity (red lines) compared to the selectivity for the adopted base model (blue lines)."}

<!-- Mean length fits -->

![Mean length and fit (blue line) for the commercial length data from the adoped stock synthesis base model with 95 percent confidence intervals (solid black bar) based on current samples sizes. Thinner intervals (with capped ends) show result of further adjusting sample sizes based on suggested multiplier for Francis data weighting.\label{fig:MeanLengthFit-com-base}](C:/Users/Brian.Langseth/Desktop/ca/9_0_0_postSSC_base/plots/comp_lenfit_data_weighting_TA1.8_CA_Commercial.png){width=90% height=90% alt="Mean length and fit (blue line) for the commercial length data from the adoped stock synthesis base model with 95 percent confidence intervals (solid black bar) based on current samples sizes. Thinner intervals (with capped ends) show result of further adjusting sample sizes based on suggested multiplier for Francis data weighting."}

![Mean length and fit (blue line) for the commercial length data from the stock synthesis sensitivity model with 95 percent confidence intervals (solid black bar) based on current samples sizes. Thinner intervals (with capped ends) show result of further adjusting sample sizes based on suggested multiplier for Francis data weighting.\label{fig:MeanLengthFit-com-sens}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/9_4_0_recComBlock2001/plots/comp_lenfit_data_weighting_TA1.8_CA_Commercial.png){width=90% height=90% alt="Mean length and fit (blue line) for the commercial length data from the stock synthesis sensitivity model with 95 percent confidence intervals (solid black bar) based on current samples sizes. Thinner intervals (with capped ends) show result of further adjusting sample sizes based on suggested multiplier for Francis data weighting."}

![Mean length and fit (blue line) for the recreational length data from the adoped stock synthesis base model with 95 percent confidence intervals (solid black bar) based on current samples sizes. Thinner intervals (with capped ends) show result of further adjusting sample sizes based on suggested multiplier for Francis data weighting.\label{fig:MeanLengthFit-rec-base}](C:/Users/Brian.Langseth/Desktop/ca/9_0_0_postSSC_base/plots/comp_lenfit_data_weighting_TA1.8_CA_Recreational.png){width=90% height=90% alt="Mean length and fit (blue line) for the recreational length data from the adoped stock synthesis base model with 95 percent confidence intervals (solid black bar) based on current samples sizes. Thinner intervals (with capped ends) show result of further adjusting sample sizes based on suggested multiplier for Francis data weighting."}

![Mean length and fit (blue line) for the recreational length data from the stock synthesis sensitivity model with 95 percent confidence intervals (solid black bar) based on current samples sizes. Thinner intervals (with capped ends) show result of further adjusting sample sizes based on suggested multiplier for Francis data weighting.\label{fig:MeanLengthFit-rec-sens}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/9_4_0_recComBlock2001/plots/comp_lenfit_data_weighting_TA1.8_CA_Recreational.png){width=90% height=90% alt="Mean length and fit (blue line) for the recreational length data from the stock synthesis sensitivity model with 95 percent confidence intervals (solid black bar) based on current samples sizes. Thinner intervals (with capped ends) show result of further adjusting sample sizes based on suggested multiplier for Francis data weighting."}

<!-- Aggregate length plots -->

![Aggregated length comps over all years for the adopted stock synthesis base model.\label{fig:aggLenFit-base}](C:/Users/Brian.Langseth/Desktop/ca/9_0_0_postSSC_base/plots/comp_lenfit__aggregated_across_time.png){width=100% height=100% alt="Aggregated length comps over all years for the adopted stock synthesis base model."}

![Aggregated length comps over all years for the stock synthesis sensitivity model.\label{fig:aggLenFit-sens}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/9_4_0_recComBlock2001/plots/comp_lenfit__aggregated_across_time.png){width=100% height=100% alt="Aggregated length comps over all years for the stock synthesis sensitivity model."}

<!-- Person residuals -->

![Pearson residuals for the recreational and commercial fleets for the adopted stock synthesis base model. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:Pearson-base}](C:/Users/Brian.Langseth/Desktop/ca/9_0_0_postSSC_base/plots/comp_lenfit__multi-fleet_comparison.png){width=90% height=90% alt="Pearson residuals for the recreational and commercial fleets for the adopted stock synthesis base model. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}

![Pearson residuals for the recreational and commercial fleets for the stock synthesis sensitivity model. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:Pearson-sens}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/9_4_0_recComBlock2001/plots/comp_lenfit__multi-fleet_comparison.png){width=90% height=90% alt="Pearson residuals for the recreational and commercial fleets for the stock synthesis sensitivity model. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}

<!--chapter:end:60appendix.Rmd-->

