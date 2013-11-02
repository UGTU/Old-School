namespace DelphiAnalyser.Analysers
{
    /// <summary>
    /// Токены
    /// </summary>
    public enum DfmTokens
    {
        Undefined, FileEnd,
        Object, Inherited, Inline, Item, End,
        Id, Digits, HexConstant, String, Char,
        Dot, LBr, RBr, LSBr, RSBr, LTBr, RTBr, LFBr, RFBr, Assigment, Addition, Subtruction, Colon, Comma
    }
}
