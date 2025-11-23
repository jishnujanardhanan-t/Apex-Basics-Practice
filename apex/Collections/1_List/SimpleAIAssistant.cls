public class SimpleAIAssistant {

    // Method to summarize an article
    public static String summarizeArticle(String article) {
        // Split article into sentences
        List<String> sentences = article.split('\\.'); // Split by period

        // Take first 2 sentences as a summary (simple logic)
        String summary = '';
        Integer maxSentences = 2; // number of sentences to include

        for (Integer i = 0; i < sentences.size() && i < maxSentences; i++) {
            summary += sentences[i].trim() + '. ';
        }

        // Return the summary
        return 'Summary: ' + summary.trim();
    }
    
    // Method to give a short AI-style response
    public static String assistantResponse(String task, String article) {
        if (task.toLowerCase() == 'summarize') {
            return summarizeArticle(article);
        } else {
            return 'Sorry, I can only summarize articles for now.';
        }
    }
}