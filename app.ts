import { Telegram } from 'telegraf';
import dotenv from 'dotenv';

dotenv.config()
const TOKEN : string = process.env.BOT_TOKEN as string
const telegram: Telegram = new Telegram(TOKEN);
const chat_id:string = process.env.CHAT_ID as string ;
const minutesProvided : string = process.env.MINS as string;
const mins : number = +minutesProvided;
telegram.sendMessage(chat_id, "Drink Water ")
setInterval(function(){ 
	telegram.sendMessage(chat_id, "Drink Water " )
}, 7200000);

setInterval(() => {
}, mins * 600000000000000)
 