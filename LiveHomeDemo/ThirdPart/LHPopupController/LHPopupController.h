//
//  LHPopupController.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/29.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LHPopupControllerDelegate;
@class LHPopupTheme, LHPopupButton;

@interface LHPopupController : NSObject

@property (nonatomic, strong) LHPopupTheme *_Nonnull theme;
@property (nonatomic, weak) id <LHPopupControllerDelegate> _Nullable delegate;

- (nonnull instancetype) init __attribute__((unavailable("You cannot initialize through init - please use initWithContents:")));
- (nonnull instancetype)initWithContents:(nonnull NSArray<UIView *> *)contents NS_DESIGNATED_INITIALIZER;

- (void)presentPopupControllerAnimated:(BOOL)flag;
- (void)dismissPopupControllerAnimated:(BOOL)flag;

@end

@protocol LHPopupControllerDelegate <NSObject>

@optional
- (void)popupControllerWillPresent:(nonnull LHPopupController *)controller;
- (void)popupControllerDidPresent:(nonnull LHPopupController *)controller;
- (void)popupControllerWillDismiss:(nonnull LHPopupController *)controller;
- (void)popupControllerDidDismiss:(nonnull LHPopupController *)controller;

@end

typedef void(^SelectionHandler) (LHPopupButton *_Nonnull button);

@interface LHPopupButton : UIButton

@property (nonatomic, copy) SelectionHandler _Nullable selectionHandler;

@end

// LHPopupStyle: Controls how the popup looks once presented
typedef NS_ENUM(NSUInteger, LHPopupStyle) {
    LHPopupStyleActionSheet = 0, // Displays the popup similar to an action sheet from the bottom.
    LHPopupStyleCentered, // Displays the popup in the center of the screen.
    LHPopupStyleFullscreen // Displays the popup similar to a fullscreen viewcontroller.
};

// LHPopupPresentationStyle: Controls how the popup is presented
typedef NS_ENUM(NSInteger, LHPopupPresentationStyle) {
    LHPopupPresentationStyleFadeIn = 0,
    LHPopupPresentationStyleSlideInFromTop,
    LHPopupPresentationStyleSlideInFromBottom,
    LHPopupPresentationStyleSlideInFromLeft,
    LHPopupPresentationStyleSlideInFromRight
};

// LHPopupMaskType
typedef NS_ENUM(NSInteger, LHPopupMaskType) {
    LHPopupMaskTypeClear,
    LHPopupMaskTypeDimmed
};

NS_ASSUME_NONNULL_BEGIN
@interface LHPopupTheme : NSObject

@property (nonatomic, strong) UIColor *backgroundColor; // Background color of the popup content view (Default white)
@property (nonatomic, assign) CGFloat cornerRadius; // Corner radius of the popup content view (Default 4.0)
@property (nonatomic, assign) UIEdgeInsets popupContentInsets; // Inset of labels, images and buttons on the popup content view (Default 16.0 on all sides)
@property (nonatomic, assign) LHPopupStyle popupStyle; // How the popup looks once presented (Default centered)
@property (nonatomic, assign) LHPopupPresentationStyle presentationStyle; // How the popup is presented (Defauly slide in from bottom. NOTE: Only applicable to LHPopupStyleCentered)
@property (nonatomic, assign) LHPopupMaskType maskType; // Backgound mask of the popup (Default dimmed)
@property (nonatomic, assign) BOOL dismissesOppositeDirection; // If presented from a direction, should it dismiss in the opposite? (Defaults to NO. i.e. Goes back the way it came in)
@property (nonatomic, assign) BOOL shouldDismissOnBackgroundTouch; // Popup should dismiss on tapping on background mask (Default yes)
@property (nonatomic, assign) BOOL movesAboveKeyboard; // Popup should move up when the keyboard appears (Default yes)
@property (nonatomic, assign) CGFloat contentVerticalPadding; // Spacing between each vertical element (Default 12.0)
@property (nonatomic, assign) CGFloat maxPopupWidth; // Maxiumum width that the popup should be (Default 300)
@property (nonatomic, assign) CGFloat animationDuration; // Duration of presentation animations (Default 0.3s)

// Factory method to help build a default theme
+ (LHPopupTheme *)defaultTheme;

@end
NS_ASSUME_NONNULL_END
