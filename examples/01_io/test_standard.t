use Test::More tests => 3;
BEGIN { use_ok('MyPackage') }
`touch myfile`;
is(MyPackage::FILENAME, 'myfile', 'Filename looks legit');
MyPackage->remove_file();
ok(!-e MyPackage::FILENAME, 'File seems to have been removed');
