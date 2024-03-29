//
//  ViewController.m
//  EmuBoard
//
//  Created by 鈴木　洋司　 on 2018/12/30.
//  Copyright © 2018年 SUZUKIPLAN. All rights reserved.
//

#import "ViewController.h"
#import "VideoView.h"
#import "constants.h"
#import "EmuBoard.h"

@interface ViewController() <NSWindowDelegate>
@property (nonatomic) VideoView* video;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    emu_init();
    self.view.frame = CGRectMake(0, 0, VRAM_VIEW_WIDTH * 2, VRAM_VIEW_HEIGHT * 2);
    CALayer *layer = [CALayer layer];
    [layer setBackgroundColor:CGColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0)];
    [self.view setWantsLayer:YES];
    [self.view setLayer:layer];
    _video = [[VideoView alloc] initWithFrame:[self calcVramRect]];
    [self.view addSubview:_video];
}

- (void)viewWillAppear
{
    self.view.window.delegate = self;
}

- (void)windowDidResize:(NSNotification *)notification
{
    _video.frame = [self calcVramRect];
}

- (NSRect)calcVramRect
{
    // 表示サイズは常に2xにしておく
    /*
    if (self.view.window.contentView.frame.size.width) {
        self.view.frame = self.view.window.contentView.frame;
    } else {
        self.view.frame = CGRectMake(0, 0, VRAM_VIEW_WIDTH * 2, VRAM_VIEW_HEIGHT * 2);
     }
     */

    // 幅を16とした時の高さのアスペクト比を計算
    CGFloat aspectY = VRAM_VIEW_HEIGHT / (VRAM_VIEW_WIDTH / 16.0);
    // window中央にVRAMをaspect-fitで描画
    if (self.view.frame.size.height < self.view.frame.size.width) {
        CGFloat height = self.view.frame.size.height;
        CGFloat width = height / aspectY * 16;
        CGFloat x = (self.view.frame.size.width - width) / 2;
        return NSRectFromCGRect(CGRectMake(x, 0, width, height));
    } else {
        CGFloat width = self.view.frame.size.width;
        CGFloat height = width / 16 * aspectY;
        CGFloat y = (self.view.frame.size.height - height) / 2;
        return NSRectFromCGRect(CGRectMake(0, y, width, height));
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}

- (void)dealloc
{
    emu_destroy();
}

@end
