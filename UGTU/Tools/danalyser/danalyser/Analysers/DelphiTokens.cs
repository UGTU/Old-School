namespace DelphiAnalyser.Analysers
{
    /// <summary>
    /// Токены
    /// </summary>
    public enum DelphiTokens
    {
        Undefined, Id, Digits, HexConstant, Char, String, LComment, MLComment, OComment, BComment, FileEnd,
        Program, Library, Unit,
        Initialization, Implementation, Finalization, Uses, Exports,
        Type, Var, Const, Resourcestring, Threadvar,
        Interface, Dispinterface, Class, Object, Record, Set, Array, File,
        Abstract, Sealed,
        Procedure, Function, Property, Operator, Constructor, Destructor,
        Dispid, Absolute, Packed, Default, Nodefault, Implements,
        Private, Public, Published, Protected,
        Virtual, Override, Overload, Static, Safecall, Stdcall, Dynamic, Forward, Near, Far, Reintroduce, Register, Stored, Automated, Cdecl, Varargs, Message, Assembler,
        Name, Index, Export, Local, External, Resident,
        In, Out, Read, Write,
        Asm, Begin, End, If, Then, Else, Case, Of, While, For, To, Downto, Do, Until, Repeat, Try, Except, Finally, Goto, Label, With, As, Is, At, On, Raise,
        Not, And, Xor, Or, Shl, Shr, Div, Mod,
        Multiply, Addition, Subtraction, Division, Equal, Less, Greater, LessOrEqual, GreaterOrEqual, NotEqual,
        Assigment, Dot, Interval, Colon, Comma, Semicolon,                // := . .. : , ;
        LSBr, RSBr, LBr, RBr, LFBr, RFBr, LCBr, RCBr, LRBr, RRBr, LDBr,   // [ ] ( ) { } /* */ (* *) //
        AtSign, Caret,                                                    // @ ^
        NewLine,
        True, False, Inherited
    }
}
