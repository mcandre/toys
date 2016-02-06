#!/usr/bin/env octave -qf

u = [1 2 3];

disp("u =");
disp(u);

v = [4 5 6];

disp("v =");
disp(v);

w = u + v;

disp("w = u + v =");
disp(w);

uT = u';

disp("u^t =");
disp(uT);

h = [1; 2; 3];

disp("h =");
disp(h);

p = uT - h;

disp("p = uT - h =");
disp(p);
