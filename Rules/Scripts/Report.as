void onInit(CRules@ this)
{
    AddScript(this, "Mensagens.as");
    AddScript(this, "Regeneracao.as");
}

bool AddScript(CRules@ rules, const string&in fileName)
{
    return rules.AddScript(fileName);
}
