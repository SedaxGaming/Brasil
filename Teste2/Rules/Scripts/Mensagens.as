#define CLIENT_ONLY

const u16 JOIN_MESSAGE_DELAY = 5 * 30;
const u16 MESSAGE_INTERVAL = 60 * 30;

const string[] messages = {
	
	"Entre no servidor do Kag Brasil https://discord.gg/a99YkRWZdp",
	"Doe para manter o servidor ativo 24h. Chave pix : welly.97@hotmail.com",
	"Sabia que você pode entrar em um clan e participar de guerras entre clans?",
	"Doadores recebem cabeças personalizadas? Algumas até emitem luz!",
	"Sabia que você pode deixar sugestões para o mod do Kag Brasil no discord?",
	"O dono do servidor é o Classic",
	"Membros de clans tem cabeças customizadas de forma padronizada!",
	"Boatos afirmam que a bomba tsar foi criada por um membro do clan VANGUARD!",
	"Respondeu Jesus: Eu sou o caminho, a verdade e a vida. Ninguém vem ao Pai, a não ser por mim. João 14:6",
	"De acordo com histórias, os cavaleiros da VANGUARD são soldados sangrentos e invencíveis!",
	"O clan CAPIVARA afirma que o clan VANGUARD tem envolvimento no ataque do 11 de setembro",
	"O admin está pagando coca para o time vencedor dessa partida! Lutem dando as suas vidas!",

};

bool just_joined = true;
int counter = 0;

void onTick( CRules@ this )
{
	const u32 time = getGameTime();
	
	if (just_joined && (time % JOIN_MESSAGE_DELAY) == 0)
	{
		client_AddToChat("Bem vindo ao servidor Kag Brasil!", SColor(255, 127, 0, 127));
		client_AddToChat("Entre no discord: https://discord.gg/a99YkRWZdp", SColor(255, 127, 0, 127));
	    just_joined = false;
	}
	else if(time % MESSAGE_INTERVAL == 0)
	{
	    client_AddToChat(messages[counter++ % messages.length], SColor(255, 127, 0, 127));
	}
}
