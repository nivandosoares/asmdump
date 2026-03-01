#ifndef TD2_IO_H
#define TD2_IO_H

#include "td2_types.h"

bool read_entire_file(const char *path, char **out_data, size_t *out_size);
bool path_exists(const char *path);
bool path_is_absolute(const char *path);
char *dup_string(const char *value);
char *resolve_manifest_path(const char *manifest_path, const char *relative_path);
char *resolve_sibling_path(const char *path, const char *filename);

bool write_frame_ppm(const char *path, const uint32_t *framebuffer);
bool image_data_load_ppm(const char *path, ImageData *out_image);

const char *json_find_value(const char *json, const char *key);
const char *json_find_value_internal(const char *json, const char *key, bool log_errors);
bool json_parse_int(const char *json, const char *key, int *out_value);
bool json_parse_bool(const char *json, const char *key, bool *out_value);
bool json_try_parse_int(const char *json, const char *key, int *out_value);
bool json_try_parse_bool(const char *json, const char *key, bool *out_value);

bool palette_bank_load_json(const char *path, PaletteBank *out_bank);

void palette_bank_free(PaletteBank *bank);
void image_data_free(ImageData *image);

#endif /* TD2_IO_H */
