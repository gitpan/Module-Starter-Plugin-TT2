use Test::More tests => [% modules.length %];

BEGIN {
[% FOREACH module = modules -%]
  use_ok('[%module%]');
[% END -%]
}

diag( "Testing [%main_module%] $[%main_module%]::VERSION" );
