#!/usr/bin/env octave -qf

% Andrew Pennebaker
% 22 Mar 2009

function w=f(v)
	x=v(1);
	y=v(2);

	w=zeros(2, 1);

	w(1)=x^2 + y^2 - 4;
	w(2)=e^x - y - 1;
end

function w=jf(v)
	x=v(1);
	y=v(2);

	w=zeros(2, 2);

	w(1,:) = [2*x 2*y];
	w(2,:) = [e^x -1];
end

vnewton(@f, @jf, [1 1]')
