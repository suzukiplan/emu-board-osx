//
//  EmuBoard.c
//  EmuBoard
//
//  Created by 鈴木　洋司　 on 2018/12/30.
//  Copyright © 2018年 SUZUKIPLAN. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "EmuBoard.h"

unsigned short vram[VRAM_WIDTH * VRAM_HEIGHT];

void emu_tick()
{
    int i;
    printf("vram ptr: %p\n", vram);
    for (i = 0; i < 4096; i++) {
        int ptr = rand() % (VRAM_WIDTH * VRAM_HEIGHT);
        vram[ptr] = (unsigned short)rand();
    }
}
