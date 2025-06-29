GIT_COMMIT   != cat version
PIEFLAGS     != [ `uname` = Linux ] && echo -static-pie || true
LDEXTRA      != [ `uname` != Linux ] && echo -fuse-ld=bfd -lmd || true

CC            = clang
CFLAGS        = -std=gnu99 -Os -D_FILE_OFFSET_BITS=64 -DGIT_COMMIT=\"$(GIT_COMMIT)\" -T data_sections.ld -ffunction-sections -fdata-sections -Wl,--gc-sections -static -Wall -Werror
LIBS          = -lsquashfuse -lsquashfuse_ll -lzstd -lz -lfuse3 -lmimalloc -lpthread

all: runtime

runtime: runtime.c
	$(CC) -I/usr/local/include -I/usr/include/fuse3 $(CFLAGS) $(PIEFLAGS) $(LDEXTRA) $< $(LIBS) -o $@

clean:
	rm -f runtime
