void onBan(const string username, const int minutes, const string reason)
{
    string message = username + " foi banido por " + minutes + " minutos. Motivo: " + reason;
    client_AddToChat(message, 293);
}
