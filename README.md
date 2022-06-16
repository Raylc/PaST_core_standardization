# PaST_core_standardization
Code and data for Skill and core standardization: An experiment with Oldowan-like flaking systems

## Getting Started

### Dependencies
The code has been successfully executed on JP's MAC and replicated on CL's PC with the following R settings.

* JP's R setting
``` 
R version 4.0.3 (2020-10-10)
Platform: x86_64-apple-darwin17.0 (64-bit)
Running under: macOS Big Sur 10.16
Matrix products: default
LAPACK: /Library/Frameworks/R.framework/Versions/4.0/Resources/lib/libRlapack.dylib
locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base
other attached packages:
 [1] ggggeffects_0.0.1 permuco_1.1.0     caret_6.0-88      rcompanion_2.4.1  sjPlot_2.8.8      ggeffects_1.1.1   report_0.3.5      glmulti_1.0.8
 [9] leaps_3.1         rJava_1.0-4       Hmisc_4.5-0       Formula_1.2-4     survival_3.2-7    lattice_0.20-41   psych_2.0.12      factoextra_1.0.7
[17] stringr_1.4.0     DescTools_0.99.41 dplyr_1.0.6       plyr_1.8.6        tidyr_1.1.3       reshape2_1.4.4    ggplot2_3.3.5     car_3.0-10
[25] carData_3.0-4
loaded via a namespace (and not attached):
  [1] readxl_1.3.1         backports_1.2.1      splines_4.0.3        TH.data_1.0-10       digest_0.6.27        foreach_1.5.1        htmltools_0.5.1.1
  [8] fansi_0.5.0          magrittr_2.0.1       checkmate_2.0.0      cluster_2.1.0        openxlsx_4.2.3       recipes_0.1.16       gower_0.2.2
 [15] modelr_0.1.8         matrixStats_0.57.0   sandwich_3.0-1       jpeg_0.1-8.1         colorspace_2.0-2     ggrepel_0.9.1        haven_2.3.1
 [22] xfun_0.23            crayon_1.4.1         libcoin_1.0-8        Exact_2.1            lme4_1.1-27          zoo_1.8-9            iterators_1.0.13
 [29] glue_1.4.2           gtable_0.3.0         ipred_0.9-11         emmeans_1.6.1        sjstats_0.18.1       sjmisc_2.8.7         abind_1.4-5
 [36] scales_1.1.1         mvtnorm_1.1-2        DBI_1.1.1            Rcpp_1.0.6           xtable_1.8-4         performance_0.7.2    htmlTable_2.2.1
 [43] tmvnsim_1.0-2        foreign_0.8-80       proxy_0.4-25         lava_1.6.9           prodlim_2019.11.13   stats4_4.0.3         htmlwidgets_1.5.3
 [50] RColorBrewer_1.1-2   ellipsis_0.3.2       modeltools_0.2-23    farver_2.1.0         pkgconfig_2.0.3      nnet_7.3-14          multcompView_0.1-8
 [57] utf8_1.2.2           labeling_0.4.2       tidyselect_1.1.1     rlang_0.4.11         effectsize_0.4.5     munsell_0.5.0        cellranger_1.1.0
 [64] tools_4.0.3          fortunes_1.5-4       generics_0.1.0       sjlabelled_1.1.8     broom_0.7.6          ModelMetrics_1.2.2.2 knitr_1.33
 [71] zip_2.1.1            purrr_0.3.4          coin_1.4-1           rootSolve_1.8.2.1    nlme_3.1-149         compiler_4.0.3       rstudioapi_0.13
 [78] curl_4.3.1           png_0.1-7            e1071_1.7-6          tibble_3.1.3         stringi_1.6.2        parameters_0.14.0.1  forcats_0.5.1
 [85] Matrix_1.2-18        nloptr_1.2.2.2       permute_0.9-5        vctrs_0.3.8          pillar_1.6.2         lifecycle_1.0.0      lmtest_0.9-38
 [92] estimability_1.3     data.table_1.14.0    insight_0.14.2       lmom_2.8             R6_2.5.0             latticeExtra_0.6-29  gridExtra_2.3
 [99] rio_0.5.16           gld_2.6.2            codetools_0.2-16     boot_1.3-25          MASS_7.3-53          assertthat_0.2.1     withr_2.4.2
[106] nortest_1.0-4        mnormt_2.0.2         multcomp_1.4-17      bayestestR_0.10.5    expm_0.999-6         parallel_4.0.3       hms_1.0.0
[113] timeDate_3043.102    grid_4.0.3           rpart_4.1-15         coda_0.19-4          class_7.3-17         minqa_1.2.4          pROC_1.17.0.1
[120] lubridate_1.7.10     base64enc_0.1-3 
``` 

* CL's R setting
 ``` 
R version 4.1.1 (2021-08-10)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 19043)

Matrix products: default

locale:
[1] LC_COLLATE=English_United States.1252 
[2] LC_CTYPE=English_United States.1252   
[3] LC_MONETARY=English_United States.1252
[4] LC_NUMERIC=C                          
[5] LC_TIME=English_United States.1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] betareg_3.1-4     janitor_2.1.0     forcats_0.5.1     rstatix_0.7.0    
 [5] ggpubr_0.4.0      sjPlot_2.8.9      ggeffects_1.1.1   Hmisc_4.5-0      
 [9] Formula_1.2-4     survival_3.2-11   lattice_0.20-44   factoextra_1.0.7 
[13] stringr_1.4.0     DescTools_0.99.42 dplyr_1.0.7       plyr_1.8.6       
[17] tidyr_1.1.3       reshape2_1.4.4    ggplot2_3.3.5    

loaded via a namespace (and not attached):
  [1] TH.data_1.0-10      minqa_1.2.4         colorspace_2.0-2   
  [4] ggsignif_0.6.3      modeltools_0.2-23   ellipsis_0.3.2     
  [7] class_7.3-19        rio_0.5.27          sjlabelled_1.1.8   
 [10] snakecase_0.11.0    estimability_1.3    htmlTable_2.2.1    
 [13] parameters_0.17.0   base64enc_0.1-3     gld_2.6.2          
 [16] rstudioapi_0.13     proxy_0.4-26        farver_2.1.0       
 [19] flexmix_2.3-18      ggrepel_0.9.1       lubridate_1.7.10   
 [22] fansi_0.5.0         mvtnorm_1.1-2       codetools_0.2-18   
 [25] splines_4.1.1       rootSolve_1.8.2.2   knitr_1.33         
 [28] sjmisc_2.8.7        nloptr_1.2.2.2      broom_0.7.9        
 [31] cluster_2.1.2       png_0.1-7           effectsize_0.6.0.1 
 [34] compiler_4.1.1      sjstats_0.18.1      emmeans_1.6.2-1    
 [37] backports_1.2.1     assertthat_0.2.1    Matrix_1.3-4       
 [40] cli_3.0.1           htmltools_0.5.1.1   tools_4.1.1        
 [43] coda_0.19-4         gtable_0.3.0        glue_1.4.2         
 [46] lmom_2.8            Rcpp_1.0.7          carData_3.0-4      
 [49] cellranger_1.1.0    vctrs_0.3.8         nlme_3.1-152       
 [52] lmtest_0.9-38       insight_0.17.0      xfun_0.25          
 [55] openxlsx_4.2.4      lme4_1.1-27.1       lifecycle_1.0.0    
 [58] MASS_7.3-54         zoo_1.8-9           scales_1.1.1       
 [61] hms_1.1.0           sandwich_3.0-1      expm_0.999-6       
 [64] RColorBrewer_1.1-2  curl_4.3.2          Exact_2.1          
 [67] gridExtra_2.3       rpart_4.1-15        latticeExtra_0.6-29
 [70] stringi_1.7.3       bayestestR_0.11.5   e1071_1.7-8        
 [73] checkmate_2.0.0     boot_1.3-28         zip_2.2.0          
 [76] rlang_0.4.11        pkgconfig_2.0.3     purrr_0.3.4        
 [79] labeling_0.4.2      htmlwidgets_1.5.3   tidyselect_1.1.1   
 [82] magrittr_2.0.1      R6_2.5.0            generics_0.1.0     
 [85] multcomp_1.4-17     DBI_1.1.1           pillar_1.6.2       
 [88] haven_2.4.3         foreign_0.8-81      withr_2.4.2        
 [91] abind_1.4-5         datawizard_0.4.0    nnet_7.3-16        
 [94] tibble_3.1.3        performance_0.9.0   modelr_0.1.8       
 [97] crayon_1.4.1        car_3.0-11          utf8_1.2.2         
[100] jpeg_0.1-9          grid_4.1.1          readxl_1.3.1       
[103] data.table_1.14.0   digest_0.6.27       xtable_1.8-4       
[106] stats4_4.1.1        munsell_0.5.0   
 ``` 

## Help

Please contact revevanpwilson@gmail.com or justin.pargeter@nyu.edu or raylc1996@outlook.com if you have any questions realted to the code.