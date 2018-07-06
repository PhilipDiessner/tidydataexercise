#Feature Selection 

## Following the code book of the original data set

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeacceleration[xyz] and timegyroscope[xyz]. These time domain signals  were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timebodyacceleration[xyz] and timegravityacc[xyz]) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timebodyaccelerationjerk[xyz] and timebodygyroscopejerk[xyz]). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm
(timebodyaccelerationmagnitude, tgravityaccelerationmagnitude, timebodyacelerationcjerkmagnitude, timebodygyroscopemagnitude, timebodygyroscopejerkmagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencybodyacceleration-XYZ, frequencybodyaccelerationjerk[xyz], frequencybodygyroscope[xyz],frequencybodyaccelerationjerkmagnitude, frequencybodygyroscopemagnitude, frequencybodygyroscopejerkmagnitude. (Note the 'frequency' to indicate frequency domain signals). 
 
'[xyz]' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these are: 

mean: Mean value  
std: Standard deviation

where the label is added to the variable name

"subject" denotes the one of the 30 test subjects the data was taken from
"activity" decribes the activity done taking the data

***

The complete list of variables of each feature vector following the above description is:

"timebodyaccelerationxmean"  
"timebodyaccelerationymean"  
"timebodyaccelerationzmean"  
"timebodyaccelerationxstd"                
"timebodyaccelerationystd"  
"timebodyaccelerationzstd"  
"timegravityaccelerationxmean"            
"timegravityaccelerationymean"  
"timegravityaccelerationzmean"  
"timegravityaccelerationxstd"             
"timegravityaccelerationystd"  
"timegravityaccelerationzstd"  
"timebodyaccelerationjerkxmean"           
"timebodyaccelerationjerkymean"  
"timebodyaccelerationjerkzmean"  
"timebodyaccelerationjerkxstd"            
"timebodyaccelerationjerkystd"  
"timebodyaccelerationjerkzstd"  
"timebodygyroscopexmean"                  
"timebodygyroscopeymean"  
"timebodygyroscopezmean"  
"timebodygyroscopexstd"                   
"timebodygyroscopeystd"  
"timebodygyroscopezstd"  
"timebodygyroscopejerkxmean"              
"timebodygyroscopejerkymean"  
"timebodygyroscopejerkzmean"  
"timebodygyroscopejerkxstd"               
"timebodygyroscopejerkystd"  
"timebodygyroscopejerkzstd"  
"timebodyaccelerationmagmean"             
"timebodyaccelerationmagstd"  
"timegravityaccelerationmagmean"  
"timegravityaccelerationmagstd"           
"timebodyaccelerationjerkmagmean"  
"timebodyaccelerationjerkmagstd"  
"timebodygyroscopemagmean"                
"timebodygyroscopemagstd"  
"timebodygyroscopejerkmagmean"  
"timebodygyroscopejerkmagstd"             
"frequencybodyaccelerationxmean"  
"frequencybodyaccelerationymean"  
"frequencybodyaccelerationzmean"          
"frequencybodyaccelerationxstd"  
"frequencybodyaccelerationystd"  
"frequencybodyaccelerationzstd"           
"frequencybodyaccelerationjerkxmean"  
"frequencybodyaccelerationjerkymean"  
"frequencybodyaccelerationjerkzmean"      
"frequencybodyaccelerationjerkxstd"  
"frequencybodyaccelerationjerkystd"  
"frequencybodyaccelerationjerkzstd"       
"frequencybodygyroscopexmean"  
"frequencybodygyroscopeymean"  
"frequencybodygyroscopezmean"             
"frequencybodygyroscopexstd"  
"frequencybodygyroscopeystd"  
"frequencybodygyroscopezstd"              
"frequencybodyaccelerationmagmean"  
"frequencybodyaccelerationmagstd"  
"frequencybodybodyaccelerationjerkmagmean"  
"frequencybodybodyaccelerationjerkmagstd"  
"frequencybodybodygyroscopemagmean"  
"frequencybodybodygyroscopemagstd"  
"frequencybodybodygyroscopejerkmagmean"  
"frequencybodybodygyroscopejerkmagstd"  
