program Args;
var
  i : integer;
begin
  for i := 0 to ParamCount do
    writeln(ParamStr(i));
end.
