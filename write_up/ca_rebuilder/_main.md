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

The results of the analysis show that the value for $\text{T}_\text{MIN}$, the median year for rebuilding to the target level in the absence of fishing since the year of declaration (2023), is 2040. The estimated generation time for quillback rockfish was estimated to be 27 years. In conjunction with $\text{T}_\text{MIN}$ and the mean generation time, $\text{T}_\text{MAX}$ was estimated to be 2067. The SPR = 0.537 harvest rate generates a 50% probability of recovery by $\text{T}_\text{MID}$ where $\text{T}_\text{MID}$ was set equal to 2054, an intermediate year between $\text{T}_\text{MIN}$ and $\text{T}_\text{MAX}$.


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

The 2021 assessment of quillback rockfish (_Sebastes maliger_) in California waters documented that the population of quillback rockfish was below the Minimum Stock Size Threshold (MSST), which is 25% of unfished spawning output for rockfish stocks, in 2021. The population had declined below MSST starting in 1992, reached it lowest values in the mid-1990's but increased to near the MSST in the 2000s and early 2010s, and had declined in recent years [@Langseth_status_2021]. The stock was declared overfished for 2023 in 2021. Given the assumed productivity of the stock combined with the longevity of quillback rockfish a range of alternative rebuilding approaches were examined with rebuilding ranging from 2040 to 2067 based on various SPR harvest rates from 0.54 to 1


# Overview of the 2021 stock assessment

The 2021 assessment of quillback rockfish assessed the stock as three separate sub-stocks along the U.S. west coast: Washington, Oregon, and California. These were the first assessments of quillback rockfish conducted within Stock Synthesis [@methot_stock_2013] that used catch and length composition data to inform model estimates around stock size and status. The previous assessment of quillback rockfish conducted in 2010 was a coastwide assessment modeled using Depletion-Based Stock Reduction Analysis (DB-SRA) to provide estimates of coastwide OFLs using catch data and biological information [@DickandMacCall_dbsra_2010]. DB-SRA is a catch-only model and does not assess overfished status; the 2010 assessment assumed that current depletion was distributed around the management target of 40%. The 2010 assessment found there was a 52% chance that quillback rockfish was experiencing overfishing, as recent coastwide catch of quillback rockfish slightly exceeded the median coastwide OFL estimate at the time. Recent catches of quillback rockfish for the current assessment also exceed the ACL contributions for the species in all modeled areas. 

Estimates of depletion in 2021 for the sub-stocks off Washington and Oregon were above the MSST threshold, but the estimate of depletion for the sub-stock off California was 0.14. The median and 95% confidence intervals of select derived quantities for the California quillback rockfish base model are provided in (Table \ref{tab:model-summary}).

California quillback rockfish was assessed using a one-sex model with coastwide life history parameters combined across sexes. Life history parameters were estimated externally and then fixed within the model. Natural mortality and steepness were both fixed at the median and mean of the priors, respectively. Annual recruitment deviations were estimated within the base model. The model for Quillback rockfish in California waters included two fishing fleets, a commercial and a recreational fleet. The majority of the removals and length composition data arose from the recreational fleet. Recreational removals peaked in the late 1970s and early 1980s, with two years of large catches in 1984 and 1993. Removals declined sharply in 1994, but increased to levels similar to the late 1970s and early 1980s in the mid 2000s and again in recent years. Commercial removals peaked in the mid to late 1990s, with one year of exceptionally large catches in 1991. Removals declined through the mid 2010s, but increased in recent years. Selectivity for the commercial and recreational fleets was specified to be asymptotic. The assessment model decision table explored uncertainty around stock size and status using lower and higher natural mortality values relative to the base model.

Sensitivities to modeling choices and parameter values were explored and showed general support for the base model estimates of stock status and depletion. Sensitivities to the von Bertalanffy growth coefficient ($k$) and natural mortality ($M$) showed that model estimates of depletion were sensitive to these parameter choices.  

TO DO: Need median and 95% intervals for desired quantities

# Management performance under rebuilding

This is the first rebuilding plan for quillback rockfish in waters off the coast of California.



<!--chapter:end:11introduction.Rmd-->

# Rebuilding calculations

This rebuilding analysis was conducted in September, 2021 using software developed by A. Punt (version 3.12h, August 2021). Input files for the analysis are provided in [Appendix A](#append_a). The steps followed were: 

\begin{enumerate}
	\item Define how equilibrium spawning output ($\text{SB}_0$) will be calculated. 
	\item Define how future recruitment will be generated.
	\item Define the biological information on which future projections will be based.
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
\end{enumerate}

TO DO: I dont think the "calculate rebuilding reference points" section is needed. Not sure why I added it. Its for the results and not included in the TOR description. 

## Definition of Equilibrium Spawning Output

The equilibrium spawning output ($\text{SB}_0$) used in this rebuilding analysis is calculated via the stock-recruitment, growth, maturity, and fecundity relationships from the 2021 assessment in order to be consistent with assessment model results. Equilibrium spawning output was estimated to be 55.08 millions of eggs in the assessment model, which dictates a rebuilding relative spawning output target ($\text{SB}_{40\%}$) of 22.035 millions of eggs (Table \ref{tab:ref-points}). Estimates of spawning output presented in this report are female spawning output only. 


## Generation of future recruitment

The estimated parameters of the stock recruitment relationship including the unexploited equilibrium recruitment (natural log of $R_0$ = 3.168), steepness ($h$ = 0.72), and degree of recruitment variability ($\sigma_R = 0.60$) from the 2021 assessment were used to generate future recruitments in the rebuilding analysis.


## Population biology

The biological parameters used for the rebuilding analysis were based on the values from the 2021 assessment. Biological parameters in the assessment were aggregated across sex and constant across time. The rebuilding analysis was based on a single sex model. Biological values used as input into the rebuilding analysis are provided in (Table \ref{tab:biology}).


## Fishery selectivity, and removal allocations

The selectivity used in the rebuilding analysis was obtained from the 2021 assessment. Selectivity in the assessment model was constant across time for each fishing fleet. The relative allocation of catch among fleets in the rebuilding analysis was informed using the relative fishing mortality from the assessment averaged over recent years (2017-2019). This choice provides some consistency between recent model results and forecasts from the rebuilding analysis, accounting for the unique dynamics in 2020 caused by the Covid-19 pandemic. 


## Inclusion of uncertainty

Model and parameter uncertainty is included in the rebuilding analysis via 1,000 random simulations of stochastic future recruitment strengths and integration over alternative low ($M$ = 0.0464) and high ($M$ = 0.0744) states of nature for values of natural mortality ($M$). Other potential states of nature were explored, including for low and high ln($R0$) and high and low $L_{\infty}$, but alternative values of natural mortality encapsulated a slightly wider range of depletion estimates compared to the other states of natures. The base model was given 50% of the weight and each alternative natural mortality state of nature was given 25% of the weight. 


## Alternate rebuilding strategies analyzed

Assuming that a constant rate of harvest will be applied throughout a rebuilding period, the basis for rebuilding alternatives can be divided into two approaches: 1) strategies based on selection of a constant harvest rate (SPR rate), or 2) strategies based on selection of a $\text{T}_\text{TARGET}$ (year for 50% probability of recovery). This rebuilding analysis presents the following alternate strategies, which are a combination of those specified in the rebuilding Terms of Reference (TOR) and additional strategies. The additional strategies based on the selection of a SPR harvest rate or rebuilding by a selected target year:  

\begin{enumerate}
	\item Eliminate all harvest, F = 0, beginning in the next management cycle, 2023, the same as setting a constant SPR harvest rate of 1.0.
	\item Apply the harvest rate that would generate the ACL specified for the current year (i.e., the latest year specified in regulations).
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
	\item Apply the default harvest policy based on the 40:10 harvest control rule.
	\item Apply the ABC harvest rate with time-varying category 2 $\sigma$ and $P^*$ = 0.45.
\end{enumerate}

No current rebuilding plan exists for quillback rockfish in California waters so the following alternatives as specified in the rebuilding TOR could not be done:

\begin{itemize}
 \item Apply the spawning potential ratio or relevant harvest control run in the current rebuilding plan. 
 \item Apply the harvest rate that is estimated to lead to a 50% probability of recovery by the current $\text{T}_\text{TARGET}$.
 \item Apply the harvest rate that is estimated to lead to a 50% probability of recovery by the TMAX from the previous cycle.
\end{itemize}

TO DO: Add a run that generates the currently specified ACL. But there is no ACL, its an ACL contribution, so do I need to do this? Not sure how to do this. 

TO DO: Add a run with Tmax. Not sure how to do this.

All of the above rebuilding strategies were conducted assuming removals of 13.5 mt in 2021 and 2022 as recommended by the Groundfish Management Team (GMT). <!-- A sensitivity examining the impact of reducing removals in 2021 and 2022 to the ACL values of 5.83 mt for 2021 and 5.84 mt for 2022 was conducted using only the fixed SPR harvest rate alternatives listed above. -->
<!-- [This is currently not done but Im leaving the text in as a place holder should it be asked for] --> 

The Pacific Fishery Management Council's (Council) Scientific and Statistical Committee (SSC) requested at the September Council meeting that an additional rebuilding sensitivity be done examining the impact of blocking both recreational and commercial selectivity at 1916-2000 and 2001-2020, assuming asymptotic selectivity for the early blocks and allowing estimation of dome-shaped selectivity for the recent blocks. This sensitivity was conducted without integration over alternative states of nature for natural mortality, given its treatment as a sensitivity. The biological parameters on which the projections are based for this sensitivity are provided in [Appendix B](#append_b) (Table \ref{tab:sens-biology}).

TO DO: Add this biology table for the sensitivity 

<!--chapter:end:20rebuilding.Rmd-->

# Results

## Rebuilding reference points

<!-- The following reference points reported below are based on assumed full removals of 13.5 and 13.5001 mt in 2021 and 2022.  The reference points based on assuming lower removals in 2021 and 2022 are presented as sensitivities later in the results section. -->

Reference points calculated based on this rebuilding analysis are given in Table \ref{tab:ref-points}. The minimum time required for rebuilding, $\text{T}_\text{MIN}$, with no fishing (F=0) starting in 2023 was estimated to be 19 years, corresponding to the stock being rebuilt by 2040, assuming the default removals for 2021 and 2022.  The mean generation time was estimated to be 27 years. The maximum time allowed for rebuilding, $\text{T}_\text{MAX}$, is defined as the $\text{T}_\text{MIN}$ plus the mean generation time for stocks that require more than 10 years to rebuild.  Quillback rockfish was unable to rebuild within 10 years so the estimated $\text{T}_\text{MAX}$ was 2067. $\text{P}_\text{MAX}$, $\text{T}_\text{TARGET}$, and $\text{SPR}_\text{TARGET}$ are not specified since this is the first rebuilding plan for quillback rockfish and these values have not been set via the Council's process.

TO DO: Confirm Tmin value (17 or 19) and Tmin year (2040 or 2042). Tmax assumes Tminyear is 2040 so ensure values are accurate here and in tables. 

<!-- A rebuilding strategy is presented below and includes a rebuilding target year termed $\text{T}_\text{MID}$, which equals 2054 and is the mid-point between $\text{T}_\text{MIN}$ and $\text{T}_\text{MAX}$, along with the associated SPR harvest rate. The Council may opt to select a $\text{T}_\text{TARGET}$ earlier or later than this $\text{T}_\text{MID}$ value based on fishery, economic, or other factors. -->

## Alternative harvest policy projections

Summary results from the rebuilding alternatives are presented in Table \ref{tab:ref-options}. Detailed
results are presented in Tables \ref{tab:prob-mat}, \ref{tab:acl-mat}, \ref{tab:ofl-mat}, \ref{tab:rel-ssb-mat} and Figures \ref{fig:prob-fig}, \ref{fig:acl-fig}, \ref{fig:rel-ssb-fig}, \ref{fig:ssb-fig}.

The target rebuilding year based on the range of pre-specified SPR values between 0.50 - 0.90 ranged from 2040 - 2064 (Table \ref{tab:reb-options}). The probability of rebuilding by year steadily increased across the alternative SPR values with full rebuilding (reaching a probability of greater than 50%) by 2064 when the lowest SPR of 0.50 was applied and catches were not constrained to the ABC (Table \ref{tab:prob-mat} and Figure \ref{fig:prob-fig}). The recommended removals in 2023, the first year of rebuilding, were low ranging between 0.25 - 1.79 mt across alternative SPR values, and 0.04 - 1.79 across alternative strategies allowing some amount of catch (Table \ref{tab:acl-mat}), with the recommended removals slowly increasing by year during the rebuilding period (Figure \ref{fig:acl-fig}). The estimated Overfishing Limits (OFLs) for each rebuilding alternative is given in Table \ref{tab:ofl-mat}. The change in spawning output by year relative to the spawning output target, 40% of unfished, under each of the alternatives are shown by year in Table \ref{tab:rel-ssb-mat} and Figure \ref{fig:rel-ssb-fig}).

TO DO: Automate presentation of the years in the first sentence

TO DO: Ensure min max catch values reflect the ABC caps

TO DO: Set number of table rows to be capped at Tmax

TO DO: provide an asterisk where ABC caps were applied

TO DO: Set probabilities in tables to three digits

TO DO?: This seems short, is more results needed?

<!-- Reducing the assumed removals in 2021 and 2022 had only a limited impact on the estimated rebuilding by SPR rate (Table \ref{tab:reb-options-catch}). Reducing the removals in 2021 and 2022 decreased the minimum time for rebuilding ($\text{T}_\text{MIN}$) to 2042, two years earlier compared to the initial rebuilding alternatives.  The reduction of the $\text{T}_\text{MIN}$ resulted in a decrease in the $\text{T}_\text{MAX}$ to 2067. The probability of rebuilding, annual catches, OFLs, and relative spawning outputs by year are shown in Tables \ref{tab:prob-mat-catch} - \ref{tab:rel-ssb-mat-catch}.  -->

<!-- The final alternative rebuilding analysis that examined a range of specific rebuilding target years (Table \ref{tab:reb-options-year}) generally fell within alternatives explored in the initial analysis (Table \ref{tab:reb-options}) but provided additional granularity to see potential rebuilding timelines.  The probability of rebuilding, annual catches, OFLs, and relative spawning output by year are shown in Tables \ref{tab:prob-mat-year} - \ref{tab:rel-ssb-mat-year}   -->

## Results for sensitivity on selectivity blocks and selectivity form

Reference points and summary results for the sensitivity rebuilding analysis that was based on a model with selectivity blocks for both the recreational and commercial fleets applied in 2001 with dome-shaped selectivity in the recent blocks are shown in Tables \ref{tab:ref-points-block} and \ref{tab:ref-options-block}. Comparisons between stock synthesis output from the adopted base model and the sensitivity run are provided in [Appendix C]{#append_c}. The sensitivity had slightly higher estimates of unfished spawning output (Figure \ref{fig:ssb-sens}) and similar depletion estimates (Figure \ref{fig:depl-sens}) compared to the adopted base model. Selectivity in the recent block was domed at large sizes for both the recreational and commercial fleets, and right shifted in recent years for the commercial fleet (Figure \ref{fig:selex-sens}) so the numbers at age entered into the sensitivity rebuilding analysis were different from the numbers at age entered into the base rebuilding analysis, contributing to differences in results. 

However, we do not consider the sensitivity model to be an improvement over the base model. The shifts in the selectivity curve for the commercial fleet  fit the lower observed mean lengths in the 1990s and the higher observed mean lengths starting around 2010 better than the base model did (Figures \ref{fig:MeanLengthFit-base} and \ref{fig:MeanLengthFit-sens}), leading to an improvement in AIC. However the mode and right side of the estimated aggregate length distribution from the commercial fleet visually fit the data worse than the base model did (Figures \ref{fig:aggLenFit-sens} and \ref{fig:aggLenFit-sens}). Combined with the similarities in population scale and status, the base model is preferred due to parsimony. Improved understanding of where the fleets are fishing and sizes of quillback rockfish available by depth would better inform the selectivity curve for future assessments of this species. 


QUESTION: Is there more fit material needed. The amount of it seems extraneous to the rebuilding analysis. 

<!--chapter:end:30results.Rmd-->

# Acknowledgements
Andre Punt (University of Washington) quickly updated the rebuilder program to apply time-varying $\sigma$ for the Acceptable Biological Catch scenarios. Andre Punt and Owen Hamel (NOAA) provided assistant in understanding and applying the rebuilder program. Owen Hamel provided comments on early drafts of the analysis.


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

TO DO: Ensure spawning outputs reflect female spawning output

TO DO: Add sensitivity rebuilder results

<!-- ## Rebuilding reference points and summary of alternatives -->
## Rebuilding reference points

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
SB0 (millions of eggs) & 55.08\\
SB40 (millions of eggs) & 22.035\\
SB2021 (millions of eggs) & 7.745\\
Year rebuilding begins & 2023\\
Current year & 2021\\
Tmin & 2040\\
Mean generation time (years) & 27\\
Tmax & 2067\\
Pmax & TBD\\
Ttarget & TBD\\
SPRtarget & TBD\\*
\end{longtable}
\endgroup{}
\endgroup{}

<!-- ```{r, results = 'asis'} -->
<!-- # Rebuilding Reference Points Table -->
<!-- quants = c(round(reb[[2]]$sb0,2), -->
<!-- 		   round(reb[[2]]$sb40, 2), -->
<!-- 		   round(reb[[2]]$sb_ass_year, 2), -->
<!-- 		   reb[[2]]$recovery_spec[4], -->
<!-- 		   reb[[2]]$recovery_spec[3], -->
<!-- 		   reb[[2]]$tmin + reb[[2]]$recovery_spec[4],#I THINK THIS SHOULD BE RECOVERY_SPEC[3] because zero catch rebuild is 17 yet tmin is 19 so the two years of fixed catches from 2021 to 2023 are included in tmin already -->
<!-- 		   reb[[2]]$mean_gen, -->
<!-- 		   reb[[2]]$tmax, -->
<!-- 		   "TBD", -->
<!-- 		   "TBD", -->
<!-- 		   "TBD") -->
<!-- row_names = c("SB0 (millions of eggs)", "SB40% (millions of eggs)", -->
<!-- 			"SB2021 (millions of eggs)", "Year rebuilding begins", -->
<!-- 		    "Current year", "Tmin", "Mean generation time (years)", "Tmax", -->
<!-- 		    "Pmax", "Ttarget", "SPRtarget") -->
<!-- col_names = c("Parameter", "2021 Assessment Values") -->
<!-- out = cbind(row_names, quants) -->
<!-- table_format(x = out, -->
<!--              caption = "Summary of the rebuilding reference points when catch is not constrained by the ABC.", -->
<!--              label = "ref-points-noABCmax", -->
<!--              align = 'l', -->
<!--              col_names = col_names) -->
<!-- ``` -->

<!-- ```{r, results = 'asis'} -->
<!-- # Rebuilding Reference Points Table -->
<!-- quants = c(round(reb[[3]]$sb0,2), -->
<!-- 		   round(reb[[3]]$sb40, 2), -->
<!-- 		   round(reb[[3]]$sb_ass_year, 2), -->
<!-- 		   reb[[3]]$recovery_spec[4], -->
<!-- 		   reb[[3]]$recovery_spec[3], -->
<!-- 		   reb[[3]]$tmin + reb[[3]]$recovery_spec[4],#I THINK THIS SHOULD BE RECOVERY_SPEC[3] because zero catch rebuild is 17 yet tmin is 19 so the two years of fixed catches from 2021 to 2023 are included in tmin already -->
<!-- 		   reb[[3]]$mean_gen, -->
<!-- 		   reb[[3]]$tmax, -->
<!-- 		   "TBD", -->
<!-- 		   "TBD", -->
<!-- 		   "TBD") -->
<!-- row_names = c("SB0 (millions of eggs)", "SB40% (millions of eggs)", -->
<!-- 			"SB2021 (millions of eggs)", "Year rebuilding begins", -->
<!-- 		    "Current year", "Tmin", "Mean generation time (years)", "Tmax", -->
<!-- 		    "Pmax", "Ttarget", "SPRtarget") -->
<!-- col_names = c("Parameter", "2021 Assessment Values") -->
<!-- out = cbind(row_names, quants) -->
<!-- table_format(x = out, -->
<!--              caption = "Summary of the rebuilding reference points based on an SS model with sex equal to 1.", -->
<!--              label = "ref-points-sex1", -->
<!--              align = 'l', -->
<!--              col_names = col_names) -->
<!-- ``` -->

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

QUESTION: Should ACL actually be ACL contribution? 

<!-- ```{r, results = 'asis'} -->
<!-- # Rebuilding Reference Points Table -->
<!-- quants = rbind(round(reb[[2]]$acl_matrix[1:4,-1],2), -->
<!-- 		   reb[[2]]$rebuild_quants$SPR, -->
<!-- 		   reb[[2]]$rebuild_quants$Ttarget, -->
<!-- 		   rep(reb[[2]]$tmax, length(reb[[2]]$rebuild_quants$Ttarget)), -->
<!-- 		   reb[[2]]$rebuild_quants$Prebuild) # Prob by Tmax -->
<!-- row_names = c("2021 Assumed Removals (mt)", -->
<!-- 			  "2022 Assumed Removals (mt)", -->
<!-- 			  "2023 ACL (mt)", "2024 ACL (mt)", "SPR", "Ttarget", -->
<!-- 			  "Tmax", -->
<!-- 			  "Probability of recovery by Tmax") -->
<!-- out = cbind(row_names, quants) -->
<!-- col_names = c("", colnames(out)[-1]) -->
<!-- table_format(x = out, -->
<!--              caption = "Results of rebuilding alternatives based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021-22 when catches are not constrained by the ABC.", -->
<!--              label = "reb-options-noABCmax", -->
<!--              align = 'l', -->
<!--              landscape = TRUE, -->
<!--              col_names = col_names) -->
<!-- ``` -->


<!-- ```{r, results = 'asis'} -->
<!-- # Rebuilding Reference Points Table -->
<!-- quants = rbind(round(reb[[3]]$acl_matrix[1:4,-1],2), -->
<!-- 		   reb[[3]]$rebuild_quants$SPR, -->
<!-- 		   reb[[3]]$rebuild_quants$Ttarget, -->
<!-- 		   rep(reb[[3]]$tmax, length(reb[[3]]$rebuild_quants$Ttarget)), -->
<!-- 		   reb[[3]]$rebuild_quants$Prebuild) # Prob by Tmax -->
<!-- row_names = c("2021 Assumed Removals (mt)", -->
<!-- 			  "2022 Assumed Removals (mt)", -->
<!-- 			  "2023 ACL (mt)", "2024 ACL (mt)", "SPR", "Ttarget", -->
<!-- 			  "Tmax", -->
<!-- 			  "Probability of recovery by Tmax") -->
<!-- out = cbind(row_names, quants) -->
<!-- col_names = c("", colnames(out)[-1]) -->
<!-- table_format(x = out, -->
<!--              caption = "Results of rebuilding alternatives based on alternative SPR targets for 50 percent probability of recovery based on the assumed removals for 2021-22 when based on an SS model with sex equal to 1.", -->
<!--              label = "reb-options-sex1", -->
<!--              align = 'l', -->
<!--              landscape = TRUE, -->
<!--              col_names = col_names) -->
<!-- ``` -->

\clearpage

## Rebuilding alternative time series 

TO DO: Correct the captions since these are not just SPR alternatives

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

<!-- ## Rebuilding alternative time series when catches are not constrained by the ABC -->

<!-- ```{r, results = 'asis'} -->
<!-- out = as.data.frame(round(reb[[2]]$prob_matrix[1:55, ],3)) -->
<!-- table_format(x = out, -->
<!--              caption = "Probability of recovery by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC.", -->
<!--              label = "prob-mat-noABCmax", -->
<!--              align = 'l', -->
<!--              digits = 2, -->
<!--              col_names = colnames(out)) -->
<!-- ``` -->


<!-- ```{r, results = 'asis'} -->
<!-- out = as.data.frame(round(reb[[2]]$acl_matrix[1:55, ],2)) -->
<!-- table_format(x = out, -->
<!--              caption = "Catches (mt) by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC.", -->
<!--              label = "acl-mat-noABCmax", -->
<!--              align = 'l', -->
<!--              digits = 2, -->
<!--              col_names = colnames(out)) -->
<!-- ``` -->

<!-- ```{r, results = 'asis'} -->
<!-- out = as.data.frame(round(reb[[2]]$ofl_matrix[1:55, ],2)) -->
<!-- table_format(x = out, -->
<!--              caption = "OFLs (mt) by year for rebuilding SPR alternatives assuming catch is not constrained by the ABC.", -->
<!--              label = "ofl-mat-noABCmax", -->
<!--              align = 'l', -->
<!--              digits = 2, -->
<!--              col_names = colnames(out)) -->
<!-- ``` -->


<!-- ```{r, results = 'asis'} -->
<!-- out = as.data.frame(round(reb[[2]]$relativeb_matrix[1:55, ],2)) -->
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

![Probability of rebuilding by year for alternative rebuilding strategies.\label{fig:prob-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/930_F2017_2019_ageStruc2021/rebuilding_probability.png){width=100% height=100% alt="Probability of rebuilding by year for alternative rebuilding strategies."}


![Catches (mt) by year for alternative rebuilding strategies.\label{fig:acl-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/930_F2017_2019_ageStruc2021/rebuilding_acl.png){width=100% height=100% alt="Catches (mt) by year for alternative rebuilding strategies."}


![Spawning output relative to the management target of 40 percent of unfished spawning output by year for alternative rebuilding strategies.\label{fig:rel-ssb-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/930_F2017_2019_ageStruc2021/rebuilding_relative_sb.png){width=100% height=100% alt="Spawning output relative to the management target of 40 percent of unfished spawning output by year for alternative rebuilding strategies."}


![Spawning output by year for alternative rebuilding strategies.\label{fig:ssb-fig}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/930_F2017_2019_ageStruc2021/rebuilding_ssb.png){width=100% height=100% alt="Spawning output by year for alternative rebuilding strategies."}


<!-- <!-- Runs with no abc max --> -->
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


<!-- <!-- Runs based on SS model with sex = 1 --> -->
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

The rebuild.dat file used for the SPR alternative analysis has been provided as a separate file.

## Appendix B: Biological information used for the sensitivity rebuilder analysis with dome-shaped selectivity and blocks.{#append_b}



## Appendix C: Comparison between the approved stock synthesis base case model and the stock synthesis sensitivity model with dome-shaped selectivity and blocks.{#append_b}

<!-- Spawning output and status comparisons -->

![Change in estimated spawning output for the adopted stock synthesis base model (Base) and the stock synthesis sensitivity model (RecCom Block 2001). Shading indicates 95 percent confidence intervals around each scenario.\label{fig:ssb-sens}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up/figures/rebuilder_sensitivities_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Change in estimated spawning output for the adopted stock synthesis base model (Base) and the stock synthesis sensitivity model (RecCom Block 2001). Shading indicates 95 percent confidence intervals around each scenario."}

![Change in estimated fraction of unfished for the adopted stock synthesis base model (base) and the stock synthesis sensitivity model that informs the rebuilding sensitivity (RecCom Block 2001). Shading indicates 95 percent confidence intervals around each scenario.\label{fig:depl-sens}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up/figures/rebuilder_sensitivities_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Change in estimated fraction of unfished for the adopted stock synthesis base model (base) and the stock synthesis sensitivity model that informs the rebuilding sensitivity (RecCom Block 2001). Shading indicates 95 percent confidence intervals around each scenario."}



![Recreational and commercial selectivity for the stock synthesis sensitvity model with blocks in 2001 and allowing dome-shaped selectivity (red lines) compared to the sensitivity for the adopted base model (blue lines).\label{fig:selex-sens}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up/figures/selex_compare.png){width=100% height=100% alt="Recreational and commercial selectivity for the stock synthesis sensitvity model with blocks in 2001 and allowing dome-shaped selectivity (red lines) compared to the sensitivity for the adopted base model (blue lines)."}

<!-- Mean length fits -->

![Mean length and fit (blue line) for the commercial length data from the adoped stock synthesis base model with 95 percent confidence intervals (solid black bar) based on current samples sizes. Thinner intervals (with capped ends) show result of further adjusting sample sizes based on suggested multiplier for Francis data weighting.\label{fig:MeanLengthFit-base}](C:/Users/Brian.Langseth/Desktop/ca/9_0_0_postSSC_base/plots/comp_lenfit_data_weighting_TA1.8_CA_Commercial.png){width=90% height=90% alt="Mean length and fit (blue line) for the commercial length data from the adoped stock synthesis base model with 95 percent confidence intervals (solid black bar) based on current samples sizes. Thinner intervals (with capped ends) show result of further adjusting sample sizes based on suggested multiplier for Francis data weighting."}

![Mean length and fit (blue line) for the commercial length data from the stock synthesis sensitivity model with 95 percent confidence intervals (solid black bar) based on current samples sizes. Thinner intervals (with capped ends) show result of further adjusting sample sizes based on suggested multiplier for Francis data weighting.\label{fig:MeanLengthFit-sens}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/9_4_0_recComBlock2001/plots/comp_lenfit_data_weighting_TA1.8_CA_Commercial.png){width=90% height=90% alt="Mean length and fit (blue line) for the commercial length data from the stock synthesis sensitivity model with 95 percent confidence intervals (solid black bar) based on current samples sizes. Thinner intervals (with capped ends) show result of further adjusting sample sizes based on suggested multiplier for Francis data weighting."}

<!-- Aggregate length plots -->

![Aggregated length comps over all years for the adopted stock synthesis base model.\label{fig:aggLenFit-base}](C:/Users/Brian.Langseth/Desktop/ca/9_0_0_postSSC_base/plots/comp_lenfit__aggregated_across_time.png){width=100% height=100% alt="Aggregated length comps over all years for the adopted stock synthesis base model."}

![Aggregated length comps over all years for the stock synthesis sensitivity model.\label{fig:aggLenFit-sens}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/9_4_0_recComBlock2001/plots/comp_lenfit__aggregated_across_time.png){width=100% height=100% alt="Aggregated length comps over all years for the stock synthesis sensitivity model."}

<!-- Person residuals -->

![Pearson residuals for the recreational and commercial fleets for the adopted stock synthesis base model. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:Pearson-base}](C:/Users/Brian.Langseth/Desktop/ca/9_0_0_postSSC_base/plots/comp_lenfit__multi-fleet_comparison.png){width=90% height=90% alt="Pearson residuals for the recreational and commercial fleets for the adopted stock synthesis base model. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}

![Pearson residuals for the recreational and commercial fleets for the stock synthesis sensitivity model. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:Pearson-sens}](C:/Users/Brian.Langseth/Desktop/ca/rebuilder/9_4_0_recComBlock2001/plots/comp_lenfit__multi-fleet_comparison.png){width=90% height=90% alt="Pearson residuals for the recreational and commercial fleets for the stock synthesis sensitivity model. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}

<!--chapter:end:60appendix.Rmd-->

