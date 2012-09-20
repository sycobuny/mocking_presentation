package MyPackage;
# ...
sub FILENAME () { 'myfile' }
sub remove_file {
    unlink(shift->FILENAME) or die "whoops!"
}
# ...
'MyPackage.pm'
