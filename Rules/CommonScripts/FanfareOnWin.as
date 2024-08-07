#define CLIENT_ONLY

// Variável global para semente
uint seed = 0;

// Função para definir a semente do gerador de números aleatórios
void setSeed(uint newSeed)
{
    seed = newSeed;
}

// Função para gerar um número aleatório entre min e max
int getRandom(int min, int max)
{
    // Algoritmo Linear Congruential Generator (LCG)
    seed = (seed * 1103515245 + 12345) % (1 << 31);
    return min + (seed % (max - min + 1));
}

void onStateChange(CRules@ this, const u8 oldState)
{
    if (this.isGameOver() && this.getTeamWon() >= 0)
    {
        // only play for winners
        CPlayer@ localplayer = getLocalPlayer();
        if (localplayer !is null)
        {
            CBlob@ playerBlob = getLocalPlayerBlob();
            int teamNum = playerBlob !is null ? playerBlob.getTeamNum() : localplayer.getTeamNum(); // bug fix (cause in singleplayer player team is 255)
            if (teamNum == this.getTeamWon())
            {
                setSeed(uint(getGameTime()));
                int randomNumber = getRandom(1, 6);
                string soundPath = "/win" + randomNumber + ".ogg";
                Sound::Play(soundPath);
            }
            else
            {
                setSeed(uint(getGameTime()));
                int randomNumber = getRandom(1, 6);
                string soundPath = "/lose" + randomNumber + ".ogg";
                Sound::Play(soundPath);
            }
        }
    }
}
