public with sharing class CallPromptAgentForceFromApex {
	@AuraEnabled
	public static string AnswerQuery(String UserQuery) 
	{
		ConnectApi.WrappedValue WrpValue = new ConnectApi.WrappedValue();
		WrpValue.value = UserQuery;
		Map<String, ConnectApi.WrappedValue> ValueMap = new Map<String, ConnectApi.WrappedValue>();
		ValueMap.put('Input:Questions', WrpValue);
		ConnectApi.EinsteinPromptTemplateGenerationsInput PromptGenInput = new ConnectApi.EinsteinPromptTemplateGenerationsInput();
		PromptGenInput.inputParams = ValueMap;
		PromptGenInput.isPreview = false;

		PromptGenInput.additionalConfig = new ConnectApi.EinsteinLlmAdditionalConfigInput();
		PromptGenInput.additionalConfig.applicationName = 'PromptTemplateGenerationsInvocable';
		ConnectApi.EinsteinPromptTemplateGenerationsRepresentation generationOutput = ConnectApi.EinsteinLlm.generateMessagesForPromptTemplate('AF_Ask_me_any_thing', PromptGenInput);
		return generationOutput.generations[0].text;
	}
	
}