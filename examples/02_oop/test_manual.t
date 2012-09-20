BEGIN { $::INC{'MyObject.pm'} = __FILE__ }
package MyObject;
sub nth_digit {
    if    ($_[1] == 100) { 9 }
    elsif ($_[1] == 200) { 12 }
    else { die "Test blows up!" }
}

package main;
use Test::More tests => 3;
BEGIN { use_ok('MyPackage') }
my ($mock) = bless({}, 'MyObject');
is(MyPackage->twice_nth($mock, 100), 18, 'Twice expected value part 1');
is(MyPackage->twice_nth($mock, 200), 24, 'Twice expected value part 2');
