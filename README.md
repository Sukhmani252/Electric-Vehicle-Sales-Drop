
## Project Overview:

Zoom Electric (ZE) is an electric vehicle venture owned by a renowned automotive manufacturer called ZOOM MOTORS India Private Limited.

Recently, ZE has introduced a new scooter variant, Sprint, in the 2-wheeler EV scooter segment. Initially, Sprint Scooters' sales numbers were quite impressive in the first two weeks of launch, but suddenly it started decreasing unexpectedly.

The Sales & Operations Head wants to understand the sales volume growth over the first 2-3 weeks. As a data analyst in the Sales and Operations team, my task is to validate the sales drop for the Sprint scooters and figure out the reasons for this decline.

Insights and recommendations are provided on the following areas:

- **Quantifying Sales Drop:** Investigating the sales drop in the initial 3 weeks of launch.
- **Launch Timings:** Comparison with other scooters' sales to assess whether there’s a relationship between launch timings and performance.
- **Email Campaign Analysis:**  Understanding the impact and success of the email campaign.

SQL queries utilized for the analysis can be found [here](https://github.com/Sukhmani252/Electric-Vehicle-Sales-Drop/tree/main/SQL%20Queries)

A detailed Excel report can be viewed [here](https://docs.google.com/spreadsheets/d/1POSsbfnnuIldFUQui02M3-gzLbqEkKHF/edit?usp=drive_link&ouid=108310215373032149971&rtpof=true&sd=true)



## Data Structure:

The dataset consists of four key tables that provide information about product details, sales, and email campaigns for product launches.
<img width="1920" height="773" alt="EV_Sales_Drop_ERD" src="https://github.com/user-attachments/assets/fe079b92-be1a-4651-9524-8a56841e61a3" />


## Insights and Recommendations:

**1. Quantifying Sales Drop:**

The cumulative sales volume over a 7-day rolling period indicates that the highest sales occurred in the first week of launch and followed a declining trend afterward. The **highest drop** was observed in the **third week of launch**, which was about **20%**. 

The potential reasons for the drop can be further investigated by analyzing launch timing patterns, the effectiveness of email campaigns, market trends, and competitor activity.

<img width="984" height="427" alt="Sales_Growth" src="https://github.com/user-attachments/assets/689d9802-85e4-4eb1-ad02-bbb7657943df" />

**2. Launch Timings:**

Zoom Electric has launched all its Scooter variants in the first half of the year. Sprint is the only scooter that was launched in the second half of the year(in October). Comparing the sales of Sprint with other scooter variants in the initial three weeks of launch will confirm whether there's a relationship between launch date and sales.

The comparison clearly shows that the **Sprint Limited Edition scooter(launched in February) sales growth is increasing**, and a huge growth is observed post two weeks of launch, while the **Sprint scooter(launched in October) shows a declining trend after one week**.

Future product launches should be scheduled in the first half of the year to leverage higher customer demand and drive stronger sales.

<img width="1008" height="433" alt="Sales_growth_Comparison" src="https://github.com/user-attachments/assets/dfef487f-74c3-40b8-b48c-35949f76133a" />


**3. Email Campaign Analysis:**

The industry benchmark for a quality campaign is an 18% email opening rate and an 8% Click Rate.

The email campaign achieved a good **open rate of 20%** (above the industry benchmark of 18%) but a **low click rate** of **only 2%** (quite below the 8% benchmark), highlighting the need for more compelling CTAs and optimized content design. Additionally, audience segmentation, content personalization, and running follow-up campaigns could be considered to improve conversion rates.






