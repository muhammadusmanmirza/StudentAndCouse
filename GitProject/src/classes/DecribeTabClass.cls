public class DecribeTabClass {

    Public DecribeTabClass(){
        List<Schema.DescribeTabSetResult> tabSetRes = Schema.describeTabs();
       System.debug(tabSetRes);
    For(DescribeTabSetResult dt : tabSetRes){
           String appLabel = dt.getLabel();
           System.debug('Label :'+appLabel);
           System.debug('Logo Url :'+dt.getLogoUrl());
           System.debug('Is Selected :'+dt.isSelected());
           String ns = dt.getNamespace();
           if(ns ==''){
              System.debug('The App Label'+appLabel+'has No Namespace Defined');
           }
           else{
            System.debug('NameSpace' +ns);
           }
    if(appLabel=='Sales'){
        List<Schema.DescribeTabResult> sTabRe = dt.getTabs();
        System.debug('Tab Information for Sale App');
        for(Schema.DescribeTabResult sTR : sTabRe){
            System.debug('Label :'+sTR.getLabel());
            System.debug('Color :'+sTR.getColors());
            System.debug('Get ICon Url:'+sTR.getIconUrl());
            System.debug('Get Icon :'+sTR.getIcons());
            System.debug('Get Mini Icon Url:'+sTR.getMiniIconUrl());
            System.debug('Get sObject Name :'+sTR.getSobjectName());
            System.debug('Get  Url :'+ sTR.getUrl());
            System.debug('Is Custom :'+sTR.isCustom());
        }
        
    }
}
    }
}