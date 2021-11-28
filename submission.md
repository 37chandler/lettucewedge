# Applied Data Analytics

## Wedge Project

<!-- Any general commentary you'd like to say about the project --> 

### Task 1

* Files for this task: 



`Task 1.ipynb`: 
Notebook with code that uploads Wedge transactions from GSC into Google Big Query

`WedgeFiles_Clean`:
For my uploading, I am starting with the clean Wedge files. 



### Task 2

* Files for this task: 

`Task 2.ipynb`: 
Notebook with code that queries GBQ data, makes list of owners, queries those sample owners, and exports a csv locally.
`wedge_sample.csv`:
CSV with sample of owners from the Wedge transactions. Not uploaded to repo.

<!--  Repeat for each file  --> 
	

### Task 3

* Files for this task: 

`Task 3 Create db.ipynb`: 
Creates Local DB called Lettuce_Summary.db. Creates three tables, and uploads data from the wedge.

`Task3queries.sql`:
This includes three queries ran in GBQ. From each query, I exported csv files to Google Cloud, and downloaded them locally. 

`3.1.csv, 3.2.csv, 3.3.csv`:
These three files were exported from GBQ based on queries. They create the summary tables with my Lettuce_Summary database.

<!--  Repeat for each file  --> 


## Query Comparison Results

Fill in the following table with the results from the 
queries contained in `gbq_assessment_query.sql`. You only
need to fill in relative difference on the rows where it applies. 
When calculating relative difference, use the formula 
` (your_results - my_results)/my_results)`. 



|  Query  |  Your Results  |  My Results | Difference | Rel. Diff | 
|---|---|---|---|---|
| Total Rows  | 92131698  | 85760139  |6,371,559   | 0.074  |
| January 2012 Rows  | 1070905  | 1070907  | -2  |very small  |
| October 2012 Rows  | 1042285  | 1042287  |  -2 | very small  |
| Month with Fewest  | Feb  |Feb   | No  | NA  |
| Num Rows in Month with Fewest  | 6556770  | 6556770  |  0 |  0 |
| Month with Most  | May  | May | Yes/No  | NA  |
| Num Rows in Month with Most  |7578372   | 7578372  | 0  | 0  |
| Null_TS  |7123792   | 7123792  |0   | 0  |
| Null_DT  |  0 |  0 |   0|  0 |
| Null_Local  | 234843  |234843   | 0  | 0  |
| Null_CN  |0   | 0  |  0 |  0 |
| Num 5 on High Volume Cards  | 14987.0  |14987.0   | No  | NA  |
|  Num Rows for Number 5 | 501286  |460630   |  40656 |  0.088 |
| Num Rows for 18736  | 12153  | 12153  | 0  | 0  |
| Product with Most Rows  |  banana organic  |banana organic   | Yes/No  | NA  |
| Num Rows for that Product  |988961  | 908639  | 80322  |  0.088 |
| Product with Fourth-Most Rows  | avocado hass organic  | avocado hass organic  | No  | NA  |
| Num Rows for that Product  |  497405 | 456771  |  40634 |  0.088|
| Num Single Record Products  |2651   | 2769  |118   |  0.042
| Year with Highest Portion of Owner Rows  | 2014  | 2014  | No  | NA |
| Fraction of Rows from Owners in that Year  |0.7591   |  0.7591 |  0 |0   |
| Year with Lowest Portion of Owner Rows  | 2011  | 2011  | No  | NA |
| Fraction of Rows from Owners in that Year  | 0.7372  |0.7372   |  0 | 0  |

## Reflections

<!-- I'd love to get 100-200 words on your experience doing the Wedge Project --> 

I think overall, the Wedge project had many learning curves. I initially was planning on clean the raw Wedge files. But I ended up spending too much time on it, and when trying to upload csvs that I had clean, I ran into many errors. Eventually, I decided that I would just upload the clean Wedge files. I ran into several errors here though. Namely, that my query load jobs were constantly timing out. To no avail, I found a second way of uploading the files. I first uploaded all files to Google Cloud Storage, which had some troubleshooting but eventually worked. Then when I finally tried to programmatically upload a large csv, it worked in a matter of seconds! Another tricky aspect was getting my queries to interopolate with GBQ correctly. There was some struggle here. 

For Task 2, the majority of the coding was easy. However, extract owner records based on the sample I created took so many hours of trial and error. I almost gave up. Then I found 12 characters of code, and it worked. So that was a happy ending. I understand why it didn't work (sorta) but it was never apparent to me the entire time. I got so many errors, each different. Task 3 was very stragihtforward. 

## Feedback

I'll give you feedback on your code, but before I do I'm concerned about the discrepancy between our results. I'm not
going to ask you to correct it, but I *would* like you to diagnose it. 

1. Write a query that returns the number of rows per year and month for your full data set. 
2. Do the same for mine.
3. Plot the two counts over time on the same graph. I'm guessing you uploaded a file or two twice, but I'd like to find out. 
4. Send me that plot on Teams and consider this complete.

For task 1, this is a fun/challenging way to do it. I don't see any obvious issues. 

On task 2, there's definitely some clean-up that could have happened on this file, but your code looks good. Creative use of "format" on that query. I'm shocked
that works, but I'm impressed. 

Good job taking a "path of least resistance" approach to Task 3. I can imagine some more elegant ways to do it (and I've added you to the
solutions so that you can see my version), but this got the job done. Nice work. 
