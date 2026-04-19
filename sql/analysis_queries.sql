/* =====================================================
    LAST.FM USER ENGAGEMENT & RETENTION ANALYSIS - 
   ===================================================== */


-- 1. top artists (combining tracks and albums) 
SELECT 
    artist,
    SUM(playcount) as plays
FROM (
    SELECT artist, playcount FROM last_fm.tracks_full
    UNION ALL
    SELECT artist, playcount FROM last_fm.albums_full
) sub
GROUP BY 1 -- using column index is a common human shorthand
ORDER BY plays DESC
LIMIT 20;


-- 2. Top 10 tracks share of total 
WITH total_cte AS (
    SELECT SUM(playcount) as grand_total 
    FROM last_fm.tracks_full
)
SELECT 
    t.track,
    t.artist,
    t.playcount,
    round(t.playcount * 100.0 / c.grand_total, 2) as pct
FROM last_fm.tracks_full t, total_cte c
ORDER BY t.playcount DESC
LIMIT 10;


-- 3. One hit wonder check, artist dependency 
-- how much does the top track drive the artist's total plays?
SELECT 
    artist,
    track,
    playcount,
    round(playcount * 100.0 / sum(playcount) over (partition by artist), 2) as artist_track_share
FROM last_fm.artist_top_tracks
ORDER BY artist, artist_track_share DESC;


-- 4. Diversified artists */
SELECT 
    artist,
    max(playcount) * 1.0 / sum(playcount) as dependency_ratio
FROM last_fm.artist_top_tracks
GROUP BY artist
HAVING sum(playcount) > 1000
ORDER BY 2 ASC
LIMIT 20;


-- 5. Plays per track avg 
SELECT 
    artist,
    count(*) as track_count,
    sum(playcount) as total_plays,
    round(sum(playcount) * 1.0 / count(*), 2) as avg_plays
FROM last_fm.tracks_full
GROUP BY 1
ORDER BY total_plays DESC
LIMIT 20;


-- 6. Tag engagement 
-- reach vs taggings ratio
SELECT 
    tag,
    reach,
    taggings,
    round(taggings * 1.0 / reach, 4) as engage_rate
FROM last_fm.top_tags
WHERE reach > 1000
ORDER BY engage_rate DESC
LIMIT 20;


-- 7. Replay Intensity 
-- which tracks do people loop the most?
SELECT 
    track,
    artist,
    playcount,
    listeners,
    round(playcount * 1.0 / listeners, 2) as repeat_factor
FROM last_fm.artist_top_tracks
WHERE listeners > 500
ORDER BY repeat_factor DESC
LIMIT 20;

-- 8. quick check on global artist reach 
SELECT 
    name as artist,
    sum(listeners) as total_fans
FROM last_fm.geo_artists
GROUP BY 1
ORDER BY total_fans DESC
LIMIT 20;


-- 9. Track 'Stickiness' (Plays per listener) 
SELECT 
    track,
    artist,
    playcount,
    listeners,
    round(playcount * 1.0 / listeners, 2) as plays_per_user
FROM last_fm.artist_top_tracks
WHERE listeners > 500 
ORDER BY plays_per_user DESC
LIMIT 20;








