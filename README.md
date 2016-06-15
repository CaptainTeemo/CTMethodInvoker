# CTMethodInvoker

## At a glance
Assuming we have 2 classes called `Artist` and `Album`.

```objc
@interface Artist : NSObject
@property (nonnull, nonatomic, copy) NSString *firstName;
@property (nonnull, nonatomic, copy) NSString *lastName;

- (nullable instancetype)initWithFirstName: (nonnull NSString *)firstName lastName: (nonnull NSString *)lastName;
@end

@interface Album : NSObject
@property (nonnull, nonatomic, strong) Artist *artist;
@property (nonnull, nonatomic, copy) NSString *name;

- (nullable instancetype)initWithArtist: (nonnull Artist *)artist name: (nonnull NSString *)name;
@end
```

BUT we cannot import these two header files for some reason (there always be a reason). At this moment, CTMethodInvoker is here to solve this problem.

