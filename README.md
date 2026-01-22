# Hotel Booking Demand Analysis

### Executive Summary

This project analyzes hotel booking data to support commercial and operational decision-making in the hospitality industry. Using SQL for analytical modeling and Tableau for visualization, I transformed raw booking records into clear, decision-focused insights related to demand patterns, revenue drivers, and cancellation risk.
***
### Project Objectives
- Quantify booking demand patterns to support seasonal pricing and capacity planning.
- Identify revenue-driving market segments and assess their relative business value.
- Evaluate cancellation risk across distribution channels to inform overbooking and channel strategy.
***
### Business Questions Addressed

1️⃣ When does booking demand peak and decline throughout the year?
> How should pricing, staffing, and inventory adjust seasonally?

2️⃣ Which market segments contribute the most revenue?
> Where should distribution and marketing efforts be prioritized?

3️⃣ Which countries generate the highest booking volume?
> Where should regional marketing be strengthened?

4️⃣ Which distribution channels carry the highest cancellation risk?
> How can revenue leakage be reduced through channel strategy?
***
### Dashboard Overview

The dashboard image file can be downloaded [here](Files/Image).

1️⃣ Booking Demand Patterns Across the Year
> Clear seasonal pattern supports dynamic pricing and workforce planning

2️⃣ Revenue Contribution by Market Segment
> Insight supports channel mix optimization and cost-benefit analysis

3️⃣ Top Booking Source Markets by Country
> Enables geographic prioritization for marketing and partnerships

4️⃣ Cancellation Behavior Across Distribution Channels
> Insight supports overbooking policies and channel-level restrictions

<img width="1399" height="899" alt="Hotel_Booking" src="https://github.com/user-attachments/assets/6a4477dc-58ad-4597-925d-1338301aa104" />

***
### Key Business Insights
- Booking demand peaks during summer months, indicating strong seasonality.
- Online Travel Agents contribute the largest share of revenue, approximately $13,714K, but also exhibit the highest cancellation rate at 41.03%, presenting a trade-off between volume and reliability.
- Direct bookings represent a smaller share of total volume but maintain a lower cancellation rate (17.46%), making them a more stable revenue channel.
- Booking volume is concentrated in the top five EU countries, highlighting both market dependency and growth opportunities.
***
### Business Recommendations

Based on the insights derived from the analysis, the following recommendations are proposed to support revenue optimization and operational stability:

1️⃣ Mitigate Cancellation Risk from High-Volume OTA Channel

Online Travel Agent (OTA) and TA/TO channels generate a significant share of bookings and revenue but also exhibit the highest cancellation rates.
- Apply channel-specific cancellation policies, such as shorter free-cancellation windows during peak demand periods.
- Use historical cancellation rates to define overbooking thresholds by channel instead of applying a uniform overbooking rule.

2️⃣ Strengthen Direct Booking Strategy to Improve Revenue Stability

Direct bookings show a lower cancellation rate compared to third-party channels, indicating higher booking reliability.
- Promote direct bookings through non-price incentives (e.g., flexible check-in, loyalty benefits, room upgrades).
- Prioritize direct booking visibility during periods identified as high cancellation risk.

3️⃣ Align Pricing and Capacity Planning with Seasonal Demand Patterns

Booking demand demonstrates strong seasonality, with clear peak and off-peak periods.
- Implement dynamic pricing strategies during peak months to capture higher willingness to pay.
- Plan staffing and inventory allocation ahead of peak seasons using historical demand trends.
- Leverage off-peak periods to stimulate demand from lower-risk segments.
***
### Tools & Technologies
- Microsoft SQL Server — analytical queries, KPI logic, data modeling

The SQL script can be downloaded [here](Files/SQL_Queries).
- Excel — light preprocessing and validation

The raw datasets can be downloaded [here](Files/Dataset).
- Tableau — dashboarding, storytelling, stakeholder-ready visuals

