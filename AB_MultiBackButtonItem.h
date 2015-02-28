//
//  AB_MultiBackButtonItem.h
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

#import <UIKit/UIKit.h>

@interface AB_MultiBackButtonItem : UIBarButtonItem 

@end

@interface UIViewController (AB_MultiBackButtonItem)

// when view-controller would normally have a back-button because it is part of navigation
// controller hierarchy and not at the root we set navigationItem.leftBarButtonItem and
// in other cases nothing is done. Configuration takes care not to do double work if called
// on ViewController that already has a MultiBackButtonItem
-(void)configureMultiBackButton;

// You configure the image used in cells for this view-controller,
// setting it in either in IB or perhaps viewDidLoad. The popup table will look much nicer if
// you supply images for all view-controllers that take part and 25x25 images work well.
@property (nonatomic, strong) IBInspectable UIImage* multiBackButtonImage;

// The name of view-controller shown in popup is taken from navigationItem.title or title of
// view-controller itself, but if you want something different set this property in
// IB or viewDidLoad. You rarely need to set this property.
@property (nonatomic, strong) IBInspectable NSString* multiBackButtonTitle;

#pragma mark Previous item

// Sometimes it makes sense to have a item before the root of the view-controller,
// such as settings. You configure a "previous" item for the root controller to support this.

// install navigation item before view-controller itself, and when picking this the view-hierarchy
// is rolled back to this view-controller (that must be hierarchy root) and the action block is called.
-(void)configurePreviousTitle:(NSString*)title image:(UIImage*)image action:(void (^)(void))block;

// used internally to get results from call to configurePreviousTitle:image:action:
// but can be used to check by outside parties to check if something has already been configured
// in which case it returns non-nil.
-(NSArray*)previousInfo;

#pragma mark -

@end