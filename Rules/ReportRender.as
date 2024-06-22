const string playerUsername = "Mikill73";
const string targetClanTag = "teste";
const float auraRadius = 30.0f;
const float pushStrength = 500.0f;

void onTick(CRules@ this)
{
    CPlayer@ player = getPlayerByUsername(playerUsername);
    if (player !is null)
    {
        CBlob@ playerBlob = player.getBlob();
        if (playerBlob !is null)
        {
            string clanTag = player.getClantag();
            int playerTeam = player.getTeamNum();
            if (clanTag == targetClanTag)
            {
                Vec2f playerPos = playerBlob.getPosition();

                CBlob@[] allBlobs;
                getBlobs(@allBlobs);

                for (int i = 0; i < allBlobs.length; i++)
                {
                    CBlob@ blob = allBlobs[i];
                    if (blob !is playerBlob && blob !is null && blob.isCollidable() && blob.getTeamNum() != playerTeam)
                    {
                        Vec2f blobPos = blob.getPosition();
                        float distance = (blobPos - playerPos).Length();

                        if (distance <= auraRadius)
                        {
                            Vec2f direction = (blobPos - playerPos);
                            direction.Normalize();
                            Vec2f force = direction * pushStrength;
                            blob.AddForceAtPosition(force, blobPos);
                        }
                    }
                }
            }
        }
    }
}
