const Commando = require('discord.js-commando');
const bot = new Commando.Client();
const TOKEN = 'NTE5NTE5Mzc1MjIxNDU2OTA3.DusfIg.TDKK0Vrx8DUT0BI9s1efJaqtY-Q';

bot.registry.registerGroup('simple', 'Simple');
bot.registry.registerGroup('music', 'Music');
bot.registry.registerDefaults();
bot.registry.registerCommandsIn(__dirname + '/commands');

bot.on('message', function(message){
    if (message.content == 'hey')
    {
        message.channel.sendMessage('Hello ' + message.author + ', welcome to the server.');
        message.channel.sendMessage(message.author.avatarURL);
    }
});

bot.on('ready', function()
{
    console.log("Ready & Online");
});

bot.login(TOKEN);