---
title: "CodeBook"
author: "mmcantoni"
date: "24-08-2014"
output: html_document
---

This data set was collected through a Samsung smartphone wore by 30 subjects between 19 and 48 years while each of them was performing six different activities: walking, walking upstairs, walking downstairs, sitting, standing and laying. Each subject performed all the activities twice: once with the smartphone attached to a belt and once with the device placed wherever they preferred. The smartphone used contains an embedded accelerometer and a gyroscope, which were used to acquire to types of signal: three-axial linear acceleration and three-axial angular velocity. The complete data set is composed by 7352 observations of 563 variables. Each observation corresponds to a time window during which a subject was performing some activity. The 563 variables include subject reference number, activity code, and 561 feature measures performed on each time window, obtained from the original signals collected, as just described above. The features were normalized so they conform to the interval [-1,1]. 
The original data set was transform according to the following steps:
1.  The training and the test sets were merged to create one data set.
2. The measurements on the mean and standard deviation for each measurement were extracted.
3. Descriptive activity names were used to name the activities in the data set.
4.  The data set was appropriately labeled with descriptive variable names.
5.  A second, independent tidy data set was created with the average of each variable for each activity and each subject.

