void onInit(CRules@ this)
{
    AddScript(this, "Mensagens.as");
    AddScript(this, "Regeneracao.as");
    AddScript(this, "MVP_Coroa.as");
    //scripts diversão
    AddScript(this, "Fun_Mikill_Adaptar.as");
}

bool AddScript(CRules@ rules, const string&in fileName)
{
    return rules.AddScript(fileName);
}
