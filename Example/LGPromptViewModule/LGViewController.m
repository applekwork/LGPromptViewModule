//
//  LGViewController.m
//  LGPromptViewModule
//
//  Created by applekwork@163.com on 11/12/2018.
//  Copyright (c) 2018 applekwork@163.com. All rights reserved.
//

#import "LGViewController.h"
#import <LGPromptViewModule/LGLoadingMoreView.h>
@interface LGViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation LGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)loadMoreAction:(id)sender {
    [LGLoadingMoreView showAddedTo:self.contentView title:@"加载中..."];
}
- (IBAction)cancelForView:(id)sender {
    [LGLoadingMoreView cancelForView:self.contentView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
