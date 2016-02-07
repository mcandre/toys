'shmatlab'% $0 ${1+"$@"}
'exit';

%% Example:
%%
%% $ ./args.m a b c
%% ./args.m
%% a
%% b
%% c

for i = 1:nvarargin
  disp(varargin{i});
end
