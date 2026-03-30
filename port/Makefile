CC = gcc
CFLAGS = -O2 -std=c11 -Wall -Wextra `sdl2-config --cflags`
LDFLAGS = `sdl2-config --libs`

SRCS = main.c platform_sdl.c framebuffer.c
OBJS = $(SRCS:.c=.o)

all: port

port: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)

clean:
	rm -f $(OBJS) port
