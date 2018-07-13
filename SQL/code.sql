/*
Attribuion Queries - #1.
*/

/*SELECT COUNT(DISTINCT utm_campaign) AS 'Total Campaigns'
FROM page_visits;
SELECT COUNT(DISTINCT utm_source) AS 'Total Sources'
FROM page_visits;
SELECT DISTINCT utm_campaign AS Campaigns, utm_source As 'Campaign Source'
FROM page_visits
GROUP BY Campaigns;*/

/*
Attribuion Queries - #2.
*/

/*SELECT DISTINCT page_name AS Pages
FROM page_visits;*/

/*
Attribuion Queries - #3.
*/

/*WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT pv.utm_campaign AS 'First Touch Campaigns',
    COUNT(ft.first_touch_at) AS 'Total First Touches'
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp
    GROUP BY utm_campaign;*/

/*
Attribuion Queries - #4.
*/

/*WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) AS last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT pv.utm_campaign AS 'Last Touch Campaigns',
    COUNT(lt.last_touch_at) AS 'Total Last Touches'
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
    GROUP BY utm_campaign;*/

/*
Attribuion Queries - #5.
*/

/*SELECT COUNT(DISTINCT user_id) AS 'Total Purchasers' 
FROM page_visits
WHERE page_name = '4 - purchase';*/

/*
Attribuion Queries - #6.
*/

WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) AS last_touch_at
    FROM page_visits
  WHERE page_name = '4 - purchase'
    GROUP BY user_id)
SELECT COUNT(pv.page_name) AS 'Campaign Purchases',
		pv.utm_campaign AS Campaign
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
    GROUP BY utm_campaign;