const float REGEN_INTERVALO = 30.0f;
const float REGEN_DURACAO = 150.0f;
const float REGEN_QUANTIA = 0.10f;
const float PARTICULAS = 1.0f;

void onInit(CBlob@ this)
{
    this.Tag("Regen");
    this.set_u32("regen_start_time", getGameTime());
}

void onTick(CBlob@ this)
{
    if (this.hasTag("Regen"))
    {
        u32 regen_start_time = this.get_u32("regen_start_time");
        u32 elapsed_time = getGameTime() - regen_start_time;

        if (elapsed_time % REGEN_INTERVALO == 0)
        {
            float initialHealth = this.getInitialHealth();
            float currentHealth = this.getHealth();
            this.server_SetHealth(currentHealth + REGEN_QUANTIA);
        }

        if (elapsed_time % PARTICULAS == 0)
        {
            Vec2f pos = this.getPosition();
            Vec2f offset = Vec2f(XORRandom(20) - 8, XORRandom(16) - 8);
            ParticleSpark(pos + offset, Vec2f(0, 0), SColor(255, 0, 255, 0));
        }

        if (elapsed_time >= REGEN_DURACAO)
        {
            this.Untag("Regen");
            this.RemoveScript("Regeneracao.as");
        }
    }
}