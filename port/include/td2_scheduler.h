#ifndef TD2_SCHEDULER_H
#define TD2_SCHEDULER_H

#include <stdbool.h>
#include <stddef.h>

#include "td2_contracts.h"
#include "td2_io.h"

typedef enum {
    TD2_SCHEDULER_PROFILE_NONE = 0,
    TD2_SCHEDULER_PROFILE_AUTO = 1,
    TD2_SCHEDULER_PROFILE_INTRO_NOINPUT = 2,
    TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY = 3,
    TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID = 4,
} Td2SchedulerProfile;

typedef struct {
    Td2SchedulerProfile requested_profile;
    Td2SchedulerProfile active_profile;
} Td2Scheduler;

bool td2_scheduler_parse_profile(
    const char* text,
    Td2SchedulerProfile* profile
);
const char* td2_scheduler_profile_name(Td2SchedulerProfile profile);
bool td2_scheduler_init(
    Td2Scheduler* scheduler,
    Td2SchedulerProfile requested_profile,
    const char* scene_dir,
    const Td2DesignPack* pack,
    char* error,
    size_t error_size
);
bool td2_scheduler_build_state(
    const Td2Scheduler* scheduler,
    unsigned frame_number,
    Td2RuntimeState* state
);

#endif
