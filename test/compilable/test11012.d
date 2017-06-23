template AliasSeq(T...)
{
    alias AliasSeq = T;
}

void main()
{
    // function
    auto func = (int x, int y) { return x - y; };
    static assert(is(typeof(func) == function));
    static if (is(typeof(func) FuncParams == function))
        static assert(is(FuncParams == AliasSeq!(int, int)));
    else
        static assert(0);

    // delegate
    int global = 0;
    auto dlg = (int) { global++; };
    static assert (!is(typeof(dlg) == function));
    static assert(is(typeof(dlg) == delegate));
    static if (is(typeof(dlg) DelegateFunc == delegate))
    {
        static if (is(DelegateFunc DelegateParams == function))
            static assert(is(DelegateParams == AliasSeq!(int)));
        else
            static assert(0);
    }
    else
        static assert(0);
}
