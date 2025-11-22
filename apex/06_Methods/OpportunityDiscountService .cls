public class OpportunityDiscountService {

    public static Decimal calculateDiscount(Decimal amount) {
        if (amount > 100000) {
            return 0.15;
        } else if (amount > 50000) {
            return 0.10;
        } else {
            return 0.05;
        }
    }

    public static Decimal applyDiscount(Opportunity opp) {
        Decimal discountPercent = calculateDiscount(opp.Amount);
        Decimal discountAmount  = opp.Amount * discountPercent;
        opp.Discount__c = discountAmount;
        return discountAmount;
    }
}
