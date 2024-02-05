## Electric Vehicle Sales Drop

### Problem Statement:

**Zoom Electric (ZE)** is an electric vehicle venture owned by a renowned automotive manufacturer called **ZOOM MOTORS India Private Limited**.

Recently, ZE has introduced a new scooter variant, ***Sprint*** in the 2-wheeler EV scooter segment. Initially, Sprint Scooters' sales numbers were quite impressive in the first two weeks of launch but suddenly it started decreasing unexpectedly.

The sales & Operations Head wants to understand the sales volume growth over the first 2-3 weeks. As a data analyst in the **Sales and Operations** team, I was assigned to validate the sales drop for Sprint scooters and figure out the reasons for this decline.

### Dataset:

The dataset consists of four key tables that provide information about product details, sales, and email campaigns for product launches.

 - **Products Table**: Contains details about Zoom Electric's product offerings, including names and specifications.

 - **Sales Table**: Captures transaction details, customer information, and purchase history for sales analysis.

 - **Email_Subject Table**: Focuses on providing subjects for campaigns.

 - **Emails Table**: Presents results of email campaigns, including information for status (*bounced, opened, clicked*), for evaluating the performance of Zoom Electric's email marketing initiatives.


### Approach:

1. **Quantifying Sales Drop**:
   
     It is provided that there is a sales decline of ~20% after 2 weeks of launch. So, to validate this sales drop I have calculated cumulative sales volume over a rolling 7-day period for consistent evaluation 
     of sales performance throughout the week.
   
     The result displays the trend for cumulative sales and it is observed that:
   
   - The highest sales were in the first week of launch and showed a declining trend afterward. 
   - The highest drop in the next 21 days was seen on 26-10-2016  i.e. in the third week which was about 20%.

3. **Launch Date Assumption**:

   Zoom Electric used to launch its product usually in the first half of the year, Sprint is the only scooter that was launched in the second half of the year(in the month of October).

   So, my task is to assess whether there is a relationship between the launch date and the sales growth experienced in the initial 21 days(i.e., 2-3 weeks).
   
   The sales growth for Sprint scooters(launched in October) and the sales growth for Sprint Limited Edition scooters(launched in February) is assessed and the result has proved the assumption that Sprint LE 
   scooter sales growth increased after 2 weeks of launch whereas Sprint scooter sales growth declined after 2 weeks of launch.

2. **Email Campaign Analysis**:

   Generally, the marketing campaigns start before 2 months of launch. The data from the period of 2 months before the sprint model launch is observed to assess the effectiveness of the email campaign, metrics 
   are calculated to analyze whether the people open the emails, and if they click on the provided links, helping to measure the overall impact and success of the campaign.
   The industry benchmark for a quality campaign is an 18% email opening rate and an 8% Click Rate.

   The results of the email analysis show that all the emails were sent on one single day 20 days earlier than the launch of Sprint scooters. The email opening rate was 20% which is quite good based on the 
   industry benchmark but the click rate is only 2% which is very low.

   ### Conclusion:

- Validating the sales drop shows that there is a drop of nearly 20% in the third week after the launch of Sprint scooters.
- The products launched at the start of the year are performing better than the products which are launched in the second half of the year.
- The email campaign shows a good opening rate but a low click rate which indicates that the content of the email should be more engaging to make recipients click the provided links and the email marketing
  should be done to the targeted people to increase the conversion rate.
  
