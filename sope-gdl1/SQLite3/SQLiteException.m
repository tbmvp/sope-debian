/* 
   SQLiteException.m

   Copyright (C) 2003-2005 Helge Hess

   Author: Helge Hess (helge.hess@opengroupware.org)

   This file is part of the SQLite Adaptor Library

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Library General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public
   License along with this library; see the file COPYING.LIB.
   If not, write to the Free Software Foundation,
   59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*/

#import <GDLAccess/GDLAccess.h>
#import "SQLiteException.h"
#include "common.h"

@implementation SQLiteException

+ (void)raiseWithFormat:(NSString *)_format, ... {
  NSString *tmp = nil;
  va_list  ap;
  
  va_start(ap, _format);
  tmp = [[NSString allocWithZone:[self zone]]
                   initWithFormat:_format arguments:ap];
  va_end(ap);

  AUTORELEASE(tmp);

  [[[self alloc] initWithName:NSStringFromClass([self class])
                 reason:tmp userInfo:nil]
          raise];
}

@end

@implementation SQLiteCouldNotOpenChannelException
@end

@implementation SQLiteCouldNotConnectException
@end

@implementation SQLiteCouldNotBindException
@end

void __link_SQLiteException() {
  // used to force linking of object file
  __link_SQLiteException();
}
