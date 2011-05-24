#line 1 "hello.rl"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


#line 8 "hello.c"
static const char _hello_actions[] = {
	0, 1, 0, 1, 1, 1, 2
};

static const char _hello_key_offsets[] = {
	0, 0, 1, 2, 3, 4
};

static const char _hello_trans_keys[] = {
	101, 108, 108, 111, 104, 0
};

static const char _hello_single_lengths[] = {
	0, 1, 1, 1, 1, 1
};

static const char _hello_range_lengths[] = {
	0, 0, 0, 0, 0, 0
};

static const char _hello_index_offsets[] = {
	0, 0, 2, 4, 6, 8
};

static const char _hello_trans_targs[] = {
	2, 0, 3, 0, 4, 0, 5, 0, 
	1, 0, 0
};

static const char _hello_trans_actions[] = {
	0, 0, 0, 0, 0, 0, 5, 0, 
	0, 0, 0
};

static const char _hello_to_state_actions[] = {
	0, 0, 0, 0, 0, 1
};

static const char _hello_from_state_actions[] = {
	0, 0, 0, 0, 0, 3
};

static const int hello_start = 5;
static const int hello_first_final = 5;
static const int hello_error = 0;

static const int hello_en_main = 5;

#line 15 "hello.rl"


#define BUFSIZE 128

void scanner() {
	static char buf[BUFSIZE];
	int cs, act, have = 0, curline = 1;
	char *ts, *te = 0;
	int done = 0;

	
#line 69 "hello.c"
	{
	cs = hello_start;
	ts = 0;
	te = 0;
	act = 0;
	}
#line 26 "hello.rl"

	while (!done) {
		char *p=buf+have, *pe, *eof=0;
		int len, space=BUFSIZE-have;
		
		if (space==0) {
			/* We've used up the entire buffer storing an already-parsed token
			 * prefix that must be preserved. */
			fprintf(stderr, "OUT OF BUFFER SPACE\n");
			exit(1);
		}

		len=fread(p, 1, space, stdin);
		pe=p+len;

		/* Check if this is the end of file. */
		if (len<space) {
			eof=pe;
			done=1;
		}
			
		
#line 99 "hello.c"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_acts = _hello_actions + _hello_from_state_actions[cs];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 ) {
		switch ( *_acts++ ) {
	case 1:
#line 1 "hello.rl"
	{ts = p;}
	break;
#line 120 "hello.c"
		}
	}

	_keys = _hello_trans_keys + _hello_key_offsets[cs];
	_trans = _hello_index_offsets[cs];

	_klen = _hello_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _hello_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += ((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	cs = _hello_trans_targs[_trans];

	if ( _hello_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _hello_actions + _hello_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 2:
#line 11 "hello.rl"
	{te = p+1;{ printf("Hello\n"); }}
	break;
#line 188 "hello.c"
		}
	}

_again:
	_acts = _hello_actions + _hello_to_state_actions[cs];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 ) {
		switch ( *_acts++ ) {
	case 0:
#line 1 "hello.rl"
	{ts = 0;}
	break;
#line 201 "hello.c"
		}
	}

	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	_out: {}
	}
#line 48 "hello.rl"

		if (ts==0)
			have=0;
		else {
			/* There is a prefix to preserve, shift it over. */
			have=pe-ts;
			memmove(buf, ts, have);
			te=buf + (te-ts);
			ts=buf;
		}
	}
}

int main() {
	scanner();
	return 0;
}