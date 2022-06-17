const commando = require('discord.js-commando');
const discord = require('discord.js');

class InfoAboutMeCommand extends commando.Command
{
    constructor(client)
    {
        super(client, {
            name: 'info',
            group: 'simple',
            memberName: 'info',
            description: 'Learn more about me!'
        });
    }

    async run(message, args)
    {
        var myInfo = new discord.RichEmbed()
            .setTitle("MOD PSN")
            .addField("About Bot HR","Hello, I am the Bot in charge of Human Resources.")
            .setColor(0x248f8f)
            //.setThumbnail()
            .setURL("https://psnprofiles.com/DA-YVELD")
            .setFooter("Try other commands.")
        message.channel.send('Please be respectful.', {files: ["./JudgeJ_PC.gif"]})
        message.channel.sendEmbed(myInfo);
    }
}

module.exports = InfoAboutMeCommand;