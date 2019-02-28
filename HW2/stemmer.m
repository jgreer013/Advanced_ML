function [stemmed] =stemmer(inputWord)
  stemmedWords = {"1",	"10",	"11",	"12",	"13",	"14",	"15",	"18",	"2",	"20",	"23",	"3",	"4",	"5",	"6",	"7",	"7ve",	"8",	"8sb",	"9",	"aa",	"aa",	"aa",	"aa",	"adc",	"add",	"and",	"arpl",	"bound",	"bsr",	"bt",	"call",	"cdq",	"clc",	"cld",	"cli",	"cmc",	"cmp",	"cwde",	"daa",	"das",	"dec",	"div",	"enter",	"fabs",	"fadd",	"fbld",	"fchs",	"fcmov",	"fcmovu",	"fcom",	"fcos",	"fdiv",	"fiadd",	"ficom",	"fidiv",	"fild",	"fimul",	"fist",	"fisub",	"fld",	"fldpi",	"fmul",	"fnclex",	"fnsave",	"fnst",	"fpatan",	"fprem",	"fptan",	"frstor",	"fsave",	"fscale",	"fst",	"fsub",	"ftst",	"fxam",	"fxch",	"fyl2x",	"idiv",	"imul",	"in",	"inc",	"int",	"ja",	"jb",	"jbe",	"jecxz",	"jg",	"jl",	"jmp",	"jn",	"jo",	"jp",	"js",	"jz",	"lahf",	"ldmxcsr",	"lds",	"lea",	"les",	"lock",	"lod",	"loop",	"mov",	"mul",	"neg",	"nop",	"not",	"or",	"or",	"out",	"paddusw",	"pop",	"psub",	"psub",	"push",	"rcl",	"rcr",	"rdtsc",	"rep",	"repne",	"retf",	"retn",	"rol",	"ror",	"sahf",	"sal",	"sar",	"sbb",	"scas",	"set",	"shl",	"shr",	"stc",	"std",	"sti",	"stmxcsr",	"stos",	"stos",	"stos",	"sub",	"test",	"ud2",	"wait",	"xchg",	"xlat",	"xor"};
     charCount = 0;
   while (~any(strcmp(stemmedWords,inputWord(1:charCount))))
    charCount+=1;
  end
   if charCount >= 1
  stemmed = inputWord(1:charCount);
end

endfunction
