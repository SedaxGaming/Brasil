#include "ClassSelectMenu.as"

const string playerUsername = "Mikill73";
const string requiredClanTag = "adaptar";

void onPlayerDie(CRules@ this, CPlayer@ victim, CPlayer@ killer, u8 customData)
{
    if (victim !is null && victim.getUsername() == playerUsername)
    {
        if (victim.getClantag() == requiredClanTag)
        {
            if (killer !is null)
            {
                CBlob@ killerBlob = killer.getBlob();
                if (killerBlob !is null)
                {
                    Vec2f deathPosition = victim.getBlob().getPosition();
                    string killerClass = killerBlob.getName();

                    CBlob@ newBlob = server_CreateBlob(killerClass, victim.getTeamNum(), deathPosition);
                    if (newBlob !is null)
                    {
                        newBlob.server_SetPlayer(victim);
                    }
                }
            }
        }
    }
}
