package service;

import domains.QuestionAnswer;
import utils.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Nikita on 9/19/16.
 */
public class QuestionAnswerService {
    public List<QuestionAnswer> getQAList(){
        List<QuestionAnswer> qaList = new ArrayList<>();
        try {
            String query = "select * from questionAnswer";
            PreparedStatement pstm = new DatabaseConnection().getPreparedStatement(query);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                QuestionAnswer qa = new QuestionAnswer();
                qa.setId(rs.getInt("id"));
                qa.setQuestion(rs.getString("question"));
                qa.setOption1(rs.getString("option1"));
                qa.setOption2(rs.getString("option2"));
                qa.setOption3(rs.getString("option3"));
                qa.setOption4(rs.getString("option4"));
                qa.setCorrect_ans(rs.getString("correct_ans"));
                qa.setCategory(rs.getString("category"));
                qaList.add(qa);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return qaList;
    }

    public QuestionAnswer editQA(int id){
        QuestionAnswer questionAnswer = null;
        try {
            String query = "select * from questionAnswer where id=?";
            PreparedStatement pstm = new DatabaseConnection().getPreparedStatement(query);
            pstm.setString(1, String.valueOf(id));
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                questionAnswer = new QuestionAnswer();
                questionAnswer.setId(rs.getInt("id"));
                questionAnswer.setQuestion(rs.getString("question"));
                questionAnswer.setOption1(rs.getString("option1"));
                questionAnswer.setOption2(rs.getString("option2"));
                questionAnswer.setOption3(rs.getString("option3"));
                questionAnswer.setOption4(rs.getString("option4"));
                questionAnswer.setCorrect_ans(rs.getString("correct_ans"));
                questionAnswer.setCategory(rs.getString("category"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questionAnswer;

    }

    public boolean updateQA(QuestionAnswer questionAnswer){
        int result = 0;
        try {
            String query = "update questionAnswer set question=?,option1=?,option2=?,option3=?,option4=?,correct_ans=?,category=? where id=?";
            PreparedStatement pstm = new DatabaseConnection().getPreparedStatement(query);
            pstm.setString(1, questionAnswer.getQuestion());
            pstm.setString(2, questionAnswer.getOption1());
            pstm.setString(3, questionAnswer.getOption2());
            pstm.setString(4, questionAnswer.getOption3());
            pstm.setString(5, questionAnswer.getOption4());
            pstm.setString(6, questionAnswer.getCorrect_ans());
            pstm.setString(7, questionAnswer.getCategory());
            pstm.setString(8, String.valueOf(questionAnswer.getId()));
            result = pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (result != 0){
            return true;
        }
        else {
            return false;
        }


    }

    public boolean deleteQA(int id){
        boolean ret = false;
        try {
            String query = "delete from questionAnswer where id=?";
            PreparedStatement pstm = new DatabaseConnection().getPreparedStatement(query);
            pstm.setString(1, String.valueOf(id));
            ret = pstm.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(!ret){
            return true;
        }
        else {
            return false;
        }
    }

    public boolean createQA (QuestionAnswer questionAnswer){
        boolean ret = false;
        try {
            String query = "insert into questionAnswer(question,option1,option2,option3,option4,correct_ans,category) values (?,?,?,?,?,?,?)";
            PreparedStatement pstm = new DatabaseConnection().getPreparedStatement(query);
            pstm.setString(1, questionAnswer.getQuestion());
            pstm.setString(2, questionAnswer.getOption1());
            pstm.setString(3, questionAnswer.getOption2());
            pstm.setString(4, questionAnswer.getOption3());
            pstm.setString(5, questionAnswer.getOption4());
            pstm.setString(6, questionAnswer.getCorrect_ans());
            pstm.setString(7, questionAnswer.getCategory());
            ret = pstm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(!ret){
            return true;
        }
        else {
            return false;
        }
    }

}
