# Autogenerated from KST: please remove this line if doing any edits by hand!

package spec::perl::TestSwitchDefaultOnly;

use strict;
use warnings;
use base qw(Test::Class);
use Test::More;
use SwitchDefaultOnly;

sub test_switch_default_only: Test(4) {
    my $r = SwitchDefaultOnly->from_file('src/switch_opcodes.bin');


    is($r->opcode(), 83, 'Equals');
    is($r->byte(), 102, 'Equals');
    is($r->struct()->value(), pack('C*', (111, 111, 98, 97)), 'Equals');
    is($r->struct_sized()->value(), pack('C*', (114, 0, 73, 66)), 'Equals');
}

Test::Class->runtests;
