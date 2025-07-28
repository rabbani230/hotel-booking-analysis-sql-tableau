SELECT *
FROM [PortfolioProject].[dbo].[hotel_bookings]


--Creating an arrival date column

ALTER TABLE [PortfolioProject].[dbo].[hotel_bookings]
ADD arrival_full_date date

UPDATE [PortfolioProject].[dbo].[hotel_bookings]
SET arrival_full_date = DATEFROMPARTS(arrival_date_year,
	CASE arrival_date_month
		WHEN 'January' THEN 1
		WHEN 'February' THEN 2
		WHEN 'March' THEN 3
		WHEN 'April' THEN 4
		WHEN 'May' THEN 5
		WHEN 'June' THEN 6
		WHEN 'July' THEN 7
		WHEN 'August' THEN 8
		WHEN 'September' THEN 9
		WHEN 'October' THEN 10
		WHEN 'November' THEN 11
		WHEN 'December' THEN 12
	End,
	arrival_date_day_of_month)


--Showing monthly booking trends

SELECT arrival_date_month, COUNT(*) AS totalbookings
FROM [PortfolioProject].[dbo].[hotel_bookings]
WHERE arrival_date_month is not null
GROUP BY arrival_date_month
ORDER BY totalbookings DESC


--Calculating average lead time by months in the selected year

SELECT FORMAT(arrival_full_date,'yyyy-MM') AS arrival_month, ROUND(AVG(lead_time), 2) AS avg_lead_time_days
FROM [PortfolioProject].[dbo].[hotel_bookings]
WHERE arrival_date_year = 2017
GROUP BY FORMAT(arrival_full_date,'yyyy-MM')
ORDER BY avg_lead_time_days DESC


--Showing top 5 countries by bookings

SELECT country, COUNT(*) AS totalbookings
FROM [PortfolioProject].[dbo].[hotel_bookings]
GROUP BY country
ORDER BY totalbookings DESC
OFFSET 0 ROWS 
FETCH NEXT 5 ROWS ONLY


--Calculating average stay duration by hotel

SELECT hotel, AVG(stays_in_weekend_nights + stays_in_week_nights) AS average_stays
FROM [PortfolioProject].[dbo].[hotel_bookings]
GROUP BY hotel


--Calculating cancellation rate by customer type

SELECT customer_type, COUNT(*) AS total_bookings,
	   ROUND(AVG(CAST(is_canceled AS float))*100,2) AS cancel_rate_percent
FROM [PortfolioProject].[dbo].[hotel_bookings]
GROUP BY customer_type
ORDER BY cancel_rate_percent DESC


--Calculating cancellation rate by distribution channel

SELECT cust.distribution_channel, COUNT(*) AS total_bookings,
	   ROUND(AVG(CAST(book.is_canceled AS float))*100,2) AS cancel_rate_percent 
FROM [PortfolioProject].[dbo].[hotel_bookings] book
JOIN [PortfolioProject].[dbo].[hotel_customers] cust
	ON book.customer_id = cust.customer_id
GROUP BY cust.distribution_channel
ORDER BY total_bookings DESC


--Showing estimated revenue by month

SELECT FORMAT(arrival_full_date,'yyyy-MM') AS month, ROUND(SUM(adr * (stays_in_weekend_nights + stays_in_week_nights)), 0) AS estimated_revenue
FROM [PortfolioProject].[dbo].[hotel_bookings]
WHERE is_canceled = 0
GROUP BY FORMAT(arrival_full_date,'yyyy-MM')
ORDER BY month


--Showing estimated revenue by market segment

SELECT cust.market_segment, ROUND(SUM(book.adr * (book.stays_in_weekend_nights + book.stays_in_week_nights)), 0) AS estimated_revenue
FROM [PortfolioProject].[dbo].[hotel_bookings] book
JOIN [PortfolioProject].[dbo].[hotel_customers] cust
	ON book.customer_id = cust.customer_id
WHERE book.is_canceled = 0
GROUP BY cust.market_segment
ORDER BY estimated_revenue DESC


--Showing monthly completed stay by customer type

SELECT FORMAT(book.reservation_status_date, 'yyyy-MM') AS booking_month, cust.customer_type, COUNT(*) AS total_bookings
FROM [PortfolioProject].[dbo].[hotel_bookings] book
JOIN [PortfolioProject].[dbo].[hotel_customers] cust
	ON book.customer_id = cust.customer_id
WHERE book.reservation_status = 'Check-Out'
GROUP BY FORMAT(book.reservation_status_date, 'yyyy-MM'), cust.customer_type
ORDER BY booking_month, total_bookings DESC


--Showing total bookings by repeat guest from market segment

SELECT book.market_segment, COUNT(cust.is_repeated_guest) AS total_bookings_by_repeat_guest
FROM [PortfolioProject].[dbo].[hotel_bookings] book
JOIN [PortfolioProject].[dbo].[hotel_customers] cust
	ON book.customer_id = cust.customer_id
WHERE cust.is_repeated_guest = 1
GROUP BY book.market_segment


--Showing top 10 countries by repeat guests count (temp table)

SELECT cust.country, COUNT(*) AS repeat_guest_count
INTO #RepeatGuestbyCountry
FROM [PortfolioProject].[dbo].[hotel_bookings] book
JOIN [PortfolioProject].[dbo].[hotel_customers] cust
	ON book.customer_id = cust.customer_id
WHERE cust.is_repeated_guest = 1
GROUP BY cust.country

SELECT TOP 10*
FROM #RepeatGuestbyCountry
ORDER BY repeat_guest_count DESC

DROP TABLE #RepeatGuestbyCountry


--Calculating cancellation rate by repeat guest (CTE)

WITH CancelStats AS (
	SELECT cust.is_repeated_guest, book.is_canceled
	FROM [PortfolioProject].[dbo].[hotel_bookings] book
	JOIN [PortfolioProject].[dbo].[hotel_customers] cust
		ON book.customer_id = cust.customer_id
)

SELECT is_repeated_guest, ROUND(AVG(CAST(is_canceled AS float))*100, 2) AS cancel_rate_percent
FROM CancelStats
GROUP BY is_repeated_guest;


--Showing most common arrival months (CTE)

WITH ArrivalMonth AS
(
	SELECT DATENAME(month, DATEFROMPARTS(arrival_date_year,
	CASE arrival_date_month
		WHEN 'January' THEN 1
		WHEN 'February' THEN 2
		WHEN 'March' THEN 3
		WHEN 'April' THEN 4
		WHEN 'May' THEN 5
		WHEN 'June' THEN 6
		WHEN 'July' THEN 7
		WHEN 'August' THEN 8
		WHEN 'September' THEN 9
		WHEN 'October' THEN 10
		WHEN 'November' THEN 11
		WHEN 'December' THEN 12
	End,
	arrival_date_day_of_month)) AS month_name
	FROM [PortfolioProject].[dbo].[hotel_bookings]
)
SELECT month_name, COUNT(*) AS bookings
FROM ArrivalMonth
GROUP BY month_name
ORDER BY bookings DESC

