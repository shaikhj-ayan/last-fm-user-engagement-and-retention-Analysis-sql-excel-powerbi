# 🎧 Last.fm User Engagement & Retention Analysis

Analyzing listening behavior, engagement patterns, and content performance on Last.fm using SQL and Power BI to understand how the platform can improve long-term user retention.

---

## 📌 Table of Contents

* Overview
* Business Problem
* Context
* Dataset
* Tools & Technologies
* Research Questions
* Key Findings
* Dashboard
* Final Recommendations
* Author & Contact

---

## 📊 Overview

This project analyzes how users interact with Last.fm through:

* Listening behavior
* Artist and track popularity
* Album engagement
* Genre trends
* Global reach

While Last.fm still collects rich listening data through scrobbling, modern platforms like Spotify, Apple Music, and YouTube Music provide integrated experiences. Many users generate data passively but do not actively engage with the platform.

The goal of this project is to identify:

* What drives high engagement
* Where listening is concentrated
* How content performance varies
* What can improve user retention

---

## ❗ Business Problem

How can Last.fm improve user engagement and long-term retention, especially among new and younger users, in a market dominated by all-in-one music streaming platforms?

---

## 📉 Context

### Engagement Shift

Earlier, Last.fm focused on:

* Scrobbling (tracking listening)
* Music discovery
* Community interaction

Now:

* Streaming platforms handle discovery + personalization
* Users don’t need a separate platform

👉 Result: Users still track music but don’t return to engage.

---

### Retention Imbalance

* New users drop off early
* Older users stay active
* Engagement is uneven
* Younger audience is limited

👉 Problem is not just acquiring users, but keeping them engaged.

---

## 📁 Dataset

Data collected using the Last.fm API and structured into:

* `albums_full`
* `artist_top_tracks`
* `chart_tags`
* `geo_artists`
* `geo_tracks`
* `top_tags`
* `tracks_full`

### Data Preparation

* Removed duplicates and inconsistencies
* Standardized column names
* Fixed naming issues
* Structured into relational tables
* Loaded into SQL and Power BI

---

## 🛠 Tools & Technologies

* SQL (CTE, aggregation, window functions)
* Power BI (dashboard & visualization)
* Excel (data cleaning)


---

## 🔍 Key Findings

* A small number of artists drive most of the total playcount
* Listening is highly concentrated on top tracks
* Many artists depend heavily on 1–2 hit tracks
* Only a small % of tracks generate most engagement (long-tail effect)
* More tracks ≠ more engagement
* Some tracks show high replay behavior (strong user connection)
* Engagement is not evenly distributed across the platform

👉 Overall insight:
**Users are not exploring widely — they stay within a small set of content**


---

## 📊 Dashboard (Power BI)

The dashboard highlights key engagement patterns across tracks, artists, and genres. It focuses on identifying **content concentration, replay behavior, and listening distribution**.

---

### 🎵 Top Tracks

![Top Tracks](https://github.com/shaikhj-ayan/last-fm-user-engagement-and-retention-Analysis-sql-excel-powerbi/blob/master/image/tracks.png)

**Insight:**

* A few tracks appear repeatedly as top performers
* Popular songs dominate user listening behavior
* Indicates **low content exploration**

---

### 🎼 Tracks by Genre

![Tracks by Genre](https://github.com/shaikhj-ayan/last-fm-user-engagement-and-retention-Analysis-sql-excel-powerbi/blob/master/image/tracks_by_genre.png)

**Insight:**

* Rock leads with the highest engagement (~0.40M plays)
* Alternative, electronic, and indie follow closely
* Pop is slightly lower than expected

👉 Shows that **user taste is concentrated in a few genres**

---

### 🎤 Top Artists by Playcount & Contribution

![Top Artists](https://github.com/shaikhj-ayan/last-fm-user-engagement-and-retention-Analysis-sql-excel-powerbi/blob/master/image/top_artist_playcount_contribution.png)

**Insight:**

* Artists like Taylor Swift and Radiohead dominate total plays
* Contribution % declines gradually across artists
* A small group drives most platform engagement

👉 Strong **power-law distribution (few artists = most plays)**

---

### 📈 Top Track vs Artist Average

![Top Track vs Average](https://github.com/shaikhj-ayan/last-fm-user-engagement-and-retention-Analysis-sql-excel-powerbi/blob/master/image/total_track_vs_artist_average.png)

**Insight:**

* Big gap between top track and average track
* Example:

  * Radiohead → 57M (top) vs 18M (avg)
  * Billie Eilish → 53M vs 15M

👉 Many artists rely on **one or two hit tracks**

---

### 📊 Track Playcount Distribution

![Distribution](https://github.com/shaikhj-ayan/last-fm-user-engagement-and-retention-Analysis-sql-excel-powerbi/blob/master/image/track_playcount_distribution.png)

**Insight:**

* Most tracks fall in lower playcount range
* Only a few tracks reach very high playcount
* Clear **long-tail distribution**

👉 Confirms:

* Majority of content gets low engagement
* Few tracks dominate listening

---


## 🚀 Final Recommendations

Based on your SQL analysis:

### 1. Reduce Content Concentration

Problem:

* Top tracks dominate engagement

Solution:

* Promote lesser-known tracks using recommendations
* Introduce “Explore More” suggestions
* Highlight hidden or niche content

---

### 2. Improve Music Discovery

Problem:

* Users are not exploring new artists

Solution:

* Personalized discovery feed
* Weekly discovery playlists
* Genre-based recommendations

---

### 3. Focus on High-Replay Content

Insight:

* Some tracks have high replay intensity

Solution:

* Identify these tracks and similar content
* Build recommendation clusters
* Use them to increase session time

---

### 4. Support Artists with Balanced Catalogs

Insight:

* Some artists depend on one hit track

Solution:

* Promote their other tracks
* Create “deep dive” artist sections
* Encourage full catalog listening

---

### 5. Improve Tag/Genre Engagement

Insight:

* Some tags have higher engagement ratios

Solution:

* Use tags to improve recommendations
* Build genre-based user journeys

---

### 6. Strengthen Platform Value (Key Fix)

Big Problem:

* Last.fm is passive (only tracking)

Solution:

* Add interactive features:

  * Listening insights (weekly stats like Spotify Wrapped)
  * Social sharing
  * User comparisons
  * Gamification (streaks, badges)

---

### 7. Increase Retention Through Habit Formation

Problem:

* Users don’t revisit platform

Solution:

* Daily/weekly summaries
* Notifications (listening milestones)
* Personalized reports

---

## 🧠 Final Insight

Last.fm does not have a data problem it has an **engagement problem**.

Users generate data, but the platform does not convert it into meaningful interaction.

👉 Fix:
Turn passive data into **active experience**

---

## 👤 Author & Contact

**Shaikh Ayan**
📧 Email: [shaikhayan1.in@gmail.com](mailto:shaikhayan1.in@gmail.com)
