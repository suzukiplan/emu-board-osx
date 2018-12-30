//
//  constants.h
//  EmuBoard
//
//  Created by 鈴木　洋司　 on 2018/12/30.
//  Copyright © 2018年 SUZUKIPLAN. All rights reserved.
//

#ifndef constants_h
#define constants_h

// VRAMのサイズ情報（ファミコンの場合の設定をしている）
#define VRAM_WIDTH 256          // 映像領域の大きさ
#define VRAM_HEIGHT 240         // 映像領域の高さ
#define VRAM_VIEW_LEFT 8        // 可視範囲の左端
#define VRAM_VIEW_TOP 8         // 可視範囲の上端
#define VRAM_VIEW_RIGHT 248     // 可視範囲の右端
#define VRAM_VIEW_BOTTOM 232    // 可視範囲の下端
#define VRAM_VIEW_WIDTH (VRAM_WIDTH-VRAM_VIEW_LEFT-(VRAM_WIDTH-VRAM_VIEW_RIGHT))
#define VRAM_VIEW_HEIGHT (VRAM_HEIGHT-VRAM_VIEW_TOP-(VRAM_HEIGHT-VRAM_VIEW_BOTTOM))

#endif /* constants_h */
