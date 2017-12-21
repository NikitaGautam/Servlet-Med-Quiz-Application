package controller;

import domains.QuestionAnswer;
import service.QuestionAnswerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by Nikita on 9/19/16.
 */
@WebServlet(name = "QuestionAnswerServlet")
public class QuestionAnswerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        HttpSession session = request.getSession(false);
        if(page.equalsIgnoreCase("qaList")){
            if(session.getAttribute("user") != null) {

                redirectList(request, response);
            }
            else{
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        }
        else if(page.equalsIgnoreCase("editQA")){
            if(session.getAttribute("user") != null) {
                int id = Integer.parseInt(request.getParameter("qaId"));
                QuestionAnswer questionAnswer = new QuestionAnswerService().editQA(id);
                request.setAttribute("qa", questionAnswer);
                RequestDispatcher rd = request.getRequestDispatcher("questionAnswer/qaEdit.jsp");
                rd.forward(request, response);
            }
            else{
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        }
        else if(page.equalsIgnoreCase("deleteQA")){
            if(session.getAttribute("user") != null) {
                int id = Integer.parseInt(request.getParameter("qaId"));
                boolean res = new QuestionAnswerService().deleteQA(id);
                if (res) {
                    redirectList(request, response);
                }
            }
            else{
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }

        }

        else if(page.equalsIgnoreCase("updateQA")){
            if(session.getAttribute("user") != null) {
                QuestionAnswer questionAnswer = new QuestionAnswer();
                questionAnswer.setId(Integer.parseInt(request.getParameter("id")));
                questionAnswer.setQuestion(request.getParameter("question"));
                questionAnswer.setOption1(request.getParameter("option1"));
                questionAnswer.setOption2(request.getParameter("option2"));
                questionAnswer.setOption3(request.getParameter("option3"));
                questionAnswer.setOption4(request.getParameter("option4"));
                switch (Integer.parseInt(request.getParameter("correct_ans"))){
                    case 1:
                        questionAnswer.setCorrect_ans(questionAnswer.getOption1());
                        break;
                    case 2:
                        questionAnswer.setCorrect_ans(questionAnswer.getOption2());
                        break;
                    case 3:
                        questionAnswer.setCorrect_ans(questionAnswer.getOption3());
                        break;
                    case 4:
                        questionAnswer.setCorrect_ans(questionAnswer.getOption4());
                        break;
                    default:
                        break;
                }
                questionAnswer.setCategory(request.getParameter("category"));
                boolean res = new QuestionAnswerService().updateQA(questionAnswer);
                if (res) {
                    redirectList(request, response);
                }
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        }
        else if(page.equalsIgnoreCase("questionAddPage")){
            if(session.getAttribute("user") != null) {
                RequestDispatcher rd = request.getRequestDispatcher("questionAnswer/qaAdd.jsp");
                rd.forward(request, response);
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        }
        else if(page.equalsIgnoreCase("qaAdd")){
            if(session.getAttribute("user") != null) {
                QuestionAnswer questionAnswer = new QuestionAnswer();
                questionAnswer.setQuestion(request.getParameter("question"));
                questionAnswer.setOption1(request.getParameter("option1"));
                questionAnswer.setOption2(request.getParameter("option2"));
                questionAnswer.setOption3(request.getParameter("option3"));
                questionAnswer.setOption4(request.getParameter("option4"));
                switch (Integer.parseInt(request.getParameter("correct_ans"))){
                    case 1:
                        questionAnswer.setCorrect_ans(questionAnswer.getOption1());
                        break;
                    case 2:
                        questionAnswer.setCorrect_ans(questionAnswer.getOption2());
                        break;
                    case 3:
                        questionAnswer.setCorrect_ans(questionAnswer.getOption3());
                        break;
                    case 4:
                        questionAnswer.setCorrect_ans(questionAnswer.getOption4());
                        break;
                    default:
                        break;
                }

                questionAnswer.setCategory(request.getParameter("category"));
                boolean res = new QuestionAnswerService().createQA(questionAnswer);
                if (res) {
                    redirectList(request, response);
                }
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }

        }

    }

    public void redirectList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<QuestionAnswer> questionAnswerList = new QuestionAnswerService().getQAList();
        if (questionAnswerList !=null){
            request.setAttribute("qaList", questionAnswerList);
            RequestDispatcher rd = request.getRequestDispatcher("questionAnswer/qaLists.jsp");
            rd.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
