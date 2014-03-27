#!/bin/bash

opt=$1; shift

case $opt in
	n)
		url="https://secure.sos.state.or.us/orestar/gotoPublicTransactionSearchResults.do?cneSearchButtonName=search&cneSearchPageIdx=0&cneSearchContributorTypeName=&cneSearchTranTypeName=&cneSearchTranSubTypeName=&cneSearchTranPurposeName=&cneSearchFilerCommitteeId=&cneSearchFilerCommitteeTxt=&cneSearchFilerCommitteeTxtSearchType=C&cneSearchTranStartDate=&cneSearchTranEndDate=&cneSearchTranFiledStartDate=&cneSearchTranFiledEndDate=&transactionId=&cneSearchTranType=&cneSearchTranAmountFrom=&cneSearchTranAmountTo=&cneSearchContributorTxt=$(echo $@ | tr " " "+")&cneSearchContributorTxtSearchType=C&cneSearchContributorType=&addressLine1=&city=&state=&zip=&zipPlusFour=&occupation=&employer=&employerCity=&employerState="
		;;
	c)
		url="https://secure.sos.state.or.us/orestar/gotoPublicTransactionSearchResults.do?cneSearchButtonName=search&cneSearchPageIdx=0&cneSearchContributorTypeName=&cneSearchTranTypeName=&cneSearchTranSubTypeName=&cneSearchTranPurposeName=&cneSearchFilerCommitteeId=&cneSearchFilerCommitteeTxt=$(echo $@ | tr " " "+")&cneSearchFilerCommitteeTxtSearchType=C&cneSearchTranStartDate=&cneSearchTranEndDate=&cneSearchTranFiledStartDate=&cneSearchTranFiledEndDate=&transactionId=&cneSearchTranType=&cneSearchTranAmountFrom=&cneSearchTranAmountTo=&cneSearchContributorTxt=&cneSearchContributorTxtSearchType=C&cneSearchContributorType=&addressLine1=&city=&state=&zip=&zipPlusFour=&occupation=&employer=&employerCity=&employerState="
		;;
esac

curl $url
