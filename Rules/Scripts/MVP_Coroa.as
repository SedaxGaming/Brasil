void onTick(CRules@ this)
{
    CPlayer@ highestKdrPlayer = null;
    float highestKdr = -1.0f;
    bool multipleHighestKdr = false;

    for (int i = 0; i < getPlayerCount(); i++)
    {
        CPlayer@ player = getPlayer(i);
        if (player !is null)
        {
            int kills = player.getKills();
            int deaths = player.getDeaths();
            float kdr = deaths > 0 ? float(kills) / float(deaths) : float(kills);

            if (kdr > highestKdr)
            {
                highestKdr = kdr;
                @highestKdrPlayer = player;
                multipleHighestKdr = false;
            }
            else if (kdr == highestKdr)
            {
                multipleHighestKdr = true;
            }
        }
    }

    if (multipleHighestKdr)
    {
        @highestKdrPlayer = null;
    }

    string previousMVP;
    for (int i = 0; i < getPlayerCount(); i++)
    {
        CPlayer@ player = getPlayer(i);
        if (player !is null && player !is highestKdrPlayer)
        {
            CBlob@ playerBlob = player.getBlob();
            if (playerBlob !is null)
            {
                if (playerBlob.hasScript("Crown_Effect.as"))
                {
                    previousMVP = player.getUsername();
                    playerBlob.RemoveScript("Crown_Effect.as");
                }
            }
        }
    }

    if (highestKdrPlayer !is null)
    {
        CBlob@ playerBlob = highestKdrPlayer.getBlob();
        if (playerBlob !is null)
        {
            if (!playerBlob.hasScript("Crown_Effect.as"))
            {
                playerBlob.AddScript("Crown_Effect.as");
                string newMVP = highestKdrPlayer.getUsername();
                if (previousMVP != newMVP)
                {
                    string message = "MVP: " + newMVP;
                    client_AddToChat(message, SColor(255, 255, 0, 0));
                }
            }
        }
    }
}
