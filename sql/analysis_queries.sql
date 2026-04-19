/* =====================================================
    LAST.FM USER ENGAGEMENT & RETENTION ANALYSIS - 
   ===================================================== */


/* -----------------------------------------------------
   1. Top artists by total playcount (tracks + albums)
----------------------------------------------------- */
SELECT 
    artist,
    SUM(playcount) AS total_plays
FROM (
    SELECT artist, playcount FROM last_fm.tracks_full
    UNION ALL
    SELECT artist, playcount FROM last_fm.albums_full
) t
GROUP BY artist
ORDER BY total_plays DESC
LIMIT 20;


/* -----------------------------------------------------
   2. Playcount concentration: Top 10 tracks share
----------------------------------------------------- */
WITH total AS (
    SELECT SUM(playcount) AS total_plays 
    FROM last_fm.tracks_full
)
SELECT 
    track,
    artist,
    playcount,
    ROUND(playcount * 100.0 / total.total_plays, 2) AS play_share_pct
FROM last_fm.tracks_full, total
ORDER BY playcount DESC
LIMIT 10;


/* -----------------------------------------------------
   3. Artist dependency on top track
----------------------------------------------------- */
SELECT 
    artist,
    track,
    playcount,
    ROUND(
        playcount * 100.0 / SUM(playcount) OVER (PARTITION BY artist),
        2
    ) AS track_share_pct
FROM last_fm.artist_top_tracks
ORDER BY artist, track_share_pct DESC;


/* -----------------------------------------------------
   4. Artists with diversified engagement
----------------------------------------------------- */
SELECT 
    artist,
    MAX(playcount) * 1.0 / SUM(playcount) AS top_track_dependency
FROM last_fm.artist_top_tracks
GROUP BY artist
HAVING SUM(playcount) > 1000
ORDER BY top_track_dependency ASC
LIMIT 20;


/* -----------------------------------------------------
   5. Tracks vs total engagement per artist
----------------------------------------------------- */
SELECT 
    artist,
    COUNT(*) AS total_tracks,
    SUM(playcount) AS total_plays,
    ROUND(SUM(playcount) * 1.0 / COUNT(*), 2) AS avg_plays_per_track
FROM last_fm.tracks_full
GROUP BY artist
ORDER BY total_plays DESC
LIMIT 20;


/* -----------------------------------------------------
   6. Long-tail analysis (80% play contribution)
----------------------------------------------------- */
WITH ranked AS (
    SELECT 
        track,
        playcount,
        SUM(playcount) OVER (ORDER BY playcount DESC) AS cumulative_plays,
        SUM(playcount) OVER () AS total_plays
    FROM last_fm.tracks_full
)
SELECT 
    COUNT(*) * 100.0 / 
    (SELECT COUNT(*) FROM last_fm.tracks_full) 
    AS pct_tracks_for_80pct_plays
FROM ranked
WHERE cumulative_plays <= 0.8 * total_plays;


/* -----------------------------------------------------
   7. Tag engagement efficiency
----------------------------------------------------- */
SELECT 
    tag,
    reach,
    taggings,
    ROUND(taggings * 1.0 / reach, 4) AS engagement_ratio
FROM last_fm.top_tags
WHERE reach > 1000
ORDER BY engagement_ratio DESC
LIMIT 20;


/* -----------------------------------------------------
   8. Global artist popularity (listeners)
----------------------------------------------------- */
SELECT 
    name AS artist,
    SUM(listeners) AS total_listeners
FROM last_fm.geo_artists
GROUP BY name
ORDER BY total_listeners DESC
LIMIT 20;


/* -----------------------------------------------------
   9. Track efficiency (plays per listener)
----------------------------------------------------- */
SELECT 
    track,
    artist,
    playcount,
    listeners,
    ROUND(playcount * 1.0 / listeners, 2) AS plays_per_listener
FROM last_fm.artist_top_tracks
WHERE listeners > 1000
ORDER BY plays_per_listener DESC
LIMIT 20;


/* -----------------------------------------------------
   10. Replay intensity (high repeat listening)
----------------------------------------------------- */
SELECT 
    track,
    artist,
    playcount,
    listeners,
    ROUND(playcount * 1.0 / listeners, 2) AS replay_intensity
FROM last_fm.artist_top_tracks
WHERE listeners > 500
ORDER BY replay_intensity DESC
LIMIT 20;








