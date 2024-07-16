int bomb = 0;

void onTick(CRules@ this)
{
    int limitebisons = 100;
    
    if (!this.isMatchRunning())
    {
        if (bomb < limitebisons)
        {
            int posicao = XORRandom(900);
            CBlob@ blob = server_CreateBlob("bomb", 902, Vec2f(posicao, 0));
            bomb++;
        }
    }
    else
    {
    	bomb = 0;
    }
}
