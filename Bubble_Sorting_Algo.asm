org 2000H;
	LD Ix,2100H;
	LD D,13H;
	LD C,00H;
addr_3:

	LD A,(Ix+1);
	LD B,A;
	LD A,(Ix+0);
	SUB B;
	Call P,2500H;
	JP C,addr_no;
	JP addr_yes;

	org 2500H;
	JP NC,addr_yes;
	JP addr_no;
addr_no:
	LD A,(Ix+1);
	LD B,A;
	LD A,(Ix+0);

	LD (Ix+1),A;
	LD A,B;
	LD (Ix+0),A;
addr_yes:
	inc Ix;
	dec D;
	JP Z,ll;
	JP addr_3;
ll:
	ld A,13H;
	sub C;
	jp Z,ff;
	inc C;
	LD D,13H;
	LD Ix,2100H;
	jp addr_3;

ff:
	Halt;