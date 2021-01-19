#!/usr/bin/env python3

'''99 bottles of beer song'''

if __name__ == '__main__':
    for i in range(99, 1, -1):
        print(
            '' + i +
            ' bottles of beer on the wall, ' + i +
            ' bottles of beer.\n' +
            'Take one down, pass it around, ' + (i - 1) +
            ' bottles of beer on the wall.\n'
        )

    print(
        '1 bottle of beer on the wall, ' +
        '1 bottle of beer.\n' +
        'Go to the store and buy some more, ' +
        '99 bottles of beer on the wall.'
    )
