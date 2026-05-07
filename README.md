# Women_on_tour_dbt
My project consists of finding a real messy dataset on Kaggle, exporting it as a csv, uploading it to BigQuery, and connecting the project in BigQuery to dbt. In dbt, the data was cleaned and transformed into two views. In my case, the data underwent the staging step and then went straight to marts, as I felt that I could skip the intermediate step, since I had only one table and did not need to do any joins. The marts were then connected to Looker via BigQuery and a dashboard was created in Looker to analyze the data.

The data looks at several women artists, the number of shows and tours that they have done, and the actual, adjusted, and average gross revenue for those shows and tours over time. The data was scraped from Wikipedia and therefore includes some inconsistencies, such as footnotes, dollar signs and commas in the monetary data, and various symbols in tour titles. I included a data sample below for reference on what the uncleaned data looked like before the ELT process.

## Data Sample

| Rank | Peak | All Time Peak | Actual Gross | Adjusted Gross (2022 $) | Artist | Tour Title | Year(s) | Shows | Average Gross | Ref. |
|------|------|---------------|--------------|--------------------------|--------|------------|---------|-------|---------------|------|
| 1 | 1 | 2 | $780,000,000 | $780,000,000 | Taylor Swift | The Eras Tour † | 2023–2024 | 56 | $13,928,571 | [1] |

## In my dashboard, I chose to focus on four charts to show several insights from the data:
1. Adjusted gross revenue by artist: this chart shows the adjusted gross revenue in 2022 US dollars) by artist. This chart has a direct correlation with the second chart, as Taylor Swift and Madonna had most tours and accordingly had the highest adjusted gross revenue.


<img width="722" height="565" alt="adj gross rev 2" src="https://github.com/user-attachments/assets/1a1debd4-3c0f-46bd-a8da-a20d48b8de14" />



2. Total tours by artist: this chart shows which artists were most productive. Taylor Swift and Madonna were most productive and both had four tours.


<img width="750" height="565" alt="total tours" src="https://github.com/user-attachments/assets/4c95ffc3-fa38-48e4-a27e-624f7ba7c1b3" />


3. Total actual gross over time: this chart shows the trend of total actual gross revenue over time. The trendline shows a steady increase over time, which shows the general trend of the industry of popular music artist performances and that it is very clearly an upwards trend.
There are some low points that we can also see in the line graph that directly correlate with events in the real world, such as no revenue between 2020 and 2022, as this was the time of the COVID-19 pandemic, and a sharp decrease in revenue between 2009 and 2011, as this was the time of the global financial crisis.


<img width="720" height="528" alt="total actual gross" src="https://github.com/user-attachments/assets/6886e919-c84d-4986-a60a-53bd01fe216f" />


4. Average gross per show by artist: this chart shows the average gross revenue per show by artist. This data is interesting, as Madonna had the most tours and had the second highest adjusted gross revenue, yet Beyonce has the second highest average gross revenue per show. This shows that Beyonce is more efficient as an artist, as she has less shows and tours, but makes more from them compared to Madonna.


<img width="728" height="513" alt="avg gross per show" src="https://github.com/user-attachments/assets/66016b0a-8ab8-47e2-aa28-b4efb67bc25e" />


## View the full dashboard here: https://datastudio.google.com/reporting/0e7a55c6-80e9-4082-81e3-a77263e47f7d

