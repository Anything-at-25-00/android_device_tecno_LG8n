#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define GESTURE_FUNCTION_PATH "/proc/gesture_function"
#define GESTURE_STATE_PATH "/proc/gesture_state"
#define DT2W_STATE_PROP "persist.sys.MT6789.dt2w"

// me noob sar

// sounds like a great idea, with the best of intentions

int main() {
    FILE *fp, *fpState;
    char cmd[100];
    char buffer[20];
    char stateBuffer[20];

    // Wait until we finish boot
    sprintf(cmd, "getprop sys.boot_completed");
    while (system(cmd) != 0); // Assuming 'getprop' returns 0 when boot is completed

    // Main loop to continuously monitor and adjust gesture function
    while (1) {
        sprintf(cmd, "getprop %s", DT2W_STATE_PROP);
        fp = popen(cmd, "r");
        if (fp == NULL) {
            printf("prop not found\n");
            exit(1);
        }

        fgets(buffer, sizeof(buffer)-1, fp);
        pclose(fp);

        // Remove trailing newline character, just so it's clean
        buffer[strcspn(buffer, "\n")] = 0;

        // see if gesture_state nude already has the value we want
        sprintf(cmd, "awk '/cc:/ {print $2}' %s", GESTURE_STATE_PATH);
        fpState = popen(cmd, "r");
        if (fpState != NULL) {
            fgets(stateBuffer, sizeof(stateBuffer)-1, fpState);
            pclose(fpState);

            // Remove trailing newline character
            stateBuffer[strcspn(stateBuffer, "\n")] = 0;

            if ((strcmp(buffer, "0") == 0 && strcmp(stateBuffer, "cc:0") != 0) ||
                (strcmp(buffer, "1") == 0 && strcmp(stateBuffer, "cc:1") != 0)) {
                // it doesn't have the value we want, go write
                fp = fopen(GESTURE_FUNCTION_PATH, "w");
            if (fp != NULL) {
                if (strcmp(buffer, "0") == 0) {
                    fputs("cc2", fp);
                } else if (strcmp(buffer, "1") == 0) {
                    fputs("cc1", fp);
                }
                fclose(fp);
            }
                }
        } else {
            printf("Failed to read gesture state\n");
        }

        sleep(1); // Sleep for 1 second before checking again
    }

    return 0;
}
