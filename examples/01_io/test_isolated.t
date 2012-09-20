package MyPackage;
use subs 'unlink';
sub unlink { if ($MyPackage::cfg->{fail_to_remove}) { 0 }
             else { $MyPackage::cfg->{unlinked_file} = shift } }
package main;
use Test::More tests => 4;
BEGIN { use_ok('MyPackage') }
is(MyPackage->FILENAME, 'myfile', 'Filename looks legit');
test_remove_file_success: {
    local ($MyPackage::cfg) = {};
    MyPackage->remove_file();
    is($MyPackage::cfg->{unlinked_file}, 'myfile', 'File was removed')
}
test_remove_file_failure: {
    local ($MyPackage::cfg, $@) = {fail_to_remove => 1};
    eval { MyPackage->remove_file() };
    like($@, qr/whoops!/, 'File removal failed as expected');
}
