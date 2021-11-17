# In this file, write the R-code necessary to load your original data file
# (e.g., an SPSS, Excel, or SAS-file), and convert it to a data.frame. Then,
# use the function open_data(your_data_frame) or closed_data(your_data_frame)
# to store the data.

library(worcs)
library(readxl)
library(dplyr)
library(mice)
install.packages("naniar")
library(naniar)
library(stats)
library(survey)
library(MASS)
library(mitools)
library(broom)
library(ggeffects)
library(miceadds)

rm(list=ls(all=TRUE))
getwd()
setwd("/Users/noltinho/Git_projects/first_project")
ca.barometer <- read_excel('central_asia_barometer.xlsx')
str(ca.barometer)
set.seed(123)

# Specify the survey design
ca.design <- svydesign(ids=~SamPt, weight=~totwt, data=ca.barometer)
summary(ca.barometer$totwt)
svyciprop(~OwnPC, ca.design)

# Subset variables used for multiple imputation
ca.imputation <- subset(ca.barometer, select=c("ThreatHi","SamPt","NetComp","Gender",
                                               "Educ","OwnPC","UseNet",
                                               "nextyear_M","Statements1","OpinionPak",
                                               "OpinionRussia","CanBuy_M","Region_M",
                                               "TodayEcSit_M","GeoCode","AgeGroup2",
                                               "TrustGov_M","totwt"))
ca.imputation <- ca.imputation %>%
  replace_with_na_all(condition = ~.x %in% c("Don't Know (vol.)","Refused (vol.)",
                                             "Not Asked", 
                                             "Too hard to say / Don't Know (vol.)"))
str(ca.imputation)

# adjust variable ThreatHi
ca.imputation <- ca.imputation %>%
  mutate(ThreatHi = case_when(
    ThreatHi == "Very low" ~ 0,
    ThreatHi == "Somewhat low" ~ 0,
    ThreatHi == "Somewhat high" ~ 1,
    ThreatHi == "Very high" ~ 1
  ))
ca.imputation$ThreatHi <- as.factor(ca.imputation$ThreatHi)

unique(ca.imputation$NetComp)
# adjust variable NetComp
ca.imputation <- ca.imputation %>%
  mutate(NetComp = case_when(
    NetComp == "Never" ~ 1,
    NetComp == "Rarely" ~ 2,
    NetComp == "Several times a month" ~ 3,
    NetComp == "Several times a week" ~ 4,
    NetComp == "Daily" ~ 5
  ))
ca.imputation$NetComp <- as.factor(ca.imputation$NetComp)

# adjust variable nextyear_M
ca.imputation <- ca.imputation %>%
  mutate(nextyear_M = case_when(
    nextyear_M == "Become Worse" ~ 1,
    nextyear_M == "Stay About the Same" ~ 2,
    nextyear_M == "Become Better" ~ 3
  ))
ca.imputation$nextyear_M <- as.factor(ca.imputation$nextyear_M)

unique(ca.imputation$Statements1)
# adjust variable Statements1
ca.imputation <- ca.imputation %>%
  mutate(Statements1 = case_when(
    Statements1 == "Strongly disagree" ~ 1,
    Statements1 == "Disagree somewhat" ~ 2,
    Statements1 == "Agree somewhat" ~ 3,
    Statements1 == "Strongly agree" ~ 4
  ))
ca.imputation$Statements1 <- as.factor(ca.imputation$Statements1)

unique(ca.imputation$OpinionPak)
# adjust variable Statements1
ca.imputation <- ca.imputation %>%
  mutate(OpinionPak = case_when(
    OpinionPak == "Very Unfavorable" ~ 1,
    OpinionPak == "Somewhat Unfavorable" ~ 2,
    OpinionPak == "Somewhat Favorable" ~ 3,
    OpinionPak == "Very Favorable" ~ 4
  ))
ca.imputation$OpinionPak <- as.factor(ca.imputation$OpinionPak)

unique(ca.imputation$OpinionRussia)
# adjust variable Statements1
ca.imputation <- ca.imputation %>%
  mutate(OpinionRussia = case_when(
    OpinionRussia == "Very Unfavorable" ~ 1,
    OpinionRussia == "Somewhat Unfavorable" ~ 2,
    OpinionRussia == "Somewhat Favorable" ~ 3,
    OpinionRussia == "Very Favorable" ~ 4
  ))
ca.imputation$OpinionRussia <- as.factor(ca.imputation$OpinionRussia)

unique(ca.imputation$CanBuy_M)
# adjust variable CanBuy_M
ca.imputation <- ca.imputation %>%
  mutate(CanBuy_M = case_when(
    CanBuy_M == "We have just enough money for buying food" ~ 1,
    CanBuy_M == "We can buy food, but buying clothes causes financial difficulties" ~ 2,
    CanBuy_M == "We can buy food and clothes, but do not have money to buy long-term items, like a TV or a refrigerator" ~ 3,
    CanBuy_M == "We can buy long-term equipment, but we cannot afford to buy expensive things, like a car" ~ 4,
    CanBuy_M == "Our income is enough for anything else but such things like a flat or a country house" ~ 5,
    CanBuy_M == "We do not experience financial difficulties and if necessary can buy anything" ~ 6
  ))
ca.imputation$CanBuy_M <- as.factor(ca.imputation$CanBuy_M)

# adjust variable TodayEcSit_M
ca.imputation <- ca.imputation %>%
  mutate(TodayEcSit_M = case_when(
    TodayEcSit_M == "Much Worse" ~ 1,
    TodayEcSit_M == "Somewhat Worse" ~ 2,
    TodayEcSit_M == "About the Same" ~ 3,
    TodayEcSit_M == "Somewhat Better" ~ 4,
    TodayEcSit_M == "Much Better" ~ 5
  ))
ca.imputation$TodayEcSit_M <- as.factor(ca.imputation$TodayEcSit_M)

unique(ca.imputation$AgeGroup2)
# adjust variable AgeGroup2
ca.imputation <- ca.imputation %>%
  mutate(AgeGroup2 = case_when(
    AgeGroup2 == "18-29" ~ 1,
    AgeGroup2 == "30-39" ~ 2,
    AgeGroup2 == "40-49" ~ 3,
    AgeGroup2 == "50-59" ~ 4,
    AgeGroup2 == "60+" ~ 5
  ))
ca.imputation$AgeGroup2 <- as.factor(ca.imputation$AgeGroup2)

# change remaining variables to factors
ca.imputation$SamPt <- as.factor(ca.imputation$SamPt)
ca.imputation$NetComp <- as.factor(ca.imputation$NetComp)
ca.imputation$Gender <- as.factor(ca.imputation$Gender)
ca.imputation$OwnPC <- as.factor(ca.imputation$OwnPC)
ca.imputation$UseNet <- as.factor(ca.imputation$UseNet)
ca.imputation$GeoCode <- as.factor(ca.imputation$GeoCode)
ca.imputation$Region_M <- as.factor(ca.imputation$Region_M)
ca.imputation$TrustGov_M <- as.factor(ca.imputation$TrustGov_M)

str(ca.imputation)

open_data(ca.imputation, "ca.imputation.csv")
git_update(message=paste0("first try"))





