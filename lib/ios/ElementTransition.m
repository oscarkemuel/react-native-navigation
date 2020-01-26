#import "ElementTransition.h"
#import "ElementAlphaTransition.h"
#import "ElementVerticalTransition.h"
#import "ElementHorizontalTransition.h"
#import "HorizontalTranslationTransition.h"
#import "VerticalTranslationTransition.h"
#import "Transition.h"
#import "RNNElementFinder.h"
#import "VerticalRotationTransition.h"

@implementation ElementTransition {
    ElementTransitionOptions* _transitionOptions;
    UIViewController* _toVC;
    UIViewController* _fromVC;
    UIView* _containerView;
}

- (instancetype)initWithTransitionOptions:(ElementTransitionOptions *)transitionOptions view:(UIView *)view fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC containerView:(UIView *)containerView {
    self = [super init];
    _transitionOptions = transitionOptions;
    _fromVC = fromVC;
    _toVC = toVC;
    _containerView = containerView;
    self.view = view;
    self.animations = [self createAnimations];
    return self;
}

- (NSMutableArray<id<DisplayLinkAnimation>> *)createAnimations {
    NSMutableArray* animations = [NSMutableArray new];
    if (_transitionOptions.alpha.hasAnimation) {
        [animations addObject:[[ElementAlphaTransition alloc] initWithView:self.view transitionDetails:_transitionOptions.alpha]];
    }
    
    if (_transitionOptions.x.hasAnimation) {
        [animations addObject:[[ElementHorizontalTransition alloc] initWithView:self.view transitionDetails:_transitionOptions.x]];
    }
    
    if (_transitionOptions.y.hasAnimation) {
        [animations addObject:[[ElementVerticalTransition alloc] initWithView:self.view transitionDetails:_transitionOptions.y]];
    }
    
    if (_transitionOptions.translationX.hasAnimation) {
        [animations addObject:[[HorizontalTranslationTransition alloc] initWithView:self.view transitionDetails:_transitionOptions.translationX]];
    }
    
    if (_transitionOptions.translationY.hasAnimation) {
        [animations addObject:[[VerticalTranslationTransition alloc] initWithView:self.view transitionDetails:_transitionOptions.translationY]];
    }
    
    if (_transitionOptions.rotationY.hasAnimation) {
        [animations addObject:[[VerticalRotationTransition alloc] initWithView:self.view transitionDetails:_transitionOptions.rotationY]];
    }
    
    return animations;
}

@end
