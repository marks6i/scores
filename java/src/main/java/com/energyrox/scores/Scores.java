package com.energyrox.scores;

import org.json.JSONObject;
import org.json.XML;

import java.io.InputStream;
import java.net.URL;

public class Scores {

    static final String baseball_scores_xml = "https://www.scorespro.com/rss2/live-baseball.xml";

    static String get() {
        final Scores scores = new Scores();
        return scores.getScores();
    }

    private String getScores() {
        try {

            URL url = new URL(baseball_scores_xml);
            InputStream is = url.openStream();
            int ptr;
            StringBuilder builder = new StringBuilder();
            while ((ptr = is.read()) != -1) {
                builder.append((char) ptr);
            }
            String xml = builder.toString();
            JSONObject obj = XML.toJSONObject(xml);
            return obj.toString(2);

        } catch (Exception e) {
            return "{ error: '" + e.getMessage() + "' }";
        }


    }
}
