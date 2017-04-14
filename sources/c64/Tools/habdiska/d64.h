#ifndef _D64
#define _D64

#define SECTOR_SIZE             256
#define TRACKS_PER_DISK         35
#define TRACK_MAX_LARGE         17
#define TRACK_MAX_MEDIUM        24
#define TRACK_MAX_SMALL         30
#define TRACK_MAX_XSMALL        35
#define TRACK_DIRECTORY         18

#define SECTORS_PER_TRACK_LG    21  /* Tracks  1 - 17 */
#define SECTORS_PER_TRACK_MD    19  /* Tracks 18 - 24 */
#define SECTORS_PER_TRACK_SM    18  /* Tracks 25 - 30 */
#define SECTORS_PER_TRACK_XS    17  /* Tracks 31 - 35 */

#define SECTORS_LARGE           (SECTORS_PER_TRACK_LG * TRACK_MAX_LARGE)
#define SECTORS_MEDIUM          (SECTORS_PER_TRACK_MD * (TRACK_MAX_MEDIUM - TRACK_MAX_LARGE))
#define SECTORS_SMALL           (SECTORS_PER_TRACK_SM * (TRACK_MAX_SMALL - TRACK_MAX_MEDIUM))
#define SECTORS_XSMALL          (SECTORS_PER_TRACK_XS * (TRACK_MAX_XSMALL - TRACK_MAX_SMALL))
#define SECTORS_PER_DISK        (SECTORS_LARGE + SECTORS_MEDIUM + SECTORS_SMALL + SECTORS_XSMALL)   /* 683 */

#endif /* _D64 */
