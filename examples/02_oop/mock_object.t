use Test::More tests => 3;
use Test::MockObject;

my ($mock) = Test::MockObject->new();
$mock->mock(nth_digit => sub {
    if    ($_[1] == 100) { 9 }
    elsif ($_[1] == 200) { 12 }
    else { die "Test blows up!" }
});

BEGIN {
    Test::MockObject->fake_module('MyObject');
    use_ok('MyPackage')
}
is(MyPackage->twice_nth($mock, 100), 18, 'Twice expected value part 1');
is(MyPackage->twice_nth($mock, 200), 24, 'Twice expected value part 2');
