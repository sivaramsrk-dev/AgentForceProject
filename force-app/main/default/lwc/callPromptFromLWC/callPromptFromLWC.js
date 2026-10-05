import { LightningElement } from 'lwc';
// import Apex Class Method
import AnswerQuery from '@salesforce/apex/CallPromptAgentForceFromApex.AnswerQuery';
export default class CallPromptFromLWC extends LightningElement 
{
    lwcQuestion;
    outputFromPrompt;

    CapQuest(event)
    {
        this.lwcQuestion = event.target.value;
    }
    CallPrompt(event)
    {
        AnswerQuery({UserQuery : this.lwcQuestion }).then(success => {
            this.outputFromPrompt = success;
        }).catch(error =>{
            this.outputFromPrompt = error;
        })
    }
}