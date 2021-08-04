Thank you for downloading the tlDataset. This document explains how the dataset is structured. 
If you have any questions or suggestions please email me at: tim0306@gmail.com

These datasets were used for the experiments as described in: 
	Transferring Knowledge of Activity Recognition across Sensor Networks
	T.L.M. van Kasteren, G. Englebienne and B.J.A. Kröse
	In Proceedings of the Eighth International Conference on Pervasive Computing (Pervasive 2010). Helsinki, Finland, 2010. 
Please refer to this paper when you use this dataset in your publications.

Other datasets and publications can be found at: http://sites.google.com/site/tim0306/

Contents of dataset package: 
- Actual data in matlab form (tlDatasets.mat)
- actstruct and sensorstruct are structures used for storing the data in matlab


Using the dataset in matlab:
----------------------------
Make sure the actstruct and sensorstruct directories are copied to a directory which is included in your matlab path. After that just load the tlDatasets.mat
into matlab. This should give you three variables houseA, houseB and houseC, corresponding to the houses as described in the paper. The as variable contains the label information, the ss variable contains the sensor information.

Some commands that are of use:
houseA.as.getIDs				= List of activities ids
houseA.activity_labels(houseA.as.getIDs) 	= List of activity labels
houseA.ss.getIDs				= List of sensor ids
houseA.sensor_labels				= List of sensor labels
houseA.sensor_info				= List of sensors and their meta feature assignment (metafeature '' means the sensor is not used)

Code that might be of use:
--------------------------
For a visualization tool and scripts for discretizing the data please download my ubicomp dataset from http://sites.google.com/site/tim0306/