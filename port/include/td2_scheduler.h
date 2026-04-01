#ifndef TD2_SCHEDULER_H
#define TD2_SCHEDULER_H

#include <stdbool.h>
#include <stddef.h>

#include "td2_contracts.h"
#include "td2_input.h"
#include "td2_io.h"

#define TD2_SCHEDULER_SEGMENTS_MAX 64

typedef enum {
    TD2_SCHEDULER_PROFILE_NONE = 0,
    TD2_SCHEDULER_PROFILE_AUTO = 1,
    TD2_SCHEDULER_PROFILE_INTRO_NOINPUT = 2,
    TD2_SCHEDULER_PROFILE_MENU_GAMEPLAY_ENTRY = 3,
    TD2_SCHEDULER_PROFILE_GAMEPLAY_LIVE_RACE_MID = 4,
} Td2SchedulerProfile;

typedef struct {
    bool available;
    unsigned start_frame;
    unsigned end_frame;
    Td2RuntimeState state;
} Td2SchedulerSegment;

typedef struct {
    Td2SchedulerProfile requested_profile;
    Td2SchedulerProfile active_profile;
    bool contract_loaded;
    Td2InputScript input_script;
    Td2InputScript live_input_history;
    unsigned segment_count;
    Td2SchedulerSegment segments[TD2_SCHEDULER_SEGMENTS_MAX];
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
    const char* input_script,
    const Td2DesignPack* pack,
    char* error,
    size_t error_size
);
bool td2_scheduler_build_state(
    const Td2Scheduler* scheduler,
    unsigned frame_number,
    Td2RuntimeState* state
);
bool td2_scheduler_record_live_input(
    Td2Scheduler* scheduler,
    unsigned frame_number,
    uint16_t mask,
    char* error,
    size_t error_size
);

#endif
