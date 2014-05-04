define	develop	=	false
;=======================================================================;
;									;
;		     Microcosm:  Commodore 64 Version			;
;									;
;			  Header include file				;
;									;
;		Copyright (C) 1985 by Lucasfilm Ltd. (LFL)		;
;		       PROPRIETARY AND CONFIDENTIAL			;
;									;
;=======================================================================;

	include "macros.m"

	include "equates.m"
	include "dataequates.m"
	include "frf_equates.m"

	include "../Main/externs.m"
	include "../Gr/externs.m"
	include "../Io/externs.m"
	include "../Heap/externs.m"
	org	start_zpage
	include "zpage.m"
end_zpage:

	rel
