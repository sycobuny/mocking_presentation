package MyPackage;
use subs 'unlink';
our ($cfg) = {};
sub unlink {
    if ($cfg->{fail_to_remove}) { 0 }
    else { $cfg->{unlinked_file} = shift }
}

package main;
use Test::More tests => 4;
BEGIN { use_ok('MyPackage') }
is(MyPackage->FILENAME, 'myfile', 'Filename looks legit');
MyPackage->remove_file();
is($MyPackage::cfg->{unlinked_file}, 'myfile',
   'File was removed');
$MyPackage::cfg = {fail_to_remove => 1};
eval { MyPackage->remove_file() };
like($@, qr/whoops!/, 'File removal failed as expected');
