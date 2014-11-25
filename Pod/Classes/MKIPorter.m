//
//  MKIPorter.m
//  Pods
//
//  Created by Marcus Kida on 25/11/2014.
//
//

#import "MKIPorter.h"
#import <arpa/inet.h>

@interface MKIPorter ()

@property (nonatomic, assign) NSInteger lastPort;

@end

@implementation MKIPorter

- (instancetype)sharedInstance {
    static typeof(self) instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self.class alloc] init];
        instance.lastPort = 0;
    });
    return instance;
}

- (NSInteger)allocatePort:(NSError **)error {
    self.lastPort = freePort();
    if (self.lastPort == -1) {
        if (error) {
            *error = [NSError errorWithDomain:NSStringFromClass(self.class) code:-1 userInfo:@{NSLocalizedDescriptionKey: @"Socket error when allocating TCP Port"}];
        }
        return 0;
    }
    if (self.lastPort == -2) {
        if (error) {
            *error = [NSError errorWithDomain:NSStringFromClass(self.class) code:-2 userInfo:@{NSLocalizedDescriptionKey: @"Port already in use: EADDRINUSE"}];
        }
        return 0;
    }
    if (self.lastPort == -3) {
        if (error) {
            *error = [NSError errorWithDomain:NSStringFromClass(self.class) code:-3 userInfo:@{NSLocalizedDescriptionKey: @"Could not bind to process."}];
        }
        return 0;
    }
    if (self.lastPort == -4) {
        if (error) {
            *error = [NSError errorWithDomain:NSStringFromClass(self.class) code:-4 userInfo:@{NSLocalizedDescriptionKey: @"Error: getsockname"}];
        }
        return 0;
    }
    return self.lastPort;
}

#pragma mark - Private C Methods
int freePort () {
    int sock = socket(AF_INET, SOCK_STREAM, 0);
    if(sock < 0) {
        return -1;
    }
    struct sockaddr_in serv_addr;
    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = 0;
    if (bind(sock, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0) {
        if(errno == EADDRINUSE) {
            return -2;
        } else {
            return -3;
        }
    }
    socklen_t len = sizeof(serv_addr);
    if (getsockname(sock, (struct sockaddr *)&serv_addr, &len) == -1) {
        return -4;
    }
    return ntohs(serv_addr.sin_port);
}

@end
