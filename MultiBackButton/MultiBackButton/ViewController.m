//
//  ViewController.m
//
//  Anders Borum @palmin
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Anders Borum
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "ViewController.h"
#import "AB_MultiBackButtonItem.h"

@interface ViewController () {
    NSMutableArray* titles;
    NSMutableArray* images;
}

@end

@implementation ViewController

+(NSString*)randomTitle {
    NSArray* nouns = @[@"exchange",@"planes",@"afterthought",@"ladybug",@"meat",@"snails",@"bomb",@"discussion", @"reward",
                       @"nerve",@"payment",@"walk",@"moon",@"boy",@"shoe",@"cushion",@"car",@"system",@"shop", @"current",
                       @"stamp",@"memory",@"engine",@"sponge",@"arithmetic",@"control",@"scarf",@"visitor",@"idea",@"yard"];
    int index = rand() % nouns.count;
    return nouns[index];
}

+(NSString*)randomImageName {
    NSArray* names = @[@"settings", @"close", @"commit", @"dir", @"dir-status", @"doc", @"file", @"img", @"web",
                       @"link", @"repo-dir", @"repo-list", @"repo-status", @"sound", @"src", @"text", @"video", @"zip"];
    int index = rand() % names.count;
    return names[index];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // configure back button
    [self configureMultiBackButton];
    
    // Create random cell data
    titles = [NSMutableArray new];
    images = [NSMutableArray new];

    int count = 5 + rand() % 20;
    for(int k = 0; k < count; ++k) {
        NSString* title = [ViewController randomTitle];
        [titles addObject:title];
        
        UIImage* image = [UIImage imageNamed:[ViewController randomImageName]];
        [images addObject:image];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = titles[indexPath.row];
    cell.imageView.image = images[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"table"];
    
    controller.title = titles[indexPath.row];
    controller.multiBackButtonImage = images[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
