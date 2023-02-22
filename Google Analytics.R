library(ggplot2)
library(tidyverse)
library(dplyr)
library(readr)

#Reading all the data from the csv files
sleep_info<-read_csv("sleep_info.csv")
heart_beat_info<-read_csv("heart_beat_info.csv")
individual_activity<-read_csv("individual_activity_info.csv")
steps_info<-read_csv("steps_info.csv")

#Bar plot for number of days people were engaged in activites
ggplot(data=individual_activity,aes(x=type_of_days,fill=type_of_days))+
  geom_bar()+geom_text(stat='count',aes(label=..count..),vjust=0)+
  labs(title="Number of days people tracked activities",x="Number of days", y="Number of people")+
  guides(fill=guide_legend(title="Category of days"))+
  scale_fill_brewer(palette="Dark2")
  

#Scatter Plot for no of people in very active minutes
ggplot(data=individual_activity)+geom_point(mapping=aes(x=tot_very_active_minutes/60,y=participant_Id,colour="Very active"))+
geom_point(mapping=aes(x=tot_lightly_active_minutes/60,y=participant_Id,colour="lightly active"))+
geom_point(mapping=aes(x=tot_fairly_active_minutes/60,y=participant_Id,colour="fairly active"))+
geom_point(mapping=aes(x=tot_sedentary_minutes/60,y=participant_Id,colour="sedentary"))+
labs(title="Number of hours spent in different activities in a month",x="No of hours",y="Participants")+
  guides(colour=guide_legend("Type of activities"))

#Bar Plot for no of steps taken by people 
ggplot(data=steps_info,aes(x=step_type,fill=step_type))+
  geom_bar()+geom_text(stat='count',aes(label=..count..),vjust=0)+
  labs(title="Average number of steps taken by participants in a day",x="Category of steps",y="Number of people")+
  guides(fill=guide_legend(title="Category of steps"))



#Bar plot for No of days sleep was recorded
ggplot(data=sleep_info,aes(x=type_of_days,fill=type_of_days))+
  geom_bar()+geom_text(stat='count',aes(label=..count..),vjust=0)+
  labs(title="Number of sleep days recorded",x="Number of days",y="Number of people")+
  guides(fill=guide_legend(title="Category of days"))


#Bar plot for No of minutes spent in bed after sleep
ggplot(data=sleep_info,aes(x=time_in_bed,fill=time_in_bed))+
  geom_bar()+geom_text(stat='count',aes(label=..count..),vjust=0)+
  labs(title="Average number of minutes spent in bed after sleep",x="Time in minutes",y="Number of people")+
  guides(fill=guide_legend(title="Category of days"))

#Average heartbeat for the participants
ggplot(data=heart_beat_info)+geom_point(mapping=aes(x=average_heart_beat,y=participant_Id),colour="purple")+
  labs(title="Average heartbeat of particpants per day",x="average heart beat",y="participants")

#Range of Minimum heartbeat seen in participants
ggplot(data=heart_beat_info)+geom_line(aes(y=Min_heart_beat,x=participant_Id,colour="Minimum heart beat"))+
  geom_line(aes(y=Max_heart_beat,x=participant_Id,colour="Maximum heart beat"))+
  geom_line(aes(y=average_heart_beat,x=participant_Id,colour="Average heart beat"))+
  labs(title="Range of Average, Min and Max heartbeat recorded for participants",x="participants",y="heart beat")

#Individual Analysis for participant_Id=6962181067
heart_beat_1<-read_csv("heart_beat_6962181067.csv")
weight_log_1<-read_csv("weight_log_6962181067.csv")
activity_log_1<-read_csv("activity_info_6962181067.csv")

#line plot for involvement in activities
ggplot(data=activity_log_1)+geom_line(aes(x=activity_date,y=very_active_minutes,colour="very active"))+
  geom_line(aes(y=lightly_active_minutes,x=activity_date,colour="lightly active"))+
  geom_line(aes(y=fairly_active_minutes,x=activity_date,colour="fairly active"))+
  geom_line(aes(y=sedentary_minutes,x=activity_date,colour="sedentary minutes"))+
  labs(title="Types of minutes spent on actvities",x="date",y="activity time in minutes")

#Daily steps over the days
ggplot(data=activity_log_1)+geom_line(aes(x=activity_date,y=daily_steps),colour="blue")+
  labs(title="The number of steps in a month",x="Date",y="Number of steps in a day")



  
 

