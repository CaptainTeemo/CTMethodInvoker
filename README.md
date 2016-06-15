# CTMethodInvoker

## Why?
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

## How?

Let's create an `Artist` first:
```objc
id artist = [CTInvoker createInstanceWithURL:[NSURL URLWithString:@"Artist://initWithFirstName:lastName:"] parameters:@[@"Taylor", @"Swift"]];
```

And her `Album`:
```objc
id album = [CTInvoker createInstanceWithURL:[NSURL URLWithString:@"Album://initWithArtist:name:"] parameters:@[artist, @"1989"]];
```

Now we have instances of these two classes. Assuming that `Album` has a 'private' method called `shuffleAll`
```objc
- (void)shuffleAll {
    // start playing
    ... ...
}
```

And it's really simple to call it:
```objc
[CTInvoker invokeMethodWithInstance:album selectorString:@"shuffleAll"];
```

That's all.
