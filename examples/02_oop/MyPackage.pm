package MyPackage;
use MyObject;
# ...
sub twice_nth {
    my ($self, $obj, $n) = @_;
    $obj->nth_digit($n) * 2;
}
# ...
'MyPackage.pm'
