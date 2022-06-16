# PaST_core_standardization
Code and data for Skill and core uniformity: An experiment with Oldowan-like flaking systems

## Getting Started
Please open the Rproj file instead of the Rcode directly to make sure relative paths work!

### Dependencies
The code has been successfully executed on JP's MAC and replicated on CL's PC with the following R settings.

* JP's R setting
``` 
R version 4.0.3 (2020-10-10)
Platform: x86_64-apple-darwin17.0 (64-bit)
Running under: macOS  11.6.6

Matrix products: default
LAPACK: /Library/Frameworks/R.framework/Versions/4.0/Resources/lib/libRlapack.dylib

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] janitor_2.1.0     forcats_0.5.1     rstatix_0.7.0     ggpubr_0.4.0     
[5] ggeffects_1.1.1   glmulti_1.0.8     leaps_3.1         rJava_1.0-4      
[9] Hmisc_4.5-0       Formula_1.2-4     survival_3.2-7    lattice_0.20-41  
[13] factoextra_1.0.7  stringr_1.4.0     DescTools_0.99.41 dplyr_1.0.6      
[17] plyr_1.8.6        tidyr_1.1.3       reshape2_1.4.4    ggplot2_3.3.5    
[21] fortunes_1.5-4   

loaded via a namespace (and not attached):
[1] TH.data_1.0-10      colorspace_2.0-2    ggsignif_0.6.0      ellipsis_0.3.2     
[5] class_7.3-17        modeltools_0.2-23   rio_0.5.16          snakecase_0.11.0   
[9] estimability_1.3    htmlTable_2.2.1     parameters_0.17.0   base64enc_0.1-3    
[13] gld_2.6.2           rstudioapi_0.13     proxy_0.4-25        ggrepel_0.9.1      
[17] flexmix_2.3-18      lubridate_1.7.10    fansi_0.5.0         mvtnorm_1.1-2      
[21] codetools_0.2-16    splines_4.0.3       rootSolve_1.8.2.1   knitr_1.33         
[25] broom_0.7.6         cluster_2.1.0       png_0.1-7           effectsize_0.6.0.1 
[29] compiler_4.0.3      emmeans_1.6.1       backports_1.2.1     assertthat_0.2.1   
[33] Matrix_1.2-18       htmltools_0.5.1.1   tools_4.0.3         coda_0.19-4        
[37] gtable_0.3.0        glue_1.4.2          lmom_2.8            Rcpp_1.0.6         
[41] carData_3.0-4       cellranger_1.1.0    vctrs_0.3.8         betareg_3.1-4      
[45] lmtest_0.9-38       insight_0.17.1      xfun_0.23           openxlsx_4.2.3     
[49] lifecycle_1.0.0     MASS_7.3-53         zoo_1.8-9           scales_1.1.1       
[53] hms_1.0.0           sandwich_3.0-1      expm_0.999-6        RColorBrewer_1.1-2 
[57] curl_4.3.1          Exact_2.1           gridExtra_2.3       rpart_4.1-15       
[61] latticeExtra_0.6-29 stringi_1.6.2       bayestestR_0.11.5   e1071_1.7-6        
[65] checkmate_2.0.0     boot_1.3-25         zip_2.1.1           rlang_0.4.11       
[69] pkgconfig_2.0.3     purrr_0.3.4         htmlwidgets_1.5.3   tidyselect_1.1.1   
[73] magrittr_2.0.1      R6_2.5.0            generics_0.1.0      multcomp_1.4-17    
[77] DBI_1.1.1           pillar_1.6.2        haven_2.3.1         foreign_0.8-80     
[81] withr_2.4.2         abind_1.4-5         datawizard_0.4.1    nnet_7.3-14        
[85] tibble_3.1.3        performance_0.9.0   crayon_1.4.1        car_3.0-10         
[89] utf8_1.2.2          jpeg_0.1-8.1        grid_4.0.3          readxl_1.3.1       
[93] data.table_1.14.0   digest_0.6.27       xtable_1.8-4        stats4_4.0.3       
[97] munsell_0.5.0      
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