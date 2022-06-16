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
library(betareg)

getwd()

## Data ##

core_mass_data<-read.csv("data/cores_data.csv") %>%
   rename("Participant"=Subject,
          "Core"=nodule_number,
          "starting_mass"=mass) %>%
   select(c(Core,starting_mass))

cores_data<-read.csv("data/cores_complete.csv") %>%
      mutate(area_volume=surface_area/volume) %>%
   mutate(Participant=as.factor(Participant),
          Group = as.factor(Group),
          Core = as.factor(Core),
          Instructional.Condition=as.factor(Instructional.Condition))

complete_experiment_data<-merge(cores_data, core_mass_data, by=c("Core"), all.x=T) %>%
   mutate(core_start_end_mass=(starting_mass-Core.End.Mass)/starting_mass*100,
          condition_threeway=case_when(Group=='expert'~"expert",
                                       Instructional.Condition=='0'~"observation only",
                                       Instructional.Condition=='1'~"active teaching",
                                       TRUE~"NA"),
          condition_threeway=factor(condition_threeway,
                                    levels=c("observation only",
                                             "active teaching","expert")),
          sdi=Flake.Scars_10mm/surface_area,
          cortex_prop=Cortex/100,
          cortex_prop=cortex_prop+0.01)

### Individual Toth (2006) variables data plots
##group level comparisons
##variance tests

# Fig. 1 SDI
ggplot(complete_experiment_data, aes(x=condition_threeway, y=sdi))+
   geom_boxplot()+
   geom_jitter()+
   labs(x="", y="Scar density index")

sdi_aov<-aov(sdi~condition_threeway, complete_experiment_data)
summary(sdi_aov)
tukey_hsd(sdi_aov)
bartlett.test(sdi~condition_threeway, complete_experiment_data)

# Fig.2 relative mass
ggplot(complete_experiment_data, aes(x=condition_threeway, y=core_start_end_mass))+
   geom_boxplot()+
   geom_jitter()+
   labs(x="", y="Percentage mass reduced")

core_start_end_mass_aov<-aov(core_start_end_mass~condition_threeway, complete_experiment_data)
summary(core_start_end_mass_aov)
tukey_hsd(core_start_end_mass_aov)
bartlett.test(core_start_end_mass~condition_threeway, complete_experiment_data)

# Fig.3 Flaking invasiveness

scar_size_core_size<-lm(Core.End.Mass~Avg.Flake.Scar.Max.Dimension_mm,
                        data=complete_experiment_data, na.action=na.exclude)

residuals<-residuals(lm(Max.Core.Dimension~Avg.Flake.Scar.Max.Dimension_mm,
                        data=complete_experiment_data, na.action=na.exclude))

complete_experiment_data$residuals<-residuals

ggplot(complete_experiment_data, aes(x=condition_threeway, 
                                     y=residuals))+
   geom_boxplot()+
   geom_jitter()+
   labs(x="", y="Core max dimension/flake scar size residuals")

invasiveness<-aov(residuals~condition_threeway, complete_experiment_data)
summary(invasiveness)
tukey_hsd(invasiveness)
bartlett.test(residuals~condition_threeway, complete_experiment_data)

# Fig. 4 Area of the battered platform
ggplot(complete_experiment_data, aes(x=condition_threeway, y=Area.of.Battered.Platform))+
   geom_boxplot()+
   geom_jitter()+
   labs(x="", y="Area of platform batterning")

summary(aov(Area.of.Battered.Platform~condition_threeway, complete_experiment_data))
bartlett.test(Area.of.Battered.Platform~condition_threeway, complete_experiment_data)

# Fig. 5 percentage cortex
ggplot(complete_experiment_data, aes(x=condition_threeway, y=cortex_prop))+
   geom_boxplot()+
   geom_jitter()+
   labs(x="", y="Remaining cortex")


betaMod<-betareg(cortex_prop~condition_threeway, data=complete_experiment_data)
summary(betaMod)

## Gona comparisons

# edge battering

edgebattering_summary<-complete_experiment_data%>%
   mutate(battering_classes=case_when(Area.of.Battered.Platform<1~"none",
                                      Area.of.Battered.Platform%in%1:24~"low",
                                      Area.of.Battered.Platform%in%25:75~"moderate",
                                      Area.of.Battered.Platform%in%76:100~"high"),
          battering_classes=factor(battering_classes,levels=c("none", "low", "moderate", "high"))) %>%
   select(Group,condition_threeway,battering_classes) %>%
   na.omit() %>%
   tabyl(condition_threeway,battering_classes)
#adorn_percentages("row") %>%
#adorn_pct_formatting(digits = 2)

# flaking invasiveness

invasiveness_summary<-complete_experiment_data%>%
   mutate(invasiveness=ntile(residuals, n=3),
          invasiveness_class=case_when(invasiveness==1~"invasive",
                                       invasiveness==2~"moderate",
                                       invasiveness==3~"shallow"),
          invasiveness=factor(invasiveness,levels=c("shallow", "moderate", "invasive"))) %>%
   select(Group,condition_threeway,invasiveness_class) %>%
   drop_na(invasiveness_class) %>%
   tabyl(condition_threeway,invasiveness_class) %>%
   adorn_percentages("row") %>%
   adorn_pct_formatting(digits=2)

# cortex

cortex_summary<-complete_experiment_data%>%
   group_by(condition_threeway) %>%
   summarise(mean=mean(Cortex, na.rm=T), sd=sd(Cortex,na.rm=T))

