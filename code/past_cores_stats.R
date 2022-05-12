library(ggplot2)
library(reshape2)
library(tidyr)
library(plyr)
library(dplyr)
library(DescTools)
library(stringr)
library("factoextra")
library(Hmisc)
library(glmulti)
library(report)
library(ggeffects) 
library(sjPlot)
library(ggpubr)
library(rstatix)
library(forcats)
library(janitor)

getwd()

## Data ####

cores_data<-read.csv("data/cores_complete.csv") %>%
      mutate(area_volume=surface_area/volume) %>%
   mutate(Participant=as.factor(Participant),
          Group = as.factor(Group),
          Core = as.factor(Core),
          Instructional.Condition=as.factor(Instructional.Condition))

load("data/past_core.RData")

### Individual Toth (2006) variables data plots
##group level comparisons
##variance tests

complete_past_core_data_expert_nona<-complete_past_core_data_expert %>%
   na.omit()

# Fig. 1 Flake scars/core mass
ggplot(complete_past_core_data_expert, aes(x=condition_threeway, y=Flake.Scars_Core.Mass))+
      geom_boxplot()+
      geom_jitter()+
      labs(x ="", y = "Flake scars/Core mass")

summary(aov(Flake.Scars_Core.Mass ~ condition_threeway, complete_past_core_data_expert))
bartlett.test(Flake.Scars_Core.Mass ~ condition_threeway, complete_past_core_data_expert)

# Fig. 2 Flaking invasiveness
ggplot(complete_past_core_data_expert, aes(x=condition_threeway, y=Avg.Scar.Max_Max.Core.Dimension))+
   geom_boxplot()+   
   geom_jitter()+
      labs(x ="", y = "Flaking invasiveness")

summary(aov(Avg.Scar.Max_Max.Core.Dimension ~ condition_threeway, complete_past_core_data_expert))
bartlett.test(Avg.Scar.Max_Max.Core.Dimension ~ condition_threeway, complete_past_core_data_expert)

# Fig. 3 Area of the battered platform
ggplot(complete_past_core_data_expert, aes(x=condition_threeway, y=Area.of.Battered.Platform))+
      geom_boxplot()+
      geom_jitter()+
      labs(x ="", y = "Area of platform batterning")

summary(aov(Area.of.Battered.Platform ~ condition_threeway, complete_past_core_data_expert))
bartlett.test(Area.of.Battered.Platform ~ condition_threeway, complete_past_core_data_expert)

# Fig. 4 Area to volume ratio
ggplot(complete_past_core_data_expert, aes(x=condition_threeway, y=area_volume))+
      geom_boxplot()+
      geom_jitter()+
      labs(x ="", y = "Area to volume ratio")

summary(aov(area_volume ~ condition_threeway, complete_past_core_data_expert))

bartlett.test(area_volume ~ condition_threeway, complete_past_core_data_expert)

### Variance in Totth (2006) attributes by core
## Variance tests

cores_data_no_expert<-filter(cores_data, !Group=="expert") %>%
   mutate(Order=as.factor(Order)) %>%
   droplevels(cores_data_no_expert$Group) %>%
   na.omit()

# Fig. 5 Flake scars/core mass
ggplot(cores_data_no_expert, aes(x=as.factor(Order), y=Flake.Scars_Core.Mass))+
      geom_boxplot()+
      geom_jitter()+
      labs(x ="", y = "Flake scars/Core mass")

bartlett.test(Flake.Scars_Core.Mass ~ Order, cores_data_no_expert)

# Fig. 6 Flaking invasiveness
ggplot(cores_data_no_expert, aes(x=Order, y=Avg.Scar.Max_Max.Core.Dimension))+
      geom_boxplot()+
      geom_jitter()+
      labs(x ="Core flaking order", y = "Flaking invasiveness")

bartlett.test(Avg.Scar.Max_Max.Core.Dimension ~ Order, cores_data_no_expert)

# Fig. 7 Platform battering
ggplot(cores_data_no_expert, aes(x=Order, y=Area.of.Battered.Platform))+
   geom_boxplot()+
   geom_jitter()+
   labs(x ="Core flaking order", y = "Area of platform battering")

bartlett.test(Area.of.Battered.Platform ~ Order, cores_data_no_expert)

# Fig. 8 Core area/volume
ggplot(cores_data_no_expert, aes(x=Order, y=area_volume))+
   geom_boxplot()+
   geom_jitter()+
   labs(x ="Core flaking order", y = "Core area/volume")

bartlett.test(area_volume ~ Order, cores_data_no_expert)

## Gona comparisons

# edge battering

edgebattering_summary<-complete_past_core_data_expert %>%
   mutate(battering_classes= case_when(Area.of.Battered.Platform <1 ~ "none",
                                       Area.of.Battered.Platform %in% 1:24 ~ "low",
                                       Area.of.Battered.Platform %in% 25:75 ~ "moderate",
                                       Area.of.Battered.Platform %in% 76:100 ~ "high"),
          battering_classes=factor(battering_classes,levels = c("none", "low", "moderate", "high"))) %>%
   select(Group,condition_threeway,battering_classes) %>%
   na.omit() %>%
   tabyl(condition_threeway,battering_classes)
   #adorn_percentages("row") %>%
   #adorn_pct_formatting(digits = 2)

# flaking invasiveness

invasiveness_summary<-complete_past_core_data_expert %>%
   mutate(invasiveness= ntile(Avg.Scar.Max_Max.Core.Dimension, n=3),
          invasiveness_class=case_when(invasiveness == 1 ~ "shallow",
                                       invasiveness == 2 ~ "moderate",
                                       invasiveness == 3 ~ "invasive"),
          invasiveness=factor(invasiveness,levels = c("shallow", "moderate", "invasive"))) %>%
   select(Group,condition_threeway,invasiveness_class) %>%
   drop_na(invasiveness_class) %>%
   tabyl(condition_threeway,invasiveness_class) %>%
   adorn_percentages("row") %>%
   adorn_pct_formatting(digits = 2)

# cortex

cortex_summary<-complete_past_core_data_expert %>%
   group_by(condition_threeway) %>%
   summarise(mean=mean(Cortex, na.rm=T), sd=sd(Cortex,na.rm=T))
