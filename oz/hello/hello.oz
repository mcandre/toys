% Compile:
%
% ozc -x hello.oz
%
% Run:
%
% ./hello

functor
import
  System
  Application
define
  {System.printInfo 'Hello World!\n'}
  {Application.exit 0}
end