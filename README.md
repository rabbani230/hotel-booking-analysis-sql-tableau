# Hotel Booking Demand Analysis (SQL + Tableau)

This project analyzes real-world hotel booking data using Microsoft SQL Server for querying and Tableau for visualization. The goal is to uncover trends in bookings, cancellations, guest behavior, and estimated revenue — helping stakeholders in the hotel industry make data-informed decisions.

---

## Objectives
- Analyze cancellation rates across customer types and distribution channels.
- Compare booking behavior between City Hotel and Resort Hotel.
- Estimate revenue by market segment.
- Visualize seasonal booking trends.
- Demonstrate ability to use SQL and Tableau for end-to-end BI analysis.

---

## Tools Used
- Microsoft SQL Server
- Tableau Public
- Excel (for light preprocessing)

---

## Key SQL Analysis
- Join between `hotel_bookings` and `hotel_customers` tables
- Use of CTE and temp tables for modular queries
- Cancellation rate by customer type  
- Estimated revenue: `adr * (weeknight + weekend nights)`
- Repeat guest insights (via joined customer table)
- Booking trend by month

> ✔️ All queries are available in the `SQL Queries` folder

---

## Tableau Dashboard
The dashboard includes:
- Monthly booking trends
- Top 5 countries by bookings
- Cancellation rate by customer type
- Revenue distribution by market segment

 Screenshots available in `Image` folder

🔗 Link to Tableau Public Dashboard : https://public.tableau.com/views/HotelBookingDashboard_17532586984380/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## Key Business Insights
- Resort hotels have longer average stays.
- Group-type bookings have the lowest cancellation rate.
- Most bookings are made through Online Travel Agents.
- Highest demand is during July and August.

---

## Project Structure

Hotel Booking Demand/
│
├── README.md
├── SQL Queries/
│ └── hotel_booking_analysis.sql
├── Tableau Dashboard/
│ └── Hotel Booking Dashboard.twbx
├── Dataset/
│ └── hotel_bookings.csv
│ └── hotel_customers.csv
├── Image/
│ └── Hotel Booking Dashboard.png

---

## 📬 Contact
**Muhamad Rabbani**  
Email : muhamadrabbani98@gmail.com
LinkedIn : www.linkedin.com/in/rabbanirazali
GitHub : https://github.com/rabbani230
